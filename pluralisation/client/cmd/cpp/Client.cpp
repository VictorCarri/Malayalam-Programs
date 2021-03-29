/** C++ versions of C headers **/
#include <cctype> // std::tolower
#include <cstddef> // std::size_t
#include <csignal> // SIGHUP, SIGINT, SIGQUIT, SIGTERM, SIGTSTP, SIGSEGV

/** Standard C++ **/

/* Headers that are only needed in debug builds */
#ifdef DEBUG
#include <ios> // std::boolalpha, std::ios_base::fmtflags
#endif

#include <iostream> // std::clog, std::endl, std::cin, std::cout
#include <string> // std::string
#include <algorithm> // std::transform, std::all_of
#include <iterator> // std::back_inserter
#include <sstream> // std::ostringstream
#include <memory> // std::make_unique
#include <string_view> // std::string_view
#include <iomanip> // std::quoted
#include <vector> // std::vector
#include <functional> // std::function

/* Boost */
#include <boost/asio/ip/tcp.hpp> // boost::asio::ip::tcp::resolver::results_type, boost::asio::ip::tcp::endpoint, boost::asio::ip::tcp::resolver
#include <boost/asio/write.hpp> // boost::asio::async_write
#include <boost/asio/connect.hpp> // boost::asio::async_connect
#include <boost/asio/read.hpp> // boost::asio::async_read
#include <boost/asio/buffer.hpp> // boost::asio::const_buffer
#include <boost/asio/read_until.hpp> // boost::asio::async_read_until
#include <boost/asio/streambuf.hpp> // boost::asio::streambuf::const_buffers_type
#include <boost/system/error_code.hpp> // boost::system::error_code
#include <boost/system/system_error.hpp> // boost::system::system_error
#include <boost/tuple/tuple.hpp> // boost::tuple, boost::tie, boost::tuples::ignore
#include <boost/logic/tribool.hpp> // boost::tribool

/* My Unicode utilities library */
#include "vuu/UTF8Validator.hpp" // vuu::UTF8Validator, to ensure that an std::string is valid UTF-8 text
#include "vuu/CodepointFinder.hpp" // vuu::CodepointFinder, to find a list of code-points in the UTF-8 string
#include "vuu/CodepointsInRange.hpp" // vuu::CodepointsInRange, to determine whether all code-points in the list are in the valid range for Malayalam

/* MPP library */
#include "mpp/Request.hpp" // mpp::Request, mpp::Request::Command
#include "mpp/RepParser.hpp" // mpp::RepParser::State
#include "mpp/Reply.hpp" // mpp::Reply, mpp::Reply::Status
#include "mpp/ver.hpp" // MPP version info

/* Our headers */
#include "bosmacros/any.hpp" // ANY_CLASS macro
#include "bosmacros/thread.hpp" // THREAD_CLASS macro
#include "Client.hpp" // Class def'n

/**
* @desc Tells the client that it should switch to a "active" state.
**/
void Client::start()
{
	#ifdef DEBUG
	std::clog << "Client::start: active = " << active << " before change" << std::endl;
	#endif
	active = true;
	#ifdef DEBUG
	std::clog << "Client::start: active = " << active << " after change" << std::endl;
	#endif
}

/**
* @desc Main constructor. Initialises the client to connect to a server on the given host and port.
* @param host The host to connect to.
* @param port The port on the host to connect to.
**/
Client::Client(const char* host, unsigned port) : active(false), // We start in an "inactive" state
input (), // Use std::string's default ctor
ioc (), // Use io_context's default ctor
signals (ioc, SIGHUP, SIGINT, SIGQUIT), // Construct signal set using io_context, and add 3 signals (the max)
resolver(ioc), // Construct the TCP/IP resolver we'll use
sock (ioc), // Construct the socket we'll use
sigMsgs { // Construct the map of signal values to strings
	{SIGHUP, "SIGHUP"},
	{SIGINT, "SIGINT"},
	{SIGQUIT, "SIGQUIT"},
	{SIGTERM, "SIGTERM"},
	{SIGTSTP, "SIGTSTP"},
	{SIGSEGV, "SIGSEGV"}
},
contentType("text/plain;charset=utf-8")
#ifdef DEBUG
, initFlags(std::clog.flags()) // Save original clog flags
#endif
{
	#ifdef DEBUG
	std::clog << std::boolalpha // Show booleans as strings
	<< "Client::Client: active = " << active << std::endl
	<< "\tinitFlags = " << initFlags << std::endl
	<< "\thost = " << std::quoted(host) << std::endl
	<< "\tport = " << port << std::endl;
	#endif

	/* Set up signal handling */
	signals.add(SIGTERM); // Couldn't fit in ctor
	signals.add(SIGTSTP); // Couldn't fit in ctor
	signals.add(SIGSEGV);
	signals.async_wait( // Handle signals when caught
		[this](const boost::system::error_code& bsec, int sigNo)
		{
			if (!bsec) // No error
			{
				active = false; // Stop the client immediately
				std::cout << "Client: signal handler lambda: caught " << sigMsgs[sigNo] << ", exiting..." << std::endl;
			}

			else // An error occurred
			{
				std::cerr << "Client::signal handler lambda: a system error occurred" << std::endl
				<< "\tValue = " << bsec.value() << std::endl
				<< "\tMessage = " << bsec.message() << std::endl
				<< "The operation " << (bsec.failed() ? "failed" : "didn't fail") << std::endl;
			}
		}
	);
	#ifdef DEBUG
	std::clog << "Client::Client: set up asynchronous wait on SIGHUP, SIGINT, SIGQUIT, SIGTERM, and SIGTSTP" << std::endl;
	#endif

	/* Set up the network connection */
	std::ostringstream portSS; // Used to convert port # to a string
	portSS << port;
	#ifdef DEBUG
	std::clog << "Client::Client: host is " << std::quoted(host) << std::endl;
	std::clog << "Client::Client: contents of port std::ostringstream are " << std::quoted(portSS.str()) << std::endl;
	#endif

	std::string_view hostView(host); // Convert host to a string_view for async_resolve
	std::string_view portView = portSS.str(); // Convert port string to a string view
	resolver.async_resolve(hostView, portView, [this, &host, &portSS](const boost::system::error_code& resErr, typename boost::asio::ip::tcp::resolver::results_type results)
		{
			if (!resErr) // No error
			{
				resolveResults = results; // Store the results
				#ifdef DEBUG
				std::cout << "Client::Client::resolver lambda: resolution results are: " << std::endl;
				int eNo = 1;

				for (boost::asio::ip::tcp::endpoint endpoint : resolveResults)
				{
					std::clog << "Endpoint #" << eNo << std::endl << "----------" << std::endl
					<< "\tAddress: " << endpoint.address().to_string() << std::endl
					<< "\tCapacity: " << endpoint.capacity() << std::endl
					<< "\tPort: " << endpoint.port() << std::endl
					<< "\tSize: " << endpoint.size() << std::endl << std::endl;
					++eNo;
				}
				#endif
			}

			else // Error occurred
			{
				std::cerr << "Client::resolver lambda: a system error occurred" << std::endl
				<< "\tValue = " << resErr.value() << std::endl
				<< "\tMessage = " << resErr.message() << std::endl
				<< "\tThe operation " << (resErr.failed() ? "failed" : "didn't fail") << std::endl
				<< "\tThe host name is " << std::quoted(host) << std::endl
				<< "\tThe port number " << std::quoted(portSS.str()) << std::endl;
			}
		}
	);
	workerThread = std::make_unique<THREAD_CLASS>( // Create the thread that keeps our I/O context running in the background
		[this]()
		{
			ioc.run(); // Run the I/O context so that work will run on this thread in the background
		}
	);
	signalThread = std::make_unique<THREAD_CLASS>( // Create the thread that runs the signal handler in the background
		[this]()
		{
			ioc.restart();
			ioc.run(); // Run the I/O context so that work will run on this thread in the background
		}
	);
}

/**
* @desc Default constructor. Initialises our state.
**/
Client::Client() : Client("127.0.0.1", 50001) // Connect to the default host and port
{
}

/**
* @desc Tells the caller whether or not the client is active.
* @return True if the client is active, false otherwise.
**/
bool Client::isActive() const
{
	#ifdef DEBUG
	std::clog << "Client::isActive: returning " << active << std::endl;
	#endif
	return active;
}

/**
* @desc Prompts the user for a Malayalam noun.
	It then fetches a space-terminated string and stores it in a property.
**/
void Client::readInput()
{
	std::cout << "Please enter a Malayalam noun to send to the server in ISSING and FOF queries." << std::endl // Inform the user
	<< "You may also type \"quit\" or \"exit\" (case-insensitive) to exit the client" << std::endl
	<< "mpp-client-" << major << "-" << minor << "-" << patch << ">"; // Print the prompt
	std::cin >> input; // Get input
}

/**
* @desc Determines whether or not the user has requested that we quit, based on the value of $input.
* @return True if the user has requested that we quit, false otherwise.
**/
bool Client::shouldQuit() const
{
	std::string inputLower = toLower(input); // Convert the string to lowercase to ease comparison

	#ifdef DEBUG
	std::clog << "Client::shouldQuit: lowered input = " << std::quoted(inputLower) << std::endl;
	#endif

	bool isEmpty = input.empty();
	bool inputIsQuit = (inputLower == "quit");
	bool inputIsExit = (inputLower == "exit");

	#ifdef DEBUG
	std::clog << "Client::shouldQuit: isEmpty = " << isEmpty << std::endl
	<< "\tinputIsQuit = " << inputIsQuit << std::endl
	<< "\tinputIsExit = " << inputIsExit << std::endl;
	#endif

	/*
	 Either:
	* ------------
	* a) There is input and it's a request to quit
	* b) Our signal handler called quit() after handling a signal.
	*/
	bool toReturn = (!isEmpty && (inputIsQuit || inputIsExit) ) || !active;

	#ifdef DEBUG
	std::clog << "Client::shouldQuit: toReturn = (" << !isEmpty << " && (" << inputIsQuit << " || " << inputIsExit << ") ) || " << !active << ") = " << toReturn << std::endl;
	#endif

	return toReturn;
}

/**
* @desc Creates and returns a copy of the given string with all alphabetic characters converted to lowercase.
* @param toChange The string to create a lowercase copy of.
* @return A copy of the given parameter with all alphabetic characters converted to lowercase.
**/
std::string Client::toLower(const std::string toChange) const
{
	std::string toReturn;
	
	#ifdef DEBUG
	std::clog << "Client::toLower: toReturn = " << std::quoted(toReturn) << " at beginning" << std::endl;
	#endif

	std::transform(toChange.cbegin(), toChange.cend(), std::back_inserter(toReturn), [](unsigned char c) -> char
		{
			#ifdef DEBUG
			std::clog << "Client::toLower::lambda 1: c = '" << c << "'" << std::endl;
			#endif
			char lowered = static_cast<char>(std::tolower(c)); // Convert the character to lowercase if it's alphabetic, and return it unchanged otherwise
			#ifdef DEBUG
			std::clog << "Client::toLower::lambda 1: lowered = '" << lowered << "'" << std::endl;
			#endif
			return lowered;
		}
	);

	#ifdef DEBUG
	std::clog << "Client::toLower: toReturn = " << std::quoted(toReturn) << " at end" << std::endl;
	#endif

	return toReturn;
}

/**
* @desc Tells the client to quit.
**/
void Client::quit()
{
	#ifdef DEBUG
	std::clog << "Client::quit: active = " << active << " before change" << std::endl;
	#endif
	std::cout << "Exiting..." << std::endl;
	active = false;
	#ifdef DEBUG
	std::clog << "Client::quit: active = " << active << " after change" << std::endl;
	#endif
}

/**
* @desc Fetches the current input string.
* @return The current input string.
**/
std::string Client::getInput() const
{
	return input;
}

/**
* @desc Checks whether or not the input string is a valid UTF-8 string.
* @return True if the input string is a valid UTF-8 string, false otherwise.
**/
bool Client::isInputValidUTF8() const
{
	return std::all_of(input.cbegin(), input.cend(), vuu::UTF8Validator());
}

/**
* @desc Determines whether or not the input string contains only Malayalam codepoints.
* @return True if the input string contains only Malayalam codepoints, false otherwise.
**/
bool Client::isInputValidMalayalam() const
{
	vuu::CodepointFinder vcf = std::for_each(input.cbegin(), input.cend(), vuu::CodepointFinder()); // Find a list of code-points in the string
	return std::all_of(vcf.cbegin(), vcf.cend(), vuu::CodepointsInRange(0x0D00, 0x0D7F)); // Ensure that all code-points are in the valid range for Malayalam
}

/**
* @desc Determines whether or not the current noun is singular by sending a request to the server.
* @param issingCallback A callback that will be called once the entire chain of asynchronous operations finishes.
* @return True if the noun is singular, false otherwise.
**/
void Client::isSingular(std::function<void(bool, std::string)> issingCallback)
{
	isCB = issingCallback; // Save the callback for later

	#ifdef DEBUG
	int eNo = 1; // Endpoint #

	for (boost::asio::ip::tcp::endpoint endpoint : resolveResults)
	{
		std::clog << "Client::isSingular: details on endpoint #" << eNo << std::endl
		<< "\tAddress: " << endpoint.address().to_string() << std::endl
		<< "\tCapacity: " << endpoint.capacity() << std::endl
		<< "\tPort: " << endpoint.port() << std::endl
		<< "\tSize: " << endpoint.size() << std::endl;
		++eNo;
	}
	#endif

	boost::asio::async_connect(sock, resolveResults, [this](const boost::system::error_code& acErr, const boost::asio::ip::tcp::endpoint& ep)
		{
			if (!acErr) // No error
			{
				#ifdef DEBUG
				std::cout << "Client::isSingular::lambda async_connect succeeded." << std::endl
				<< "\tEndpoint address: " << ep.address().to_string() << std::endl
				<< "\tEndpoint capacity: " << ep.capacity() << std::endl
				<< "\tEndpoint port: " << ep.port() << std::endl
				<< "\tEndpoint size: " << ep.size() << std::endl;
				#endif
				sendSingReq(); // Send the ISSING request to the server
			}

			else // Error occurred
			{
				std::cerr << "Client::isSingular::async_connect lambda: a system error occurred" << std::endl
				<< "\tValue = " << acErr.value() << std::endl
				<< "\tMessage = " << std::quoted(acErr.message()) << std::endl
				<< "\tThe operation " << (acErr.failed() ? "failed" : "didn't fail") << std::endl
				<< "\tAddress: " << ep.address().to_string() << std::endl
				<< "\tCapacity: " << ep.capacity() << std::endl
				<< "\tPort: " << ep.port() << std::endl;
			}
		}
	);

	#ifdef DEBUG
	std::cout << "Client::isSingular ending" << std::endl;
	#endif
}

/**
* @desc Destructor. Performs 3 functions:
*	1) In debug mode, it resets cout's flags.
*	2) In all modes, it closes our socket.
*	3) In all modes, it waits for our thread to join.
**/
Client::~Client()
{
	#ifdef DEBUG
	std::clog.flags(initFlags); // Reset flags
	std::cout << "Client::~Client starting." << std::endl;
	#endif

	#ifdef DEBUG
	std::cout << "Client::~Client: stopping the I/O context for async ops" << std::endl;
	#endif
	ioc.stop(); // Stop any pending operations. Must be called so that our worker thread will be able to stop running.
	#ifdef DEBUG
	std::cout << "Client::~Client: stopped I/O context for async ops." << std::endl;
	#endif

	#ifdef DEBUG
	std::cout << "Client::~Client: waiting for worker thread to join." << std::endl;
	#endif
	workerThread->join();
	#ifdef DEBUG
	std::cout << "Client::~Client: worker thread has joined." << std::endl;
	#endif

	#ifdef DEBUG
	std::cout << "Client::~Client: waiting for signal-handling thread to join." << std::endl;
	#endif
	signalThread->join();
	#ifdef DEBUG
	std::cout << "Client::~Client: signal thread has joined." << std::endl
	<< "Client::~Client ending." << std::endl;
	#endif
}

/**
* @desc A callback that handles a successful connection to the server for an ISSING request by sending that request.
**/
void Client::sendSingReq()
{
	#ifdef DEBUG
	std::cout << "Client::sendSingReq: callback called from isSing lambda." << std::endl;
	#endif

	/* Build the request */
	curReq.SETCOM_FUNC(mpp::Request::ISSING); // Use whatever command we were given
	curReq.clearHeaders(); // Clear any headers that were set for the last request
	curReq.addHeader("Content-Type", contentType); // The noun is a plaintext UTF-8 string
	curReq.addHeader("Content-Length", input.length()); // The server's parser needs to know how long the string is to read it over the network
	curReq.setNoun(input); // The noun to send is our input
	#ifdef DEBUG
	std::cout << "Client::sendSingReq: curRequest to send is " << std::endl
	<< curReq
    << std::endl;
	#endif
	reqBufs = curReq.toBuffers(); // Store the buffers in a member variable so that they won't go out of scope before the asynchronous write completes

	#ifdef DEBUG
	std::cout << "Client::sendSingReq: buffers are: " << std::endl;

	/* Print the buffers' contents, just in case */
	for (boost::asio::const_buffer buf : reqBufs)
	{
		std::size_t bufSiz = buf.size();
		const unsigned char* bufDat = static_cast<const unsigned char*>(buf.data());
		
		for (std::size_t i = 0; i < bufSiz; i++)
		{
			std::cout << bufDat[i];
		}

		std::cout << std::endl;
	}

	std::cout << std::endl;
	#endif

	boost::asio::async_write(sock, reqBufs, [this](const boost::system::error_code& ec, std::size_t bytesTransferred)
		{
			if (!ec) // No error
			{
				#ifdef DEBUG
				std::cout << "Client::sendSingReq::lambda: sent " << bytesTransferred << " bytes" << std::endl
				<< "\tRequest was " << curReq.size() << " bytes long" << std::endl;
				#endif
				
				if (bytesTransferred < curReq.size()) // The entire request wasn't sent
				{
					std::cerr << "Client::sendSingReq::lambda: only " << bytesTransferred << " bytes of a request that was " << curReq.size() << " bytes long were transferred." << std::endl;
				}

				else
				{
					#ifdef DEBUG
					std::cout << "Client::sendSingReq::lambda: calling readSingRepStatus" << std::endl;
					#endif

					/* We pass the command because each type of request elicits different possible responses */
					readSingRepStatus();
				}
			}

			else // An error occurred
			{
				std::cerr << "Client::sendSingReq::lambda: an error occurred while sending the request to the server." << std::endl
				<< "\tError value = " << ec.value() << std::endl
				<< "\tError message = " << std::quoted(ec.message()) << std::endl
				<< "\tThe operation " << (ec.failed() ? "failed" : "didn't fail") << std::endl;
			}
		}
	);
}

/**
* @desc Called after the ISSING request has been sent.
*	It reads the status line, and then decides how to proceed.
**/
void Client::readSingRepStatus()
{
	#ifdef DEBUG
	std::cout << "Client::readSingRepStatus running." << std::endl;
	#endif
	boost::asio::async_read_until(sock, repBuf, "\r\n", [this](const boost::system::error_code& ec, std::size_t bytesTrans)
		{
			if (!ec) // No error
			{
				typename boost::asio::streambuf::const_buffers_type datBufs = repBuf.data();
				std::ostringstream dataSS; // Used to convert the data to a single string
				std::size_t bytesInserted = 0; // # of bytes inserted into the stringstream
				#ifdef DEBUG
				std::size_t bufNum = 1;
				#endif

				for (boost::asio::const_buffer buf : datBufs)
				{
					const char* curBufDat = static_cast<const char*>(buf.data()); // Fetch the data as a C string
					#ifdef DEBUG
					std::cout << "Client::readSingRepStatus::lambda: # of bytes inserted @ beginning of for = " << bytesInserted << std::endl
					<< "\tCurrent buffer's contents are: \"";
					#endif
					std::size_t curBufSiz = buf.size();
					#ifdef DEBUG
					std::cout << "\tCurrent buffer's size = " << curBufSiz << std::endl;
					#endif

					for (std::size_t i = 0; i < curBufSiz; i++)
					{
						#ifdef DEBUG
						std::cout << "buffers[" << bufNum << "][" << i << "] = '" << curBufDat[i] << "'" << std::endl
						<< "# of bytes inserted = " << bytesInserted << std::endl
						<< "# of bytes transferred = " << bytesTrans << std::endl
						<< "dataSS contents = " << std::quoted(dataSS.str()) << std::endl;
						#endif

						if (bytesInserted < bytesTrans) // Can still insert data
						{
							dataSS << curBufDat[i];
							++bytesInserted;
						}
					}

					#ifdef DEBUG
					std::cout << "\"" << std::endl
					<< "Client::readSingRepStatus::lambda: no error: buf-reading for loop: # of bytes inserted = " << bytesInserted << std::endl;
					++bufNum;
					#endif
				}

				std::string data = dataSS.str();

				#ifdef DEBUG
				std::cout << "Client::readSingRepStatus::lambda: successfully read " << bytesTrans << " bytes of data" << std::endl
				<< "dataSS contents = " << std::quoted(dataSS.str()) << std::endl;
				#endif
	
				/* Parse the status line */
				boost::tribool parseRes;
				repParser.reset(); // Start the parser in its initial state
				#ifdef DEBUG
				std::cout << "Client::readSingRepStatus::lambda: data to parse: " << data << std::endl;
				#endif
				boost::tie(parseRes, boost::tuples::ignore) = repParser.parse(rep, data.cbegin(), data.cend()); // Parse the data in the buffer, but only up to the number of bytes transferred

				if (parseRes) // Entire request parsed - how?!
				{
					#ifdef DEBUG
					std::cout << "Client::readSingRepStatus::lambda: reply parser claims to have parsed an entire response! How?!" << std::endl;
					#endif
				}

				else if (!parseRes) // Invalid status line - possible
				{
					std::cerr << "Client::readSingRepStatus::lambda: invalid status line found!" << std::endl;

					#ifdef DEBUG
					mpp::RepParser::State parserStat = repParser.getState(); // To find out where the error occurred
					std::cerr << "\tStatus: " << repParser.getStateName(parserStat) << std::endl;
					#endif
				}

				else // Indeterminate - what should happen
				{
					#ifdef DEBUG
					std::cout << "Client::readSingRepStatus::lambda: need to read more data to finish parsing the reply, as expected" << std::endl;
					#endif

					mpp::Reply::Status repStat = rep.getStatus(); // Check the parsed status

					if (repStat != mpp::Reply::singular && repStat != mpp::Reply::plural) // Not a valid response to an ISSING request
					{
						std::cerr << "Client::readSingRepStatus::lambda: error: response is not for an ISSING request." << std::endl;
						handleReply(); // Cleanup
					}

					else // Valid response
					{
						std::size_t offset = 0;
						repBuf.consume(bytesTrans + offset); // Consume the data & the \r\n before the next async_read, so that it won't return immediately upon seeing them
						repParser.setState(mpp::RepParser::header_name); // We expect a header next
						readHeader(); // Try to read a header, then check for more
					}
				}
			}

			else // An error occurred
			{
				std::cerr << "Client::readSingRepStatus::lambda: an error occurred while reading the server's response." << std::endl
				<< "\tError value = " << ec.value() << std::endl
				<< "\tError message = " << std::quoted(ec.message()) << std::endl
				<< "\tThe operation " << (ec.failed() ? "failed" : "didn't fail") << std::endl;
			}
		}
	);
	#ifdef DEBUG
	std::cout << "Client::readSingRepStatus finished." << std::endl;
	#endif
}

/**
* @desc Reads a header from the socket and stores it in the reply.
**/
void Client::readHeader()
{
	#ifdef DEBUG
	std::cout << "Client::readHeader starting" << std::endl;
	#endif

	boost::asio::async_read_until(sock, repBuf, "\r\n", [this](const boost::system::error_code& ec, std::size_t bytesTrans)
		{
			if (!ec) // No error
			{
				#ifdef DEBUG
				std::cout << "Client::readHeader: successfully transferred " << bytesTrans << " bytes" << std::endl;
				#endif

				typename boost::asio::streambuf::const_buffers_type datBufs = repBuf.data();
				std::ostringstream dataSS; // Used to convert the data to a single string
				std::size_t bytesInserted = 0; // # of bytes inserted into the stringstream
				#ifdef DEBUG
				std::size_t bufNum = 1;
				#endif

				for (boost::asio::const_buffer buf : datBufs)
				{
					const char* curBufDat = static_cast<const char*>(buf.data()); // Fetch the data as a C string
					#ifdef DEBUG
					std::cout << "Client::readHeader::lambda: current buffer's contents are: \"";
					#endif
					std::size_t curBufSiz = buf.size();

					for (std::size_t i = 0; i < curBufSiz; i++)
					{
						#ifdef DEBUG
						std::cout << "buffers[" << bufNum << "][" << i << "] = '" << curBufDat[i] << "'" << std::endl
						<< "# of bytes inserted = " << bytesInserted << std::endl
						<< "# of bytes transferred = " << bytesTrans << std::endl
						<< "dataSS contents = " << std::quoted(dataSS.str()) << std::endl;
						#endif

						if (bytesInserted < bytesTrans) // Can still insert data
						{
							dataSS << curBufDat[i];
							++bytesInserted;
						}
					}

					#ifdef DEBUG
					std::cout << "\"" << std::endl
					<< "Client::readSingRepStatus::lambda: no error: buf-reading for loop: # of bytes inserted = " << bytesInserted << std::endl;
					++bufNum;
					#endif
				}

				std::string data = dataSS.str();

				#ifdef DEBUG
				std::cout << "Client::readHeader::lambda: successfully read " << bytesTrans << " bytes of data" << std::endl;
				#endif

				if (data == "\r\n") // No more headers, only content
				{
					std::cout << "Client::readHeader: found '\\r\\n' while parsing headers, handling reply." << std::endl;
					handleReply();
				}

				else
				{
					/* Parse the header line */
					boost::tribool parseRes;
					#ifdef DEBUG
					std::cout << "Client::readHeader::lambda: data to parse: " << data << std::endl;
					#endif
					boost::tie(parseRes, boost::tuples::ignore) = repParser.parse(rep, data.cbegin(), data.cend()); // Parse the data in the buffer, but only up to the number of bytes transferred
	
					if (parseRes) // Successfully parsed an entire reply - possible
					{
						#ifdef DEBUG
						std::cout << "Client::readHeader: successfully parsed an entire reply." << std::endl;
						#endif
						repParser.storeHeader(rep); // Store the header in the reply
						repBuf.consume(bytesTrans); // Consume the data we read so that we won't get stuck in a loop reading it forever
					}
	
					else if (!parseRes) // Malformed reply - possible
					{
						#ifdef DEBUG
						std::cout << "Client::readHeader: the reply is malformed." << std::endl;
						#endif
					}
	
					else // More data needed - possible
					{
						#ifdef DEBUG
						std::cout << "Client:: readHeader: need more data to finish parsing the reply." << std::endl;
						#endif
						repParser.storeHeader(rep); // Store the header in the reply
						repBuf.consume(bytesTrans); // Consume the data we read so that we won't get stuck in a loop reading it forever
						readHeader(); // Try to read another header. If we see an empty line, we know that there's nothing more to read but content
					}
				}
			}

			else // An error occurred
			{
				std::cerr << "Client::readHeader::lambda: an error occurred while reading the server's response." << std::endl
				<< "\tError value = " << ec.value() << std::endl
				<< "\tError message = " << std::quoted(ec.message()) << std::endl
				<< "\tThe operation " << (ec.failed() ? "failed" : "didn't fail") << std::endl;
			}
		}
	);

	#ifdef DEBUG
	std::cout << "Client::readHeader ending" << std::endl;
	#endif
}

/**
* Handles the reply from the server.
**/
void Client::handleReply()
{
	resetVars(); // For the next chain of sends/receives

	mpp::Reply::Status repStat = rep.getStatus();

	switch (repStat)
	{
		/* Reply to an ISSING request */
		case mpp::Reply::singular:
		{
			isCB(true, input);
			break;
		}

		case mpp::Reply::plural:
		{
			isCB(false, input);
			break;
		}

		/* Handle client errors */
		case mpp::Reply::badReq:
		{
			std::cerr << "The request was malformed." << std::endl;
			break;
		}

		case mpp::Reply::badMajor:
		{
			std::cerr << "The server didn't recognize the major version #" << mpp::VER_MAJOR << std::endl;
			break;
		}

		case mpp::Reply::badMinor:
		{
			std::cerr << "The server didn't recognize the minor version #" << mpp::VER_MINOR << std::endl;
			break;
		}

		case mpp::Reply::badPatch:
		{
			std::cerr << "The server didn't recognize the patch version #" << mpp::VER_PATCH << std::endl;
			break;
		}

		case mpp::Reply::unknownVerb:
		{
			mpp::Request::Command c = curReq.GETCOM_FUNC(); // Fetch the current command
			
			switch (c)
			{
				case mpp::Request::ISSING:
				{
					std::cerr << "The server claims not to understand an ISSING request." << std::endl;
					break;
				}

				case mpp::Request::FOF:
				{
					std::cerr << "The server claims not to understand a FOF request." << std::endl;
					break;
				}

				case mpp::Request::INVALID:
				{
					std::cerr << "The client tried to send an invalid request to the server." << std::endl;
					break;
				}
			}
	
			break;
		}

		case mpp::Reply::invUTF8:
		{
			std::cerr << "The input string " << std::quoted(input) << " isn't fully valid UTF-8" << std::endl;
			break;
		}
			
		default:
		{
			std::cout << "Unknown reply status " << repStat << std::endl;
		}
	}
}

/**
* @desc Finds the opposite form of a given noun.
* @param fofCallback A callback that will be called once the chain of asynchronous operations involved in a FOF request finishes successfully.
**/
void Client::findOppositeForm(std::function<void(std::string)> fofCallback)
{
	fofCB = fofCallback; // Save the callback for later

	#ifdef DEBUG
	int eNo = 1; // Endpoint #

	for (boost::asio::ip::tcp::endpoint endpoint : resolveResults)
	{
		std::clog << "Client::findOppositeForm: details on endpoint #" << eNo << std::endl
		<< "\tAddress: " << endpoint.address().to_string() << std::endl
		<< "\tCapacity: " << endpoint.capacity() << std::endl
		<< "\tPort: " << endpoint.port() << std::endl
		<< "\tSize: " << endpoint.size() << std::endl;
		++eNo;
	}
	#endif

	boost::asio::async_connect(sock, resolveResults, [this](const boost::system::error_code& acErr, const boost::asio::ip::tcp::endpoint& ep)
		{
			if (!acErr) // No error
			{
				#ifdef DEBUG
				std::cout << "Client::findOppositeForm::lambda async_connect succeeded." << std::endl
				<< "\tEndpoint address: " << ep.address().to_string() << std::endl
				<< "\tEndpoint capacity: " << ep.capacity() << std::endl
				<< "\tEndpoint port: " << ep.port() << std::endl
				<< "\tEndpoint size: " << ep.size() << std::endl;
				#endif
				sendFofReq(); // Send the FOF request to the server
			}

			else // Error occurred
			{
				std::cerr << "Client::findOppositeForm::async_connect lambda: a system error occurred" << std::endl
				<< "\tValue = " << acErr.value() << std::endl
				<< "\tMessage = " << std::quoted(acErr.message()) << std::endl
				<< "\tThe operation " << (acErr.failed() ? "failed" : "didn't fail") << std::endl
				<< "\tAddress: " << ep.address().to_string() << std::endl
				<< "\tCapacity: " << ep.capacity() << std::endl
				<< "\tPort: " << ep.port() << std::endl;
			}
		}
	);

	#ifdef DEBUG
	std::cout << "Client::findOppositeForm ending" << std::endl;
	#endif
}

/**
* @desc Sends the FOF request to the server after findOppositeForm establishes a connection.
**/
void Client::sendFofReq()
{
	#ifdef DEBUG
	std::cout << "Client::sendFofReq: callback called from findOppositeForm lambda." << std::endl;
	#endif

	/* Build the request */
	curReq.SETCOM_FUNC(mpp::Request::FOF); // Issue a request to find the opposite form
	curReq.clearHeaders(); // Clear any headers that were set for the last request
	curReq.addHeader("Content-Type", contentType); // The noun is a plaintext UTF-8 string
	curReq.addHeader("Content-Length", input.length()); // The server's parser needs to know how long the string is to read it over the network
	curReq.setNoun(input); // The noun to send is our input
	#ifdef DEBUG
	std::cout << "Client::sendFofReq: curRequest to send is " << std::endl
	<< curReq
    << std::endl;
	#endif
	reqBufs = curReq.toBuffers(); // Store the buffers in a member variable so that they won't go out of scope before the asynchronous write completes

	#ifdef DEBUG
	std::cout << "Client::sendFofReq: buffers are: " << std::endl;

	/* Print the buffers' contents, just in case */
	for (boost::asio::const_buffer buf : reqBufs)
	{
		std::size_t bufSiz = buf.size();
		const unsigned char* bufDat = static_cast<const unsigned char*>(buf.data());
		
		for (std::size_t i = 0; i < bufSiz; i++)
		{
			std::cout << bufDat[i];
		}

		std::cout << std::endl;
	}

	std::cout << std::endl;
	#endif

	boost::asio::async_write(sock, reqBufs, [this](const boost::system::error_code& ec, std::size_t bytesTransferred)
		{
			if (!ec) // No error
			{
				#ifdef DEBUG
				std::cout << "Client::sendFofReq::lambda: sent " << bytesTransferred << " bytes" << std::endl
				<< "\tRequest was " << curReq.size() << " bytes long" << std::endl;
				#endif
				
				if (bytesTransferred < curReq.size()) // The entire request wasn't sent
				{
					std::cerr << "Client::sendFofReq::lambda: only " << bytesTransferred << " bytes of a request that was " << curReq.size() << " bytes long were transferred." << std::endl;
				}

				else
				{
					#ifdef DEBUG
					std::cout << "Client::sendFofReq::lambda: sent request." << std::endl;
					#endif
				}
			}

			else // An error occurred
			{
				std::cerr << "Client::sendFofReq::lambda: an error occurred while sending the request to the server." << std::endl
				<< "\tError value = " << ec.value() << std::endl
				<< "\tError message = " << std::quoted(ec.message()) << std::endl
				<< "\tThe operation " << (ec.failed() ? "failed" : "didn't fail") << std::endl;
			}
		}
	);
}

/**
* @desc Resets our socket and reply buffer. Called at the end of each request and on destruction.
**/
void Client::resetVars()
{
	try
	{
		sock.close(); // Close the socket
		sock.shutdown(boost::asio::ip::tcp::socket::shutdown_both); // Shutdown any pending sends or receives
	}

	catch (boost::system::system_error& bsse) // Error while resetting socket
	{
		std::cerr << "Error while resetting socket: " << bsse.what()  << std::endl;
	}

       	repBuf.consume(repBuf.size()); // Clear all data read from the previous response. Doesn't throw, according to docs.
	#ifdef DEBUG
	std::cout << "Client::resetVars: repBuf's size is " << repBuf.size() << " after its contents were consumed." << std::endl;
	#endif
}

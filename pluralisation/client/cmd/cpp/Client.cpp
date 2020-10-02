/** C++ versions of C headers **/
#include <cctype> // std::tolower
#include <cstddef> // std::size_t
#include <csignal> // SIGHUP, SIGINT, SIGQUIT, SIGTERM, SIGTSTP

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

/* Boost */
#include <boost/asio.hpp> // boost::asio::ip::tcp::endpoint, boost::asio::ip::tcp::resolver, boost::asio::async_write, boost::asio::async_connect, boost::asio::async_read, boost::asio::mutable_buffer
#include <boost/system/error_code.hpp> // boost::system::error_code
#include <boost/system/system_error.hpp> // boost::system::system_error

/* My Unicode utilities library */
#include "vuu/UTF8Validator.hpp" // vuu::UTF8Validator, to ensure that an std::string is valid UTF-8 text
#include "vuu/CodepointFinder.hpp" // vuu::CodepointFinder, to find a list of code-points in the UTF-8 string
#include "vuu/CodepointsInRange.hpp" // vuu::CodepointsInRange, to determine whether all code-points in the list are in the valid range for Malayalam

/* MPP library */
#include "mpp/Request.hpp" // mpp::Request
#include "mpp/Reply.hpp" // mpp::Reply

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
	{SIGTSTP, "SIGTSTP"}
}
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
	signals.async_wait( // Handle signals when caught
		[this](const boost::system::error_code& bsec, int sigNo)
		{
			if (!bsec) // No error
			{
				active = false; // Stop the client immediately
				std::cout << "Client: signal handler lambda: caught " << sigMsgs[sigNo] << ", exiting..." << std::endl;
				#ifdef DEBUG
				#endif
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
			ioc.run(); // Run the I/O context so that Asio will run
		}
	);
}

/**
* @desc Default constructor. Initialises our state.
**/
Client::Client() : Client(std::string("127.0.0.1").c_str(), 50001) // Connect to the default host and port
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
*	It then fetches a space-terminated string and stores it in a property.
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

	boost::asio::async_connect(sock, resolveResults, [this](boost::system::error_code acErr, boost::asio::ip::tcp::endpoint ep)
		{
			if (!acErr) // No error
			{
				#ifdef DEBUG
				std::cout << "Client::isSingular: async_connect succeeded." << std::endl
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
	/*boost::asio::post(ioc, [this]()
		{
			try
			{
				sock.shutdown(boost::asio::ip::tcp::socket::shutdown_both); // Shutdown both the send and receive parts of the socket
				sock.close(); // Close our socket
				resolver.cancel(); // Cancel any pending resolution operations
				signals.cancel(); // Cancel any pending signal-handling operations
			}
		}
	);*/ // Destructors close the socket, cancel any pending resolution operations, and cancel any pending signal-handling operations
	#ifdef DEBUG
	std::cout << "Client::~Client: stopping our I/O context" << std::endl;
	#endif
	ioc.stop(); // Stop any pending operations. Must be called so that our worker thread will be able to stop running.
	#ifdef DEBUG
	std::cout << "Client::~Client: waiting for worker thread to join." << std::endl;
	#endif
	workerThread->join();
	#ifdef DEBUG
	std::cout << "Client::~Client: worker thread has joined." << std::endl;
	#endif
}

/**
* @desc A callback that handles a successful connection to the server.
*	As its name implies, it sends the ISSING request to the server.
**/
void Client::sendSingReq()
{
	#ifdef DEBUG
	std::cout << "Client::sendSingReq: callback called from isSing lambda." << std::endl;
	#endif

	/* Build the request */
	curReq.SETCOM_FUNC(mpp::Request::ISSING); // Make it an ISSING curRequest
	curReq.setNoun(input); // The noun to send is our input
	curReq.clearHeaders(); // Clear any headers that were set for the last request
	curReq.addHeader("Content-Type", std::string("text/plain")); // The noun is a plaintext string
	curReq.addHeader("Content-Length", input.length()); // The server's parser needs to know how long the string is to read it over the network
	#ifdef DEBUG
	std::cout << "Client::sendSingReq: curRequest to send is " << std::endl
	<< curReq;
	#endif
	reqBufs = curReq.toBuffers(); // Store the buffers in a member variable so that they won't go out of scope before the asynchronous write completes
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
					std::cout << "Client::sendSingReq::lambda: calling readSingRep" << std::endl;
					#endif
					readSingRep(); // Read the reply from the server.
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
* @desc A callback that handles having successfully sent our request to the server.
*	It attempts to read the server's response over the network to construct a Response object
*	using the MPP library's RepParser class.
**/
void Client::readSingRep()
{
	#ifdef DEBUG
	std::cout << "Client::readSingRep running." << std::endl;
	#endif
	repBufs.clear(); // Clear any old buffers
	boost::asio::async_read(sock, repBufs, [this](const boost::system::error_code& ec, std::size_t bytesTransferred)
		{
			if (!ec) // No error
			{
				#ifdef DEBUG
				std::cout << "Client::readSingRep::lambda: no error" << std::endl
				<< "\tRead " << bytesTransferred << " bytes" << std::endl
				<< "Data is: " << std::endl << std::endl;

				for (boost::asio::mutable_buffer buf : repBufs)
				{
					std::cout << static_cast<char*>(buf.data());
				}
				#endif
			}

			else // An error occurred
			{
				std::cerr << "Client::readSingRep::lambda: an error occurred while reading the reply from the server." << std::endl
				<< "\tError value = " << ec.value() << std::endl
				<< "\tError message = " << std::quoted(ec.message()) << std::endl
				<< "\tThe operation " << (ec.failed() ? "failed" : "didn't fail") << std::endl;
			}
		}
	);
}

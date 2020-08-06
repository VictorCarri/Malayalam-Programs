/** C headers **/
#include <signal.h> // SIGHUP, SIGINT, SIGQUIT, SIGTERM, SIGTSTP

/** C++ versions of C headers **/
#include <cctype> // std::tolower
#include <cstddef> // std::size_t

/** Standard C++ **/

/* Headers that are only needed in debug builds */
#ifdef DEBUG
#include <ios> // std::boolalpha, std::ios_base::fmtflags
#include <iomanip> // std::quoted
#endif

#include <iostream> // std::clog, std::endl, std::cin
#include <string> // std::string
#include <algorithm> // std::transform, std::all_of
#include <iterator> // std::back_inserter
#include <sstream> // std::istringstream
#include <memory> // std::make_unique

/* Boost */
#include <boost/asio/placeholders.hpp> // boost::asio::placeholders::error, boost::asio::placeholders::signal_number, boost::asio::placeholders::endpoint
#include <boost/asio/connect.hpp> // boost::asio::async_connect
#include <boost/asio/ip/tcp.hpp> // boost::asio::ip::tcp::socket, boost::asio::ip::tcp::endpoint
#include <boost/asio/write.hpp> // boost::asio::buffer, boost::asio::async_write
#include <boost/asio/connect.hpp> // boost::asio::async_connect
#include <boost/asio/read.hpp> // boost::asio::async_read

/* My Unicode utilities library */
#include "vuu/UTF8Validator.hpp" // vuu::UTF8Validator, to ensure that an std::string is valid UTF-8 text
#include "vuu/CodepointFinder.hpp" // vuu::CodepointFinder, to find a list of code-points in the UTF-8 string
#include "vuu/CodepointsInRange.hpp" // vuu::CodepointsInRange, to determine whether all code-points in the list are in the valid range for Malayalam

/* MPP library */
#include "mpp/Request.hpp" // mpp::Request

/* Our headers */
#include "bosmacros/any.hpp" // ANY_CLASS macro
#include "BindFunc.hpp" // BIND_FUNCTION macro
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
Client::Client(char* host, short port) : active(false), // We start in an "inactive" state
input (), // Use std::string's default ctor
ioc (), // Use io_context's default ctor
signals (ioc, SIGHUP, SIGINT, SIGQUIT), // Construct signal set using io_context, and add 3 signals (the max)
sock (ioc), // Construct the socket we'll use
resolver(ioc), // Construct the TCP/IP resolver we'll use
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
	<< "\tinitFlags = " << initFlags << std::endl;
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
				std::cout << "Client: caught " << sigMsgs[sigNo] << ", exiting..." << std::endl;
				#ifdef DEBUG
				#endif
			}

			else // An error occurred
			{
				std::cerr << "Client::signal handler lambda: a sytem error occurred" << std::endl
				<< "\tValue = " << bsec.value() << std::endl
				<< "\tMessage = " << bsec.message() << std::endl
				<< "The operation " << (bsec.failed() ? "failed" : "didn't fail") << std::endl;
			}
		}
	);
	//signals.async_wait(BIND_FUNCTION(&Client::signalHandler, this, boost::asio::placeholders::error, boost::asio::placeholders::signal_number)); // We will listen for signals using THIS so that we can set properties.
	#ifdef DEBUG
	std::clog << "Client::Client: set up asynchronous wait on SIGHUP, SIGINT, SIGQUIT, SIGTERM, and SIGTSTP" << std::endl;
	#endif

	/* Set up the network connection */
	std::istringstream portSS; // Used to convert port # to a string
	portSS << port;
	#ifdef DEBUG
	std::clog << "Client::Client: contents of port std::istringstream are " << std::quoted(portSS.str()) << std::endl;
	#endif

	endpoints = resolver.resolve(host, portSS.str().c_str()); // Fetch a list of endpoints that correspond to the address we were started with
	workerThread = std::make_unique<THREAD>( // Create the thread that keeps our I/O context running in the background
		[this]()
		{
			ioc.run(); // Run the I/O context so that Asio will run
		}
	);
	//workerThread = std::make_unique<THREAD>(BIND_FUNCTION(&Client::threadFunc, this)); // Have our thread function run the I/O context so that asynchronous operations will execute
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

#ifdef DEBUG
/**
* @desc Destructor. This is only needed in debug mode, to reset std::clog's flags to their original values.
**/
Client::~Client()
{
	std::clog << "Client::~Client: restoring old clog flags (" << initFlags << ")" << std::endl;
	std::clog.flags(initFlags); // Restore the flags as they were on construction
}
#endif

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
* @return True if the noun is singular, false otherwise.
**/
bool Client::isSingular() const
{
	reqPtr.reset(); // Reset the pointer so that it contains a fresh Request object
	reqPtr->SETCOM_FUNC(ISSING);
	reqPtr->addHeader("Content-Type", ANY_CLASS("text/utf-8")); // We are sending a plain Malayalam noun
	reqPtr->addHeader("Content-Length", ANY_CLASS(input.length())); // The server needs to know the length of the input IN BYTES, NOT codepoints!
	reqPtr->setNoun(input); // Set the input to send
	#ifdef DEBUG
	std::cout << "Client::isSingular: input to send is " << std::quoted(input) << std::endl;
	#endif
	boost::asio::async_connect(sock, // Connect using our socket
		endpoints, // Try to connect to the server's endpoints
		//BIND_FUNCTION(&Client::handleConnect, this, boost::asio::placeholders::error, boost::asio::placeholders::endpoint) // Create a functor that'll call our callback method once the connection operation finishes
		[this](const boost::system::error_code& ec, const boost::asio::ip::tcp::endpoint& endPoint)
		{
			if (!ec) // No error
			{
				#ifdef DEBUG
				std::clog << "Client::isSingular::outermost lambda: connected to server at endpoint " << endpoint.address().to_string() << std::endl;
				#endif
				boost::asio::async_write( // Send our request
					sock, // Write to our socket
					reqPtr->toBuffers(), // Convert the request to an std::vector of buffers to send
					[this](const boost::system::error_code& ec, std::size_t bytesTransferred)
					{
						if (!ec) // No error
						{
							#ifdef DEBUG
							std::cout << "Client::isSingular::inner lambda 1: wrote " << bytesTransferred << " bytes" << std::endl;
							#endif
							boost::asio::async_read( // Read a response
								sock, // Read from our socket
								boost::asio::buffer()
							);
						}
					
						else // An error occurred
						{
							std::cerr << "Client::handleWrite: a system error occurred while trying to send a request to the server" << std::endl
							<< "\tValue = " << ec.value() << std::endl
							<< "\tMessage = " << ec.message() << std::endl
							<< "The operation " << (ec.failed() ? "failed" : "didn't fail") << std::endl;
						}
					}
				);
			}
		
			else // An error occurred
			{
				std::cerr << "Client::isSingular::outer lambda a system error occurred while trying to connect to the server." << std::endl
				<< "\tValue = " << ec.value() << std::endl
				<< "\tMessage = " << ec.message() << std::endl
				<< "The operation " << (ec.failed() ? "failed" : "didn't fail") << std::endl;
			}
		}
	);
}

/**
* @desc Handles the signals that we registered to listen for. Causes the client to quit.
* @param bsec An error code, set if an error occurred during the async. op.
* @param sigNo The # of the signal that was caught.
**/
void Client::signalHandler(__attribute__((unused)) const boost::system::error_code& ec, int sigNo)
{
	if (!ec) // No error
	{
		active = false; // Stop the client immediately
		#ifdef DEBUG
		std::cout << "Client::signalHandler caught " << sigMsgs[sigNo] << ", exiting..." << std::endl;
		#endif
	}
	
	else // An error occurred
	{
		std::cerr << "Client::signalHandler: a sytem error occurred" << std::endl
		<< "\tValue = " << ec.value() << std::endl
		<< "\tMessage = " << ec.message() << std::endl
		<< "The operation " << (ec.failed() ? "failed" : "didn't fail") << std::endl;
	}
}

/**
* @desc Runs our I/O context from our thread.
**/
void Client::threadFunc()
{
	ioc.run();
}

/**
* @desc Callback for an attempt to connect to the server. Tries to send a request using the current input.
* @param ec An error code. Set if any error occurred during the connection operation.
* @param endPoint The endpoint that we connected to, if the connection operation was successful.
**/
void Client::handleConnect(const boost::system::error_code& ec, const boost::asio::ip::tcp::endpoint& endPoint)
{
	if (!ec) // No error
	{
		#ifdef DEBUG
		std::clog << "Client::handleConnect: connected to server at endpoint " << endpoint.address().to_string() << std::endl;
		#endif
		boost::asio::async_write( // Send our request
			sock, // Write to our socket
			reqPtr->toBuffers(), // Convert the request to an std::vector of buffers to send
			BIND_FUNCTION(&Client::handleWrite, this) // Callback
		);
	}

	else // An error occurred
	{
		std::cerr << "Client::handleConnect: a system error occurred while trying to connect to the server." << std::endl
		<< "\tValue = " << ec.value() << std::endl
		<< "\tMessage = " << ec.message() << std::endl
		<< "The operation " << (ec.failed() ? "failed" : "didn't fail") << std::endl;
	}
}

/**
* @desc Callback for sending the request to the server. Tries to read a response from the server.
* @param ec An error code. Set if an error occurred during the write operation.
* @param bytesTransferred The # of bytes that were sent to the server.
**/
void Client::handleWrite(const boost::system::error_code& ec, std::size_t bytesTransferred)
{
	if (!ec) // No error
	{
		#ifdef DEBUG
		std::cout << "Client::handleWrite: wrote " << bytesTransferred << " bytes" << std::endl;
		#endif
		boost::asio::async_read( // Read a response
			sock, // Read from our socket
		);
	}

	else // An error occurred
	{
		std::cerr << "Client::handleWrite: a system error occurred while trying to send a request to the server" << std::endl
		<< "\tValue = " << ec.value() << std::endl
		<< "\tMessage = " << ec.message() << std::endl
		<< "The operation " << (ec.failed() ? "failed" : "didn't fail") << std::endl;
	}
}

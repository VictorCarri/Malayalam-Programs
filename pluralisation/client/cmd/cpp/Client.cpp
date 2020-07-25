/** C headers **/
#include <signal.h> // SIGHUP, SIGINT, SIGQUIT, SIGTERM, SIGTSTP

/** C++ versions of C headers **/
#include <cctype> // std::tolower

/** Standard C++ **/

/* Headers that are only needed in debug builds */
#ifdef DEBUG
#include <ios> // std::boolalpha, std::ios_base::fmtflags
#endif

#include <iostream> // std::clog, std::endl, std::cin
#include <string> // std::string
#include <algorithm> // std::transform
#include <iomanip> // std::quoted
#include <iterator> // std::back_inserter

/* Boost */
#include <boost/asio/placeholders.hpp> // boost::asio::placeholders::error

/* Our headers */
#include "BindFunc.hpp" // Defines the BIND_FUNCTION macro, that resolves to either std::bind or boost::bind. Also pulls placeholders (_1, _2, ...) into the global namespace.
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
* Default constructor. Initialises our state.
**/
Client::Client() : active(false), // We start in an "inactive" state
input (), // Use std::string's default ctor
ioc (), // Use io_context's default ctor
signals (ioc, SIGHUP, SIGINT, SIGQUIT) // Construct signal set using io_context, and add 3 signals (the max)
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
	signals.async_wait( // Start waiting for the user to send us a signal
		BIND_FUNCTION( // Create a function object that binds our handler, since async wait needs a function that takes 2 arguments, but our method requires 3 (this, + the 2 arguments async_wait passes)
			&Client::signalHandler, // Member function
			this, // We need a reference to THIS object, NOT a copy, because the handler needs to modify THIS object's properties.
			_1, // The error object
			_2 // The signal # to be passed
		)
	);
	#ifdef DEBUG
	std::clog << "Client::Client: set up asynchronous wait on SIGHUP, SIGINT, SIGQUIT, SIGTERM, and SIGTSTP" << std::endl;
	#endif
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
	* Either:
	* ------------
	* a) There is input and it's a request to quit
	* b) Our signal handler called quit() after handling a signal.
	*/
	bool toReturn = (!isEmpty && (inputIsQuit || inputIsExit) ) || !active;

	#ifdef DEBUG
	std::clog << "toReturn = (" << !isEmpty << " && (" << inputIsQuit << " || " << inputIsExit << ") ) || " << !active << ") = " << toReturn << std::endl;
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
* @desc This method performs the appropriate action upon receiving a signal (which is usually quitting).
* @param ec An error code that was set when the operation failed.
* @param sig The signal that occurred.
**/
void Client::signalHandler(__attribute__((unused)) const boost::system::error_code& ec, int sig)
{
	#ifdef DEBUG
	std::clog << "Client::signalHandler called with signal #" << sig << std::endl;
	#endif

	switch (sig) // Is it a signal that we can handle?
	{
		/* Yes */
		case SIGHUP:
		case SIGINT:
		case SIGQUIT:
		case SIGTERM:
		case SIGTSTP:
		{
			quit(); // We should quit
			break;
		}

		default: // How???
		{
			std::cerr << "Client::signalHandler: caught unknown signal #" << sig << std::endl;
			break;
		}
	}

	std::cin.clear(); // Reset input stream
}

/**
* @desc Fetches the current input string.
* @return The current input string.
**/
std::string Client::getInput() const
{
	return input;
}

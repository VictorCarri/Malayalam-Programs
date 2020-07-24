/* Headers that are only needed in debug builds */
#ifdef DEBUG
#include <ios> // std::boolalpha, std::ios_base::fmtflags
#endif

/* C++ versions of C headers */
#include <cctype> // std::tolower

/* Standard C++ */
#include <iostream> // std::clog, std::endl, std::cin
#include <string> // std::string
#include <algorithm> // std::transform
#include <iomanip> // std::quoted
#include <iterator> // std::back_inserter

/* Our headers */
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
Client::Client() : active(false) // We start in an "inactive" state
#ifdef DEBUG
, initFlags(std::clog.flags()) // Save original clog flags
#endif
{
	#ifdef DEBUG
	std::clog << std::boolalpha // Show booleans as strings
	<< "Client::Client: active = " << active << std::endl
	<< "\tinitFlags = " << initFlags << std::endl;
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
* @desc Tells the client that it should switch back to an "inactive" state.
**/
void Client::stop()
{
	#ifdef DEBUG
	std::clog << "Client::stop: active = " << active << " before change" << std::endl;
	#endif
	active = false;
	#ifdef DEBUG
	std::clog << "Client::stop: active = " << active << " after change" << std::endl;
	#endif
}

/**
* @desc Prompts the user for a Malayalam noun.
*	It then fetches a space-terminated string and stores it in a property.
**/
void Client::getInput()
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
	* Ensure that: 
	* ------------
	* a) There is input
	* b) It is a request to quit
	*/
	bool toReturn = !isEmpty && (inputIsQuit || inputIsExit);

	#ifdef DEBUG
	std::clog << "toReturn = " << !isEmpty << " && (" << inputIsQuit << " || " << inputIsExit << ") = " << toReturn << std::endl;
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
	active = false;
}

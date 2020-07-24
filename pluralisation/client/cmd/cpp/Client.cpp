/* Headers that are only needed in debug builds */
#ifdef DEBUG
#include <ios> // std::boolalpha, std::ios_base::fmtflags
#endif

/* Standard C++ */
#include <iostream> // std::cout, std::endl, std::cin

/* Our headers */
#include "Client.hpp" // Class def'n

/**
* @desc Tells the client that it should switch to a "active" state.
**/
void Client::start()
{
	#ifdef DEBUG
	std::cout << "Client::start: active = " << active << " before change" << std::endl;
	#endif
	active = true;
	#ifdef DEBUG
	std::cout << "Client::start: active = " << active << " after change" << std::endl;
	#endif
}

/**
* Default constructor. Initialises our state.
**/
Client::Client() : active(false) // We start in an "inactive" state
#ifdef DEBUG
, initFlags(std::cout.flags()) // Save original cout flags
#endif
{
	#ifdef DEBUG
	std::cout << std::boolalpha // Show booleans as strings
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
	std::cout << "Client::isActive: returning " << active << std::endl;
	#endif
	return active;
}

#ifdef DEBUG
/**
* @desc Destructor. This is only needed in debug mode, to reset std::cout's flags to their original values.
**/
Client::~Client()
{
	std::cout << "Client::~Client: restoring old cout flags (" << initFlags << ")" << std::endl;
	std::cout.flags(initFlags); // Restore the flags as they were on construction
}
#endif

/**
* @desc Tells the client that it should switch back to an "inactive" state.
**/
void Client::stop()
{
	#ifdef DEBUG
	std::cout << "Client::stop: active = " << active << " before change" << std::endl;
	#endif
	active = false;
	#ifdef DEBUG
	std::cout << "Client::stop: active = " << active << " after change" << std::endl;
	#endif
}

/**
* @desc Prompts the user for a Malayalam noun.
*	It then fetches a space-terminated string and stores it in a property.
**/
void Client::getInput()
{
	std::cout << "Please enter a Malayalam noun to send to the server in ISSING and FOF queries." << std::endl // Inform the user
	<< "mpp-client-" << major << "-" << minor << "-" << patch << ">"; // Print the prompt
	std::cin >> input; // Get input
}

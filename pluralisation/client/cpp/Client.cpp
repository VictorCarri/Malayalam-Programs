/* Our headers */
#include "Client.hpp" // Class def'n

/**
* @desc Tells the client that it should switch to a "active" state.
**/
void Client::start()
{
	active = true;
}

/**
* Default constructor. Initialises our state.
**/
Client::Client() : active(false)
{
}

/**
* @desc Tells the caller whether or not the client is active.
* @return True if the client is active, false otherwise.
**/
bool isActive() const
{
}

/* Our headers */
#include "Request.hpp" // Class definition

/**
* @desc Default constructor. Initialises the command to an invalid one.
**/
Request::Request() : c(INVALID)
{
}

/**
* @desc Sets the command which this request
**/
void Request::setCommand(Command com)
{
	c = com;
}

/**
* @desc Fetches the command associated with this request.
**/
Command Request::getCommand() const
{
	return c;
}

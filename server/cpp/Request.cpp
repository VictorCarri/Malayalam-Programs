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
void Request::SETCOM_FUNC(Command com)
{
	c = com;
}

/**
* @desc Fetches the command associated with this request.
**/
Request::Command Request::GETCOM_FUNC() const
{
	return c;
}

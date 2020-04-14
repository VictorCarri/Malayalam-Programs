/* Our headers */
#include "mpp/Request.hpp" // Class definition

/**
* @desc Default constructor. Initialises the command to an invalid one.
**/
mpp::Request::Request() : c(INVALID)
{
}

/**
* @desc Sets the command which this request
**/
void mpp::Request::SETCOM_FUNC(Command com)
{
	c = com;
}

/**
* @desc Fetches the command associated with this request.
**/
mpp::Request::Command mpp::Request::GETCOM_FUNC() const
{
	return c;
}

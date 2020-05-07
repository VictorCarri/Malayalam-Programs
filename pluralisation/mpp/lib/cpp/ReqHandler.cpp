/* C++ Standard Library */
#include <string> // std::string

/* Our headers */
#include "mpp/Request.hpp" // Represents a request
#include "mpp/Reply.hpp" // Represents a reply
#include "mpp/ReqHandler.hpp" // Class def'n

/**
* @desc Handles a request and produces a reply.
* @param req The request object to set parameters on by parsing.
* @param rep The respnse object to set parameters on to generate a response.
**/
void mpp::ReqHandler::handleReq(const Request& req, Reply& rep)
{
	switch (req.GETCOM_FUNC())
	{
		case Request::FOF: // "F"ind "O"pposite "F"orm
		{
			break;
		}

		case Request::ISSING: // Determine whether the given noun is singular
		{
			break;
		}

		default: // Invalid command
		{
			break;
		}
	}
}

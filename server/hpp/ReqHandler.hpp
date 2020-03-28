#ifndef REQHANDLER_HPP
#define REQHANDLER_HPP

/* Boost */
#include <boost/noncopyable.hpp> // boost::noncopyable

/* Our headers */
#include "Request.hpp" // Represents a single request
#include "Reply.hpp" // Represents a single reply

/*
* Responsible for handling a request. Parses the request into a Request object and uses the Reply class to generate a reply.
*/
class ReqHandler : private boost::noncopyable
{
	public:
		/**
		* @desc Handles a request and produces a reply.
		* @param req The request object to set parameters on by parsing.
		* @param rep The respnse object to set parameters on to generate a response.
		**/
		void handleReq(const Request& req, Reply& rep);
};

#endif // REQHANDLER_HPP

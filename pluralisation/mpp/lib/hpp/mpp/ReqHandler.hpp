#ifndef MPP_REQHANDLER_HPP
#define MPP_REQHANDLER_HPP

/* Standard C++ */
#include <string> // std::string
#include <array> // std::array

/* Boost */
#include <boost/noncopyable.hpp> // boost::noncopyable
#include <boost/regex.hpp>
#include <boost/regex/icu.hpp> // boost::u32regex

/* Our headers */
#include "mpp/Request.hpp" // Represents a single request
#include "mpp/Reply.hpp" // Represents a single reply

namespace mpp
{
	/*
	* Responsible for handling a request. Examines the Request object to determine how to respond, and sets parameters on the Reply object accordingly.
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
};

#endif // MPP_REQHANDLER_HPP

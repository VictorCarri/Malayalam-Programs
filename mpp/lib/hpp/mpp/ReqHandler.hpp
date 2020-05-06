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

			/**
			* @desc Constructor. Initialises internal member variables.
			**/
			ReqHandler();

		private:
			/**
			* @desc Determines whether the given Malayalam noun is singular or not.
			* @param noun The noun to check.
			* @return True if the noun is singular, false otherwise.
			**/
			bool isSingular(std::string noun);

			/**
			* @desc Determines whether the given noun is singular or not. Then, it generates the opposite form.
			* @param noun The noun to check.
			* @return A string containing the opposite form (plural if input is singular, singular if input is plural).
			**/
			std::string findOppForm(std::string noun);

			/**
			* @desc Pluralises the given noun. The noun is ASSUMED to be singular.
			* @param singNoun The singular noun to pluralise.
			* @return The plural form of the noun.
			**/
			std::string pluralise(std::string singNoun);

			std::array<boost::u32regex, 6> singRegs; // Stores the regexes that match each class of singular noun
	};
};

#endif // MPP_REQHANDLER_HPP

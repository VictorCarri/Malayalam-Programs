/* C++ Standard Library */
#include <string> // std::string

/* Boost */
#include <boost/regex.hpp> // boost::smatch
#include <boost/regex/icu.hpp> // boost::u32regex, boost::make_u32regex, boost::ur32regex_match

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
	std::string noun = req.getNoun(); // Fetch the (UTF-8 encoded) noun

	switch (req.GETCOM_FUNC())
	{
		case Request::FOF: // "F"ind "O"pposite "F"orm
		{
			std::string oppForm = findOppForm(noun);
			rep.setContent(oppForm);
			
			if (isSingular(oppForm))
			{
				rep.setStatus(Reply::singularForm); // The given form was plural, so return the singular
			}

			else
			{
				rep.setStatus(Reply::pluralForm); // The given form was singular, so return the plural
			}

			break;
		}

		case Request::ISSING: // Determine whether the given noun is singular
		{
			if (isSingular(noun)) // The noun is singular
			{
				rep.setStatus(Reply::singular);
			}

			else // The noun is plural
			{
				rep.setStatus(Reply::plural);
			}

			break;
		}
	}
}

/**
* @desc Determines whether the given Malayalam noun is singular or not.
* @param noun The noun to check.
* @return True if the noun is singular, false otherwise.
**/
bool mpp::ReqHandler::isSingular(std::string noun)
{
	boost::u32regex anStemReg = boost::make_u32regex("\u0d7b$"); // Ends in a final ൻ
	boost::u32regex amStemReg = boost::make_u32regex("\u0d02$"); // Ends in a final ം
	boost::u32regex ruhStemReg = boost::make_u32regex("\u0d31\u0d4d$"); // Ends in a final -റ്
	boost::u32regex duhStemReg = boost::make_u32regex("\u0d1f\u0d4d$"); // Ends in a final -ട്
	boost::smatch what; // Used to store match results
}

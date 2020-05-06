/* C++ Standard Library */
#include <string> // std::string
#include <array> // std::array
#include <algorithm> // std::transform
#include <numeric> // std::accumulate
#include <functional> // std::logical_or

/* Boost */
#include <boost/regex.hpp>
#include <boost/regex/icu.hpp> // boost::u32regex, boost::make_u32regex

/* Our headers */
#include "mpp/functors/SingMatcher.hpp" // Functor that applies boost::u32regex_match to each regex, storing the text & boolean results in arrays
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
			rep.setContent(""); // Clear the contents of the reply

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
	/*for (int i = 0; i < what.size(); i++) // Loop through the regexes and test each one
	{
		matchRes[i] = boost::u32regex_match(noun, what[i], regexes[i]);
	}*/

	std::array<boost::smatch, 6> what; // What matched (unused)
	std::array<bool, 6> matchRes; // Whether or not each regex matched
	std::transform(singRegs.cbegin(), singRegs.cend(), what.begin(), matchRes.begin(), mpp::functors::SingMatcher(noun)); // Run boost::u32regex_match on each regex, storing the results in what and the boolean return values in matchRes
	return std::accumulate(matchRes.cbegin(), matchRes.cend(), false, std::logical_or()); // OR all of the bools together to see if any of the regexes matched, and return the result
}

/**
* @desc Constructor. Initialises internal member variables.
**/
mpp::ReqHandler::ReqHandler() :
	singRegs {
	boost::make_u32regex("\u0d7b$"), // Ends in a final ൻ
	boost::make_u32regex("\u0d02$"), // Ends in a final ം
	boost::make_u32regex("\u0d31\u0d4d$"), // Ends in a final -റ്
	boost::make_u32regex("\u0d1f\u0d4d$"), // Ends in a final -ട്
	boost::make_u32regex("\u0d7e$"), // Ends in a final -ശ
	boost::make_u32regex("\u0d4d$") // Ends in a schwa
	}
{
	/* Setup regexes */
	/*singRegs[0] = boost::make_u32regex("\u0d7b$"); // Ends in a final ൻ
	singRegs[1] = boost::make_u32regex("\u0d02$"); // Ends in a final ം
	singRegs[2] = boost::make_u32regex("\u0d31\u0d4d$"); // Ends in a final -റ്
	singRegs[3] = boost::make_u32regex("\u0d1f\u0d4d$"); // Ends in a final -ട്
	singRegs[4] = boost::make_u32regex("\u0d7e$"); // Ends in a final -ശ
	singRegs[5] = boost::make_u32regex("\u0d4d$"); // Ends in a schwa*/
}

/**
* @desc Determines whether the given noun is singular or not. Then, it generates the opposite form.
* @param noun The noun to check.
* @return A string containing the opposite form (plural if input is singular, singular if input is plural).
**/
std::string mpp::ReqHandler::findOppForm(std::string noun)
{
	if (isSingular(noun)) // Need to find the plural form
	{
		return pluralize(noun);
	}

	else // Need to find the singular form
	{
		return singularize(noun);
	}
}

/**
* @desc Pluralises the given noun. The noun is ASSUMED to be singular.
* @param singNoun The singular noun to pluralise.
* @return The plural form of the noun.
**/
std::string mpp::ReqHandler::pluralise(std::string singNoun)
{
	std::array<boost::smatch, 6> what; // What matched (unused)
	std::array<bool, 6> matchRes; // Whether or not each regex matched
}

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
}

/**
* @desc Constructor. Initialises internal member variables.
**/
mpp::ReqHandler::ReqHandler() :
{
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
		return pluralise(noun);
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
}

/* STL */
#include <string> // std::string
#include <sstream> // std::stringstream

/* Our headers */
#include "mpp/Header.hpp" // Header class
#include "mpp/Request.hpp" // Class definition
#include "mpp/exceptions/UnknownHeader.hpp" // Thrown when an unknown header is requested

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

/**
* @desc Creates and adds a Header to this request with the given name and value.
* @param name The header's name.
* @param value The header's value.
**/
void mpp::Request::addHeader(std::string name, std::string value)
{
	headers.emplace(name, mpp::Header(name, value)); // Map the name to the header so that we can find it by its name later
}

/**
* @desc Attempts to find a Header by the given name.
* @throws mpp::exceptions::UnknownHeader if a Header with the given name isn't found.
* @return The header with the given name.
**/
mpp::Header mpp::Request::findHeader(std::string name)
{
	if (headers.contains(name)) // We have this header
	{
		return headers.at(name); // Return the header object
	}

	else // No such header
	{
		std::stringstream ess; // To generate the error text
		ess << "Request: unknown header \"" << name << "\" requested";
		throw mpp::exceptions::UnknownHeader(ess.str());
	}
}

/**
* @desc Stores the given noun in the Request object to be pluralised later.
* @param noun The noun to store.
**/
void mpp::Request::setNoun(std::string noun)
{
	this->noun = noun;
}

/**
* @desc Fetches the noun associated with this request.
* @return This request's noun.
**/
std::string mpp::Request::getNoun() const
{
	return noun;
}

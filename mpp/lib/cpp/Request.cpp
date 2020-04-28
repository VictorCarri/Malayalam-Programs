/* STL */
#include <string> // std::string, std::string
#include <algorithm> // std::find_if
#include <any> // std::any
#include <sstream> // std::stringstream

/* Our headers */
#include "mpp/Header.hpp" // Header class
#include "mpp/exceptions/UnknownHeader.hpp" // Thrown when an unknown header is requested
#include "mpp/functors/HeaderFinder.hpp" // Functor that finds a header with the given name
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

/**
* @desc Creates and adds a Header to this request with the given name and value.
* @param name The header's name.
* @param value The header's value.
**/
void mpp::Request::addHeader(std::string name, std::any value)
{
	headers.emplace_front(name, value);
}

/**
* @desc Attempts to find a Header by the given name.
* @throws mpp::exceptions::UnknownHeader if a Header with the given name isn't found.
* @return The header with the given name.
**/
mpp::Header mpp::Request::findHeader(std::string name)
{
	std::forward_list<mpp::Header>::const_iterator it = std::find_if(headers.cbegin(), headers.cend(), mpp::functors::HeaderFinder(name));
	
	if (it == headers.cend()) // No such header
	{
		std::stringstream ess;
		ess << "Unknown header \"" << name << "\" requested." << std::endl;
		throw mpp::exceptions::UnknownHeader(ess.str());
	}

	else
	{
		return *it; // Return the header that was found
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

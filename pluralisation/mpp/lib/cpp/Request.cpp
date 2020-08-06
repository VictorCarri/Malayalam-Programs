/* STL */
#include <string> // std::string, std::string
#include <algorithm> // std::find_if
#include <sstream> // std::ostringstream
#include <vector> // std::vector
#include <iomanip> // std::quoted
#include <ostream> // std::endl

/* Boost */
#include <boost/asio/buffer.hpp> // boost::asio::buffer

/* Our headers */
#include "mpp/bosmacros/any.hpp" // ANY_CLASS and ANY_CAST macros
#include "mpp/Header.hpp" // Header class
#include "mpp/exceptions/UnknownHeader.hpp" // Thrown when an unknown header is requested
#include "mpp/ver.hpp" // Version constants
#include "mpp/exceptions/BadHeaderValue.hpp" // Thrown when a header has an incorrect type of value
#include "mpp/Request.hpp" // Class definition

/**
* @desc Default constructor. Initialises the command to an invalid one.
**/
mpp::Request::Request() : c(INVALID),
	verbNames { // Set up map of enum values to verb names
		{FOF, "FOF"},
		{ISSING, "ISSING"}
	},
	crlf {'\r', '\n'}, // Initialise CRLF buffer
	nameValSep {':', ' '} // Initialise the separator that comes between a header name and its value
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
void mpp::Request::addHeader(std::string name, ANY_CLASS value)
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
	auto it = std::find_if(headers.cbegin(), headers.cend(), [=](mpp::Header h) -> bool
		{
			return h.getName() == name;
		}
	);
	
	if (it == headers.cend()) // No such header
	{
		std::ostringstream ess;
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

/**
* @desc Converts the Request object to a sequence of constant buffers, suitable for network transport.
* @return A vector of constant buffers, containing text that represents this Request object.
**/
std::vector<boost::asio::const_buffer> mpp::Request::toBuffers() const
{
	std::vector<boost::asio::const_buffer> toReturn;
	std::ostringstream flss; // Used to build the first line

	flss << "MPP/" << mpp::VER_MAJOR << "." << mpp::VER_MINOR << "." << mpp::VER_PATCH << " " << verbNames.at(c); // Create the first line
	toReturn.push_back(boost::asio::buffer(flss.str())); // Push back the first line
	toReturn.push_back(boost::asio::buffer(crlf)); // End this line

	for (mpp::Header h : headers) // Loop through the list of headers
	{
		toReturn.push_back(boost::asio::buffer(h.getName())); // First, send the header's name
		toReturn.push_back(boost::asio::buffer(nameValSep)); // Then, add the separator
		std::string val; // Will represent the value that we fetch from the ANY_CLASS that contains the header's value

		/* Determine what type the header's value is */
		if (h.getName() == "Content-Length") // Int value
		{
			try
			{
				int ival = ANY_CAST<int>(h.getValue()); // Try to cast the header's value to an int
				std::ostringstream convSS; // Used to convert the int to a string
				convSS << ival; // Insert the int to be converted
				val = convSS.str(); // Store the converted string
			}

			catch (BAD_ANY_CAST& bace) // Invalid data type
			{
				std::ostringstream ess;
				ess << "mpp::Request::toBuffers: the header named " << std::quoted(h.getName()) << " should contain an " << std::quoted("int") << " value, but doesn't!" << std::endl
				<< "Error: " << bace.what() << std::endl;
				mpp::exceptions::BadHeaderValue mebhv(ess.str());
				throw mebhv;
			}
		}

		else // String value
		{
			try
			{
				val = ANY_CAST<std::string>(h.getValue()); // Try to cast the header's value to an std::string and store it
			}

			catch (BAD_ANY_CAST& bace) // Invalid data type
			{
				std::ostringstream ess;
				ess << "mpp::Request::toBuffers: the header named " << std::quoted(h.getName()) << " should contain an " << std::quoted("std::string") << " value, but doesn't!" << std::endl
				<< "Error: " << bace.what() << std::endl;
				mpp::exceptions::BadHeaderValue mebhv(ess.str());
				throw mebhv;
			}
		}

		toReturn.push_back(boost::asio::buffer(val)); // Add the header's value
		toReturn.push_back(boost::asio::buffer(crlf)); // End this header line
	} // for

	toReturn.push_back(boost::asio::buffer(crlf)); // End the headers
	toReturn.push_back(boost::asio::buffer(noun)); // Add the noun
	return toReturn;
}

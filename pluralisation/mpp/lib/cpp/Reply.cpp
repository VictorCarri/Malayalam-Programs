/* STL */
#include <string> // std::string
#include <sstream> // std::ostringstream
#include <utility> // std::exchange, std::move, std::swap

/* Boost */
#include <boost/asio.hpp> // boost::asio::const_buffer

/* Our headers */
#include "mpp/bosmacros/any.hpp" // ANY_CLASS, BAD_ANY_CAST, ANY_CAST
#include "mpp/ver.hpp" // MPP protocol version
#include "mpp/exceptions/BadHeaderValue.hpp" // Exception thrown when the type of a header's value doesn't match the expected one
#include "mpp/Header.hpp" // Header class
#include "mpp/Reply.hpp" // Class def'n

/**
* @name Default constructor.
* @desc Constructs an invalid reply and sets up the status text map.
**/
mpp::Reply::Reply() :
	stat(invalid),
	headers{},
	statText{},
	content(""),
	crlf {'\r', '\n'},
	nameValSep {':', ' '}
{
	std::ostringstream verSS; // Used to build version string
	verSS << "MPP/" << mpp::VER_MAJOR << mpp::VER_MINOR << mpp::VER_PATCH << " ";

	/** Set up status text map **/

	/* Set up OK (2xx) responses */
	statText[singular] = verSS.str() + "200 Singular";
	statText[plural] = verSS.str() + "201 Plural";
	statText[pluralForm] = verSS.str() + "202 Plural Form";
	statText[singularForm] = verSS.str() + "203 Singular Form";

	/* Set up error (4xx) responses */
	statText[badReq] = verSS.str() + "400 Bad Request";
	statText[badMajor] = verSS.str() + "401 Unrecognised Protocol Major Version Number";
	statText[badMinor] = verSS.str() + "402 Unrecognised Protocol Minor Version Number";
	statText[badPatch] = verSS.str() + "403 Unrecognised Protocol Patch Number";
	statText[unknownVerb] = verSS.str() + "404 Unrecognised Verb";
	statText[invUTF8] = verSS.str() + "405 Malformed UTF-8 Input";
	statText[noPlural] = verSS.str() + "406 No Plural Form";
	statText[noSingular] = verSS.str() + "407 No Singular Form";

	/* Set up invalid status text */
	statText[invalid] = "Error: invalid Reply object!";
}

/**
* @desc Sets a reply's status.
**/
void mpp::Reply::setStatus(mpp::Reply::Status s)
{
	stat = s;
}

/**
* @desc Converts the Reply into a vector of buffers that Boost.Asio can send over the network.
*	The buffers don't own the underlying memory blocks. Therefore, the Reply object
*	must remain valid and unchanged until the write operation has completed.
**/
std::vector<boost::asio::const_buffer> mpp::Reply::toBuffers()
{
	std::vector<boost::asio::const_buffer> buffers;
	buffers.push_back(boost::asio::buffer(statText[stat])); // Add the status text first

	for (mpp::Header h : headers)
	{
		buffers.push_back(boost::asio::buffer(h.getName()));
		buffers.push_back(boost::asio::buffer(nameValSep));
		std::string val; // Used to store the value to push back
	
		/* Determine what type the value has, and cast it appropriately */
		if (h.getName() == "Content-Length") // Int value
		{
			int length;
	
			try
			{
				length = ANY_CAST<int>(h.getValue()); // Fetch the length
				std::ostringstream convSS; // Used to convert int to str
				convSS << length;
				val = convSS.str();
			}
	
			catch (BAD_ANY_CAST& stdbace) // Rethrow it as a library error
			{
				std::ostringstream ess;
				ess << "mpp::functors::HeaderBufferAdder::operator(): the \"Content-Length\" header has a non-integer value associated with it!" << std::endl
				<< "Error: " << stdbace.what() << std::endl;
				mpp::exceptions::BadHeaderValue toThrow(ess.str());
				throw toThrow;
			}
		}
	
		else // String value
		{
			try
			{
				val = ANY_CAST<std::string>(h.getValue()); // Fetch the string value
			}
	
			catch (BAD_ANY_CAST& stdbace) // Rethrow it as a library error
			{
				std::ostringstream ess;
				ess << "mpp::functors::HeaderBufferAdder::operator(): the \"" << h.getName() << "\" header has a non-string value associated with it!" << std::endl
				<< "Error: " << stdbace.what() << std::endl;
				mpp::exceptions::BadHeaderValue toThrow(ess.str());
				throw toThrow;
			}
		}
	
		buffers.push_back(boost::asio::buffer(val)); // Push back the value computed above
		buffers.push_back(boost::asio::buffer(crlf));
	}

	buffers.push_back(boost::asio::buffer(crlf));
	buffers.push_back(boost::asio::buffer(content));
	return buffers;
}

/**
* @desc Adds the given Header object to this Reply object's list of headers.
**/
void mpp::Reply::addHeader(mpp::Header toAdd)
{
	headers.push_front(toAdd);
}

/**
* @desc Fetches the string associated with the given status.
* @param s THe status to fetch a string for.
**/
std::string mpp::Reply::getStatText(mpp::Reply::Status s)
{
	return statText.at(s);
}

/**
* @desc Sets the content to send with the reply.
* @param c The content to store in this reply.
**/
void mpp::Reply::setContent(std::string c)
{
	content = c;
}

/**
* @desc Uses in-place construction to add a Header to our list.
* @param name The header's name.
* @param val The header's value.
**/
void mpp::Reply::addHeader(std::string name, ANY_CLASS val)
{
	headers.emplace_front(name, val); // Construct a new header in-place
}

/**
* @desc Fetches a stock reply for a given status.
* @param stat The status to fetch a stock reply for.
* @return A Reply object containing a stock string for the given status.
**/
mpp::Reply mpp::Reply::stockReply(mpp::Reply::Status stat)
{
	mpp::Reply rep;
	rep.addHeader("Content-Type", ANY_CLASS(std::string("text/plain")));
	rep.addHeader("Content-Length", ANY_CLASS(0));
	rep.setStatus(stat);
	rep.setContent("");
	return rep;
}

/**
* @desc Copy constructor.
* @param other The other Reply object to copy from.
**/
mpp::Reply::Reply(const mpp::Reply& other) : stat(other.stat),
	headers(other.headers),
	statText(other.statText),
	content(other.content),
	crlf(other.crlf),
	nameValSep(other.nameValSep)
{
}

/**
* @desc Copy assignment operator.
* @param other The other Reply object to copy from.
* @return A reference to this.
**/
mpp::Reply& mpp::Reply::operator=(const mpp::Reply& other)
{
	/* Check for self-assignment */
	if (&other == this) // Self-assignment
	{
		return *this;
	}

	stat = other.stat;
	headers = other.headers;
	statText = other.statText;
	content = other.content;
	return *this; // Allow chaining
}

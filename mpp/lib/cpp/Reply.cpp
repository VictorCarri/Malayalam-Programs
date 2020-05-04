/* STL */
#include <string> // std::string
#include <sstream> // std::ostringstream
#include <algorithm> // std::for_each
#include <utility> // std::exchange, std::move

/* Boost */
#include <boost/asio.hpp> // boost::asio::const_buffer

/* Our headers */
#include "mpp/Reply.hpp" // Class def'n
#include "mpp/ver.hpp" // MPP protocol version
#include "mpp/functors/HeaderBufferAdder.hpp"

/**
* @name Default constructor.
* @desc Constructs an invalid reply and sets up the status text map.
**/
mpp::Reply::Reply() :
	stat(invalid),
	headers{},
	statText{},
	content(""),
	crlf {'\r', '\n'}
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
	statText[invMalChar] = verSS.str() + "405 Invalid Malayalam Codepoints in Input";
	statText[invBool] = verSS.str() + "406 Invalid Boolean";

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
	//std::for_each(headers.cbegin(), headers.cend(), mpp::functors::HeaderBufferAdder(&buffers)); // Add one buffer containing the header's text for each header
	std::for_each(headers.cbegin(), headers.cend(), mpp::functors::HeaderBufferAdder(buffers)); // Add one buffer containing the header's text for each header
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
* @desc Copy constructor.
* @param other Other Reply object to copy from.
**/
mpp::Reply::Reply(const Reply& other) : statText(other.statText),
	stat(other.stat),
	headers(other.headers),
	content(other.content),
	crlf(other.crlf)
{
}

/**
* @desc Copy assignment operator.
* @param other Other Reply object to copy from.
* @return this
**/
mpp::Reply& mpp::Reply::operator=(const mpp::Reply& other)
{
	if (&other == this)
		return *this;

	statText = other.statText;
	stat = other.stat;
	headers = other.headers;
	content = other.content;

	return *this;
}

/**
* @desc Move constructor.
* @param other Other Reply object to move from.
**/
mpp::Reply::Reply(Reply&& other) : statText(std::move(other.statText)),
	stat(std::exchange(other.stat, invalid)),
	headers(std::move(other.headers)),
	content(std::move(other.content)),
	crlf(std::move(other.crlf))
{
}

/**
* @desc Move assignment operator.
* @param other Other Reply object to move from.
* @return this
**/
mpp::Reply& mpp::Reply::operator=(mpp::Reply&& other)
{
	if (&other == this)
		return *this;

	statText = std::move(other.statText);
	stat = std::exchange(other.stat, invalid);
	headers = std::move(other.headers);
	content = std::move(other.content);

	return *this;
}

/**
* @desc Fetches the string associated with the given status.
* @param s THe status to fetch a string for.
**/
std::string mpp::Reply::getStatText(mpp::Reply::Status s)
{
	return statText->at(s);
}

/**
* @desc Sets the content to send with the reply.
* @param c The content to store in this reply.
**/
void mpp::Reply::setContent(std::string c)
{
	content = c;
}

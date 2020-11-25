/* C++ versions of C headers */
#include <cstddef> // std::size_t

/* STL */
#include <string> // std::string
#include <sstream> // std::ostringstream
#include <utility> // std::exchange, std::move, std::swap
#include <stdexcept> // std::out_of_range
#ifdef DEBUG
#include <iostream> // std::cout
#include <iomanip> // std::quoted
#endif

/* Boost */
#include <boost/asio/buffer.hpp> // boost::asio::const_buffer

/* Our headers */
#include "bosmacros/any.hpp" // ANY_CLASS, BAD_ANY_CAST, ANY_CAST
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
	verSS << "MPP/" << mpp::VER_MAJOR << "." << mpp::VER_MINOR << "." << mpp::VER_PATCH << " ";

	/** Set up status text map **/

	/* Set up OK (2xx) responses */
	statText[singular] = verSS.str() + "200 Singular";
	statText[plural] = verSS.str() + "201 Plural";
	statText[pluralForm] = verSS.str() + "202 Plural Form";
	statText[singularForm] = verSS.str() + "203 Singular Form";
	statText[noPlural] = verSS.str() + "204 No Plural Form";
	statText[noSingular] = verSS.str() + "205 No Singular Form";

	/* Set up error (4xx) responses */
	statText[badReq] = verSS.str() + "400 Bad Request";
	statText[badMajor] = verSS.str() + "401 Unrecognised Protocol Major Version Number";
	statText[badMinor] = verSS.str() + "402 Unrecognised Protocol Minor Version Number";
	statText[badPatch] = verSS.str() + "403 Unrecognised Protocol Patch Number";
	statText[unknownVerb] = verSS.str() + "404 Unrecognised Verb";
	statText[invUTF8] = verSS.str() + "405 Malformed UTF-8 Input";

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
	/* TODO: Push all buffer contents to contents vector before pushing any buffers to the buffers vector */
	repBufs.clear();
	repBufConts.clear();
	#ifdef DEBUG
	std::cout << "mpp::Reply::toBuffers: buffers @ begin are: " << std::endl;
	printRepBufs(); // Make a copy just to avoid having the string being destroyed
	std::cout << "mpp::Reply::toBuffers: buffer contents vector contains: ";
	printRepBufConts();
	#endif

	repBufs.push_back(boost::asio::buffer(statText[stat])); // Add the status text first
	#ifdef DEBUG
	std::cout << "mpp::Reply::toBuffers: buffers after pushing status text are: " << std::endl;
	printRepBufs();
	#endif

	repBufs.push_back(boost::asio::buffer(crlf));
	#ifdef DEBUG
	std::cout << "mpp::Reply::toBuffers: buffers after pushing CRLF after status text are: " << std::endl;
	printRepBufs();
	#endif

	for (mpp::Header h : headers)
	{
		repBufConts.push_front(h.getName());
		repBufs.push_back(boost::asio::buffer(repBufConts.front()));
		#ifdef DEBUG
		std::cout << "mpp::Reply::toBuffers: buffers after pushing header name are: " << std::endl;
		printRepBufs();
		std::cout << "mpp::Reply::toBuffers: reply buffer contents after pushing header name are: " << std::endl;
		printRepBufConts();
		#endif
		repBufs.push_back(boost::asio::buffer(nameValSep));
		#ifdef DEBUG
		std::cout << "mpp::Reply::toBuffers: buffers after pushing colon separator are: " << std::endl;
		printRepBufs();
		#endif
		std::string val; // Used to store the value to push back
	
		/* Determine what type the value has, and cast it appropriately */
		if (repBufConts.front() == "Content-Length") // Int value
		{
			using lengthType = std::string::size_type;
			lengthType length;
	
			try
			{
				length = ANY_CAST<lengthType>(h.getValue()); // Fetch the length
				std::ostringstream convSS; // Used to convert int to str
				convSS << length;
				val = convSS.str();
			}
	
			catch (BAD_ANY_CAST& stdbace) // Rethrow it as a library error
			{
				std::ostringstream ess;
				ess << "mpp::Reply::toBuffers(): the \"Content-Length\" header has a non-size_t value associated with it!" << std::endl
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
				ess << "mpp::Reply::toBuffers(): the \"" << h.getName() << "\" header has a non-string value associated with it!" << std::endl
				<< "Error: " << stdbace.what() << std::endl;
				mpp::exceptions::BadHeaderValue toThrow(ess.str());
				throw toThrow;
			}
		}

		repBufConts.push_front(val);
		#ifdef DEBUG
		std::cout << "mpp::Reply::toBuffers: reply buffer contents list after pushing header value contains:" << std::endl;
		printRepBufConts();
		#endif
		repBufs.push_back(boost::asio::buffer(repBufConts.front())); // Push back the value computed above
		#ifdef DEBUG
		std::cout << "mpp::Reply::toBuffers: buffers after pushing header value are: " << std::endl;
		printRepBufs();
		#endif
		repBufs.push_back(boost::asio::buffer(crlf));
		#ifdef DEBUG
		std::cout << "mpp::Reply::toBuffers: buffers after pushing CRLF after header are: " << std::endl;
		printRepBufs();
		#endif
	}

	repBufs.push_back(boost::asio::buffer(crlf));
	#ifdef DEBUG
	std::cout << "mpp::Reply::toBuffers: buffers after pushing final CRLF are: " << std::endl;
	printRepBufs();
	#endif
	repBufs.push_back(boost::asio::buffer(content));
	#ifdef DEBUG
	std::cout << "mpp::Reply::toBuffers: # of buffers at end = " << repBufs.size() << std::endl
	<< "\tBuffers at end contain:" << std::endl;
	printRepBufs();
	std::cout << "\tFinished writing buffers." << std::endl;
	#endif

	return repBufs;
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
std::string mpp::Reply::getStatText(mpp::Reply::Status s) const
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
	rep.addHeader("Content-Type", std::string("text/plain"));
	rep.addHeader("Content-Length", static_cast<std::string::size_type>(0));
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

/**
* @desc An overload for the insertion operator that prints an MPP reply.
* @param os The output stream to write to.
* @param req The mpp::Reply object to write.
* @return A reference to the output stream, to allow chaining of operator<<.
**/
std::ostream& mpp::operator<<(std::ostream& os, const mpp::Reply& rep)
{
	try
	{
		os << rep.statText.at(rep.stat) << "\r\n"; // Write the first line of the response
	}

	catch (std::out_of_range& stdoor)
	{
		os << "mpp::operator<<(std::ostream& os, const mpp::Reply& rep): caught std::out_of_range while trying to write the name of the status " << rep.stat << std::endl;
	}

	for (mpp::Header h : rep.headers)
	{
		std::string headerName = h.getName();
		os << headerName << ": "; // Write the header's name and a colon to separate it from its value

		/* Does the header's ANY_CLASS object contain a string or an int? */
		if (headerName == "Content-Length") // String length size value
		{
			try
			{
				os << ANY_CAST<std::string::size_type>(h.getValue()); // Fetch the length as an int and write it to the stream
			}
	
			catch (BAD_ANY_CAST& stdbace) // Rethrow it as a library error
			{
				std::ostringstream ess;
				ess << "mpp::operator<<(std::ostream& os, const mpp::Reply& rep): the \"Content-Length\" header has a value of non-std::string::sizde_type type associated with it!" << std::endl
				<< "Error: " << stdbace.what() << std::endl;
				mpp::exceptions::BadHeaderValue toThrow(ess.str());
				throw toThrow;
			}
		}

		else // String value
		{
			try
			{
				os << ANY_CAST<std::string>(h.getValue()); // Fetch the header's value as a string and write it to the stream
			}
	
			catch (BAD_ANY_CAST& stdbace) // Rethrow it as a library error
			{
				std::ostringstream ess;
				ess << "mpp::operator<<(std::ostream& os, const mpp::Reply& rep): the \"" << h.getName() << "\" header has a non-string value associated with it!" << std::endl
				<< "Error: " << stdbace.what() << std::endl;
				mpp::exceptions::BadHeaderValue toThrow(ess.str());
				throw toThrow;
			}
		}

		os << "\r\n"; // End this header line
	}
	
	os << "\r\n"; // End the headers

	if (!rep.content.empty()) // There is content
	{
		os << rep.content; // Write it
	}

	return os;
}

/**
* @desc Clears this Reply object's list of headers.
**/
void mpp::Reply::clearHeaders()
{
	headers.clear();
}

/**
* @desc Attempts to set the Reply's status to that of the numeric code given.
*	RepParser ensures that the numeric code is in the valid range for the enumeration.
* @param code The code to set.
**/
void mpp::Reply::setStatus(short code)
{
	setStatus(static_cast<mpp::Reply::Status>(code)); // Convert it to an enum value (which we know will be valid)
}

/**
* @desc Fetches the reply's status.
* @return This reply's status.
**/
mpp::Reply::Status mpp::Reply::getStatus() const
{
	return stat;
}

#ifdef DEBUG
/**
* @desc This method prints the reply buffers.
**/
void mpp::Reply::printRepBufs()
{
	std::size_t bufNum = 1;

	for (auto buf : repBufs)
	{
		std::size_t bufSiz = buf.size();
		const char* bufDat = static_cast<const char*>(buf.data());
		std::cout << bufNum << ")\t";

		for (std::size_t i = 0; i < bufSiz; i++)
		{
			std::cout << bufDat[i];
		}

		std::cout << std::endl;
		++bufNum;
	}
}

/**
* @desc This method prints the reply buffer contents held in the vector of strings.
**/
void mpp::Reply::printRepBufConts()
{
	std::size_t contNum = 1;

	for (auto str : repBufConts)
	{
		std::cout << contNum << ")\t" << str << std::endl;
		++contNum;
	}
}
#endif

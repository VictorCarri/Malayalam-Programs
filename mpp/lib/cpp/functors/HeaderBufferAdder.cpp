/* STL */
#include <utility> // std::move
#include <vector> // std::vector
#include <any> // std::any_cast, std::bad_any_cast
#include <string> // std::string
#include <sstream> // std::ostringstream
#include <iostream> // std::endl

/* Boost */
#include <boost/asio.hpp> // boost::asio::const_buffer

/* Our headers */
#include "mpp/Header.hpp" // mpp::Header
#include "mpp/exceptions/BadHeaderValue.hpp" // mpp::exceptions::BadHeaderValue
#include "mpp/functors/HeaderBufferAdder.hpp" // Class def'n

/**
* @desc Constructor. Stores a reference to the vector to be modified.
* @param bufs A reference to the vector to be modified.
**/
mpp::functors::HeaderBufferAdder::HeaderBufferAdder(std::vector<boost::asio::const_buffer>& bufs) :
	buffers(bufs), // Store a reference to the vector so that we can modify directly
	nameValSep {':', ' '}, // Separator between header names & values
	crlf {'\r', '\n'}
{
}

/**
* @desc Function call operator. Adds the given Header object $h to the vector of buffers $bufs.
* @param h The Header to add to the vector of buffers.
**/
void mpp::functors::HeaderBufferAdder::operator()(mpp::Header h)
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
			length = std::any_cast<int>(h.getValue()); // Fetch the length
		}

		catch (std::bad_any_cast& stdbace) // Rethrow it as a library error
		{
			std::ostringstream ess;
			ess << "mpp::functors::HeaderBufferAdder::operator(): the \"Content-Length\" header has a non-integer value associated with it!" << std::endl
			<< "Error: " << stdbace.what() << std::endl;
			mpp::exceptions::BadHeaderValue toThrow(ess.str());
			throw toThrow;
		}

		std::ostringstream convSS; // Used to convert int to str
		convSS << length;
		val = convSS.str();
	}

	else // String value
	{
		try
		{
			val = std::any_cast<std::string>(h.getValue()); // Fetch the string value
		}

		catch (std::bad_any_cast& stdbace) // Rethrow it as a library error
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

/**
* @desc Copy constructor.
* @param other The other functor to copy from.
**/
mpp::functors::HeaderBufferAdder::HeaderBufferAdder(const mpp::functors::HeaderBufferAdder& other) : buffers {other.buffers},
	nameValSep {other.nameValSep},
	crlf {other.crlf}
{
}

/**
* @desc Move constructor.
* @param other The other functor to move from.
**/
mpp::functors::HeaderBufferAdder::HeaderBufferAdder(mpp::functors::HeaderBufferAdder&& other) : buffers(other.buffers),
	nameValSep(other.nameValSep),
	crlf(other.crlf)
{
	other.buffers.clear(); // Complete the move

	/* Clear the other array */
	other.nameValSep[0] = '\0';
	other.nameValSep[1] = '\0';
	other.crlf[0] = '\0';
	other.crlf[1] = '\0';
}

/**
* @desc Copy assignment operator.
* @param other The other functor to copy from.
* @return A reference to this functor.
**/
mpp::functors::HeaderBufferAdder& mpp::functors::HeaderBufferAdder::operator=(const mpp::functors::HeaderBufferAdder& other)
{
	if (this != &other) // Not self-assignment
	{
		buffers = other.buffers;
		nameValSep = other.nameValSep;
		crlf = other.crlf;
	}

	return *this; // Allow chaining
}

/**
* @desc Move assignment operator.
* @param other The other functor to copy from.
* @return A reference to this functor.
**/
mpp::functors::HeaderBufferAdder& mpp::functors::HeaderBufferAdder::operator=(mpp::functors::HeaderBufferAdder&& other)
{
	if (this != &other) // Not self-assignment
	{
		buffers = std::move(other.buffers);
		nameValSep = std::move(other.nameValSep);
		crlf = std::move(other.crlf);
	}

	return *this; // Allow chaining
}

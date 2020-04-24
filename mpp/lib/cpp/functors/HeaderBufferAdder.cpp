/* STL */
#include <utility> // std::move

/* Boost */
#include <boost/asio.hpp> // boost::asio::buffer

/* Our headers */
#include "mpp/functors/HeaderBufferAdder.hpp" // Class def'n
#include "mpp/Header.hpp" // mpp::Header

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
	buffers.push_back(boost::asio::buffer(h.getValue()));
	buffers.push_back(boost::asio::buffer(crlf));
}

/**
* @desc Copy constructor.
* @param other The other functor to copy from.
**/
mpp::functors::HeaderBufferAdder::HeaderBufferAdder(const mpp::functors::HeaderBufferAdder& other) : buffers(other.buffers),
	nameValSep(other.nameValSep),
	crlf(other.crlf)
{
}

/**
* @desc Move constructor.
* @param other The other functor to move from.
**/
mpp::functors::HeaderBufferAdder::HeaderBufferAdder(mpp::functors::HeaderBufferAdder&& other) : buffers(std::move(other.buffers)),
	nameValSep(std::move(other.nameValSep)),
	crlf(std::move(other.crlf))
{
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
mpp::functors::HeaderBufferAdder& mpp::functors::HeaderBufferAdder::operator=(const mpp::functors::HeaderBufferAdder& other)
{
	if (this != &other) // Not self-assignment
	{
		buffers = std::move(other.buffers);
		nameValSep = std::move(other.nameValSep);
		crlf = std::move(other.crlf);
	}

	return *this; // Allow chaining
}

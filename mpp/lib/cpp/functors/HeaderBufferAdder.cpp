/* Boost */
#include <boost/asio.hpp> // boost::asio::buffer

/* Our headers */
#include "mpp/functors/HeaderBufferAdder.hpp" // Class def'n
#include "mpp/Header.hpp" // mpp::Header

/**
* @desc Constructor. Stores a reference to the vector to be modified.
* @param bufs A reference to the vector to be modified.
**/
mpp::HeaderBufferAdder::HeaderBufferAdder(std::vector<boost::asio::const_buffer>& bufs) :
	buffers(bufs), // Store a reference to the vector so that we can modify directly
	nameValSep {':', ' '}, // Separator between header names & values
	crlf {'\r', '\n'}
{
}

/**
* @desc Function call operator. Adds the given Header object $h to the vector of buffers $bufs.
* @param h The Header to add to the vector of buffers.
**/
void mpp::HeaderBufferAdder::operator()(mpp::Header h)
{
	buffers.push_back(boost::asio::buffer(h.getName()));
	buffers.push_back(boost::asio::buffer(nameValSep));
	buffers.push_back(boost::asio::buffer(h.getValue()));
	buffers.push_back(boost::asio::buffer(crlf));
}

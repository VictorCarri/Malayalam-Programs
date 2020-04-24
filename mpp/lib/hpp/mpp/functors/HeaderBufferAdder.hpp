#ifndef MPP_FUNCTORS_HEADERBUFFERADDER_HPP
#define MPP_FUNCTORS_HEADERBUFFERADDER_HPP

/* Standard C++ */
#include <vector> // std::vector
#include <array> // std::array

/* Boost */
#include <boost/asio.hpp> // boost::asio::const_buffer

/* Our headers */
#include "mpp/Header.hpp" // Header class

namespace mpp
{
	namespace functors
	{
		class HeaderBufferAdder
		{
			public:
				/**
				* @desc Constructor. Stores a reference to the vector to be modified.
				* @param bufs A reference to the vector to be modified.
				**/
				HeaderBufferAdder(std::vector<boost::asio::const_buffer>& bufs);

				/**
				* @desc Function call operator. Adds the given Header object $h to the vector of buffers $bufs.
				* @param h The Header to add to the vector of buffers.
				**/
				void operator()(mpp::Header h);

				/**
				* @desc Copy constructor.
				* @param other The other functor to copy from.
				**/
				HeaderBufferAdder(const HeaderBufferAdder& other);

				/**
				* @desc Move constructor.
				* @param other The other functor to move from.
				**/
				HeaderBufferAdder(HeaderBufferAdder&& other);

				/**
				* @desc Copy assignment operator.
				* @param other The other functor to copy from.
				* @return A reference to this functor.
				**/
				HeaderBufferAdder& operator=(const HeaderBufferAdder& other);

				/**
				* @desc Move assignment operator.
				* @param other The other functor to copy from.
				* @return A reference to this functor.
				**/
				HeaderBufferAdder& operator=(const HeaderBufferAdder& other);

			private:
				std::vector<boost::asio::const_buffer>& buffers; // A reference to the vector that we modify
				/*char nameValSep[2];
				char crlf[2];*/
				std::array<char, 2> nameValSep;
				std::array<char, 2> crlf;
		};
	};
};

#endif // MPP_FUNCTORS_HEADERBUFFERADDER_HPP

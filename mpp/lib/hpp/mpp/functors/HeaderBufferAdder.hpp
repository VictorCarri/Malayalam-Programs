#ifndef MPP_FUNCTORS_HEADERBUFFERADDER_HPP
#define MPP_FUNCTORS_HEADERBUFFERADDER_HPP

/* Standard C++ */
#include <vector> // std::vector

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
				* @desc Constructor. Stores a reference to the
				**/
				HeaderBufferAdder(std::vector<boost::asio::const_buffer>& bufs);

				void operator()(mpp::Header h);

			private:
				std::vector<boost::asio::const_buffer>& buffers; // A reference to the vector that we modify
		};
	};
};

#endif // MPP_FUNCTORS_HEADERBUFFERADDER_HPP

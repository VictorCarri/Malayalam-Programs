#ifndef SERVER_HPP
#define SERVER_HPP

/* C++ Versions of C headers */
#include <cstddef> // std::size_t

/* STL */
#include <string> // std::string

/* Boost */
#include <boost/noncopyable.hpp>
#include <boost/asio.hpp> // boost::asio::signal_set

/* Our headers */
#include "IoContextPool.hpp" // io_context pool

class Server : private boost::noncopyable
{
	public:
		/**
		* @desc Creates a server that listens on the given port, and uses a pool of io_contexts of the given size.
		* @param port Port to listen on.
		* @param numThreads # of threads to use.
		**/
		explicit Server(const std::string& address, int port, std::size_t numThreads);

	private:
		IoContextPool iocp; // Pool of io_contexts used for async ops
//		boost::asio::signal_set signals; // Used to receive signals
};

#endif // SERVER_HPP

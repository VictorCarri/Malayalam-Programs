#ifndef SERVER_HPP
#define SERVER_HPP

/* C++ Versions of C headers */
#include <cstddef> // std::size_t

class Server
{
	public:
		/**
		* @desc Creates a server that listens on the given port, and uses a pool of io_contexts of the given size.
		* @param port Port to listen on.
		* @param ioContextPoolSize Size of the pool of io_contexts to use.
		**/
		Server(int port, std::size_t ioContextPoolSize);

	private:
		IoContextPool iocp; // A pool of io_contexts which are used to handle requests
};

#endif // SERVER_HPP

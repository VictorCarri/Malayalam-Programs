/* Our headers */
#include "Server.hpp" // Class definition

/**
* @desc Creates a server that listens on the given port, and uses a pool of io_contexts of the given size.
* @param port Port to listen on.
* @param numThreads # of threads to use.
**/
Server::Server(const std::string& address, int port, std::size_t numThreads)
	: iocp(numThreads)
{
}

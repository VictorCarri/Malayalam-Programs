/* Our headers */
#include "Server.hpp" // Class definition

/**
* @desc Creates a server that listens on the given port, and uses a pool of io_contexts of the given size.
* @param port Port to listen on.
* @param ioContextPoolSize Size of the pool of io_contexts to use.
**/
Server::Server(int port, std::size_t ioContextPoolSize) : iocp(ioContextPoolSize)
{
}

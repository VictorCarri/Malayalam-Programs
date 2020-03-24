/* C headers */
#include <signal.h> // SIGINT, SIGTERM, SIGQUIT

/* STL */
#include <sstream> // std::stringstream
#ifdef DEBUG
#include <iostream> // std::clog
#include <string> // std::string
#endif

/* Boost */
#include <boost/bind.hpp> // boost::bind
#include <boost/asio.hpp> // boost::asio::ip::tcp::resolver, boost::asio::ip::tcp::endpoint, boost::asio::ip::tcp::acceptor::reuse_address

/* Our headers */
#include "Server.hpp" // Class definition

/**
* @desc Creates a server that listens on the given port, and uses a pool of io_contexts of the given size.
* @param port Port to listen on.
* @param numThreads # of threads to use.
**/
Server::Server(const std::string& address, int port, std::size_t numThreads)
	: 	iocp(numThreads),
		signals(iocp.getIoc()),
		acceptor(iocp.getIoc())
{
	/*
	* Register to handle signals that indicate that the server should exit.
	* It is safe to register for the same signal multiple times in a program,
	* provided all registration for the specified signal is made through Asio.
	*/
	signals.add(SIGINT);
	signals.add(SIGTERM);
	#ifdef SIGQUIT
	signals.add(SIGQUIT);
	#endif
	signals.async_wait(boost::bind(&Server::handleStop, this));

	/* Convert the port # to an std::string */
	std::stringstream portNumSS;
	portNumSS << port; // Insert the port #

	/* Open the acceptor with the option to reuse the address */
	boost::asio::ip::tcp::resolver resolver(acceptor.get_executor());
	boost::asio::ip::tcp::endpoint endPoint = *(resolver.resolve(address, portNumSS.str()).begin()); // Use the first endpoint found that corresponds to the given address & port #
	acceptor.open(endPoint.protocol());
	#ifdef DEBUG
	std::string negStr =  acceptor.is_open() ? "" : "n't";
	std::clog << "Server::Server: acceptor has" << negStr << " opened." << std::endl;
	#endif
	acceptor.set_option(boost::asio::ip::tcp::acceptor::reuse_address(true));
	acceptor.bind(endPoint);
	acceptor.listen();

	//startAccept();
}

/**
* @desc Handles a request to stop the server.
**/
void Server::handleStop()
{
	iocp.stop();
}

/**
* @desc Runs the server's io_context loop.
**/
void Server::run()
{
	iocp.run(); // Run the pool
}

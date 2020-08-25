/* C++ versions of C headers */
#include <csignal> // SIGINT, SIGTERM, SIGQUIT

/* STL */
#include <sstream> // std::stringstream
#include <string> // std::string
#ifdef DEBUG
#include <iostream> // std::clog
#include <iomanip> // std::quoted
#endif

/* Our headers */
#include "bosmacros/bind.hpp" // Defines the macro BIND_FUNCTION, that resolves to either boost::bind or std::bind
#include "Connection.hpp" // Connection class
#include "Server.hpp" // Class definition

/**
* @desc Creates a server that listens on the given port, and uses a pool of io_contexts of the given size.
* @param port Port to listen on.
* @param numThreads # of threads to use.
* @param progName The program's name.
* @param dbConfPath The path to the DB config file.
**/
Server::Server(const std::string& address, int port, std::size_t numThreads, std::string progName, std::string dbConfPath)
	: 	iocp(numThreads),
		signals(iocp.getIoc()),
		acceptor(iocp.getIoc()),
		reqHandler(dbConfPath), // Pass the request-handler the path to the DB config file
		pName(progName)
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
	signals.async_wait(BIND_FUNCTION(&Server::handleStop, this));
	/*signals.async_wait([this]() // Need to use this object
		{
			handleStop(); // Call our handler
		}
	);*/

	#ifdef DEBUG
	std::cout << pName << ":Server::Server: registered signals" << std::endl;
	#endif

	/* Convert the port # to an std::string */
	std::stringstream portNumSS;
	portNumSS << port; // Insert the port #

	#ifdef DEBUG
	std::cout << pName << ":Server::Server: port # stringstream's contents are " << std::quoted(portNumSS.str()) << std::endl;
	#endif

	/* Open the acceptor with the option to reuse the address */
	boost::asio::ip::tcp::resolver resolver(acceptor.get_executor());
	boost::asio::ip::tcp::endpoint endPoint = *(resolver.resolve(address, portNumSS.str()).begin()); // Use the first endpoint found that corresponds to the given address & port #
	acceptor.open(endPoint.protocol());
	#ifdef DEBUG
	if (acceptor.is_open())
	{
		std::cout << pName << ":Server::Server: listening on " << address << ":" << port << std::endl
		<< "\tusing " << numThreads << " threads" << std::endl;
	}

	else
	{
		std::cout << pName << ":Server::Server: acceptor failed to open." << std::endl;
	}
	#endif
	acceptor.set_option(boost::asio::ip::tcp::acceptor::reuse_address(true));
	acceptor.bind(endPoint);
	acceptor.listen();

	#ifdef DEBUG
	std::cout << pName << ":Server::Server: calling startAccept." << std::endl;
	#endif
	startAccept();
}

/**
* @desc Handles a request to stop the server.
**/
void Server::handleStop()
{
	#ifdef DEBUG
	std::cout << pName << ":Server::handleStop called" << std::endl;
	#endif
	iocp.stop();
}

/**
* @desc Runs the server's io_context loop.
**/
void Server::run()
{
	#ifdef DEBUG
	std::cout << pName << ":Server::run called" << std::endl;
	#endif
	iocp.run(); // Run the pool
}

/**
* @desc Initiates an asynchronous accept operation.
**/
void Server::startAccept()
{
	newConn.reset(
		new Connection(
			iocp.getIoc(),
			reqHandler
		)
	);
	#ifdef DEBUG
	std::cout << pName << ":Server::startAccept: reset newConn" << std::endl;
	#endif
	acceptor.async_accept(
		newConn->getSocket(),
		BIND_FUNCTION(
			&Server::handleAccept,
			this,
			boost::asio::placeholders::error
		)
		/*[this](const boost::system::error_code& e)
		{
			handleAccept(e);
		}*/
	);
	#ifdef DEBUG
	std::cout << pName << ":Server::startAccept: called acceptor.async_accept" << std::endl;
	#endif
}

/**
* @desc Handles completion of an asynchronous accept operation.
* @param e An error object, if any occurred.
**/
void Server::handleAccept(const boost::system::error_code& e)
{
	#ifdef DEBUG
	std::cout << pName << ":Server::handleAccept called" << std::endl;
	#endif

	if (!e)
	{
		#ifdef DEBUG
		std::cout << pName << ":Server::handleAccept: no error" << std::endl;
		#endif
		newConn->start(); // Start the new connection
	}

	#ifdef DEBUG
	std::cout << pName << ":Server::handleAccept: calling startAccept" << std::endl;
	#endif
	startAccept();
}

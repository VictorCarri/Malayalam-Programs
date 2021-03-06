/* Boost */
#include <boost/asio.hpp> // boost::asio::io_context, boost::asio::buffer, boost::asio::async_write, boost::asio::placeholders::error, boost::asio::placeholders::bytes_transferred, boost::asio::ip::tcp::socket::shutdown_both
#include <boost/logic/tribool.hpp> // boost::tribool
#include <boost/tuple/tuple.hpp> // boost::tie, boost::tuples::ignore
#include <boost/system/error_code.hpp> // boost::system::error_code

/* Our headers */
#include "BindFunc.hpp" // BIND_FUNCTION macro
#include "ErrorCode.hpp" // ERROR_CODE macro
#include "mpp/ReqHandler.hpp" // Request handler class
#include "Connection.hpp" // Class def

/**
* @desc Constructs a Connection with the givne io_context & request handler.
* @param io_context The io_context to use.
* @param handler The request handler object to use.
**/
Connection::Connection(boost::asio::io_context& io_context, mpp::ReqHandler& handler) :
	socket(io_context),
	reqHandler(handler)
{
}

/**
* @desc Fetches the socket associated with this Connection.
* @return The socket associated with this Connection.
**/	
boost::asio::ip::tcp::socket& Connection::getSocket()
{
	return socket;
}

/**
* @desc Starts the first asynchronous operation for the connection.
**/
void Connection::start()
{
	socket.async_read_some(
		boost::asio::buffer(
			buffer
		),
		BIND_FUNCTION(
			&Connection::handleRead,
			shared_from_this(),
			boost::asio::placeholders::error,
			boost::asio::placeholders::bytes_transferred
		)
	);
}

/**
* @desc Handles completion of a read operation.
* @param e An error code. Set if an error occurred during the read.
* @param bytesTransferred # of bytes transferred during the read.
**/
void Connection::handleRead(const ERROR_CODE& e, std::size_t bytesTransferred)
{
	if (!e)
	{
		/* Parse a request and check what state the parser is in */
		boost::tribool result;
		boost::tie(result, boost::tuples::ignore) = reqParser.parse(
			req,
			buffer.data(),
			buffer.data() + bytesTransferred
		);

		if (result) // The parser successfully parsed an entire request
		{
			reqHandler.handleReq(req, rep); // Handle a request - generate a reply according to what the client requested
			boost::asio::async_write(
				socket,
				rep.toBuffers(),
				BIND_FUNCTION(
					&Connection::handleWrite,
					shared_from_this(),
					boost::asio::placeholders::error
				)
			);
		}

		else if (!result) // Malformed request
		{
			rep = mpp::Reply::stockReply(reqParser.getStatus()); // Generate a stock reply using the error code which the parser identified
			boost::asio::async_write(
				socket,
				rep.toBuffers(),
				BIND_FUNCTION(
					&Connection::handleWrite,
					shared_from_this(),
					boost::asio::placeholders::error
				)
			);
		}

		else // Need more data
		{
			socket.async_read_some(
				boost::asio::buffer(buffer),
				BIND_FUNCTION(
					&Connection::handleRead,
					shared_from_this(),
					boost::asio::placeholders::error,
					boost::asio::placeholders::bytes_transferred
				)
			);
		}
	}

	/*
	* No new async. ops. are started if an error occurs. Thus, all shared_ptr
	* references to the connection object will disappear and the object will be
	* destroyed automatically after this handler returns. The Connection class'
	* destructor closes the socket.
	*/
}

/**
* @desc Handles completion of a write operation.
* @param e Describes what error occurred, if any.
**/
void Connection::handleWrite(const ERROR_CODE& e)
{
	if (!e) // No error
	{
		/* Close the connection gracefully */
		ERROR_CODE ignoredEc;
		socket.shutdown(boost::asio::ip::tcp::socket::shutdown_both, ignoredEc);
	}

	/*
	* No new async. ops. are started. THus, all shared_ptr references to the
	* Connection object will disappear, and the object will be destroyed
	* automatically after this handler returns. The connection class'
	* (automatic) destructor closes the socket.
	*/
}

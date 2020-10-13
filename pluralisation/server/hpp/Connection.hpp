#ifndef CONNECTION_HPP
#define CONNECTION_HPP

/* C++ versions of C headers */
#include <cstddef> // std::size_t

/* STL */
#include <array> // std::array
#include <string> // std::string

/* Boost */
#include <boost/noncopyable.hpp> // boost::noncopyable
#include <boost/asio.hpp> // boost::asio::io_context, boost::asio::ip::tcp::socket

/* Our headers - Malayalam Pluralisation Protocol library */
#include "mpp/ReqHandler.hpp" // Request handler
#include "mpp/ReqParser.hpp" // Request parser
#include "mpp/Request.hpp" // Represents a request
#include "mpp/Reply.hpp" // Represents a reply

/* Our headers - macros to choose between Boost and std implementations */
#include "bosmacros/enable_shared_from_this.hpp" // ENABLE_SHARED_FROM_THIS macro
#include "bosmacros/error_code.hpp" // ERROR_CODE macro
#include "bosmacros/shared_ptr.hpp" // SHARED_PTR macro

/**
* This class is templated so that any protocol's classes can be used with this.
**/
class Connection : public ENABLE_SHARED_FROM_THIS<Connection>,
			private boost::noncopyable
{
	public:
		/**
		* @desc Constructs a Connection with the givne io_context & request handler.
		* @param io_context The io_context to use.
		* @param dbConfFilePath Path to configuration file containing DB vars. Used to construct ReqHandler.
		**/
		explicit Connection(boost::asio::io_context& io_context, std::string dbConfFilePath);
	
		/**
		* @desc Fetches the socket associated with this Connection.
		* @return The socket associated with this Connection.
		**/	
		boost::asio::ip::tcp::socket& getSocket();

		/**
		* @desc Starts the first asynchronous operation for the connection.
		**/
		void start();

	private:

		/**
		* @desc Handles completion of a read operation.
		* @param e An error code. Set if an error occurred during the read.
		* @param bytesTransferred # of bytes transferred during the read.
		**/
		void handleRead(const ERROR_CODE& e, std::size_t bytesTransferred);

		/**
		* @desc Handles completion of a write operation.
		* @param e Describes what error occurred, if any.
		**/
		void handleWrite(const ERROR_CODE& e, std::size_t bytesTransferred);

		boost::asio::ip::tcp::socket socket; // We listen on this
		mpp::ReqHandler reqHandler; // Parses requests. Each Connection object constructs its own copy because the connection to the DB will time out if the object lasts for too long.
		std::array<char, 8192> buffer; // Stores data read from the socket
		mpp::ReqParser reqParser;
		mpp::Request req;
		mpp::Reply rep;
};

typedef SHARED_PTR<Connection> ConnectionPtr;

#endif // CONNECTION_HPP

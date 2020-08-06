#ifndef CLIENT_HPP
#define CLIENT_HPP

/* C++ versions of C headers */
#include <cstddef> // std::size_t

/* Standard C++ */
#ifdef DEBUG
#include <ios> // std::ios_base::fmtflags
#endif

#include <string> // std::string
#include <memory> // std::unique_ptr
#include <map> // std::map

/* Boost */
#include <boost/asio/signal_set.hpp> // boost::asio::signal_set
#include <boost/asio/io_context.hpp> // boost::asio::io_context
#include <boost/asio/ip/tcp.hpp> // boost::asio::ip::tcp::socket, boost::asio::ip::tcp::resolver
#include <boost/system/error_code.hpp> // boost::system::error_code
#include <boost/asio/ip/tcp.hpp> // boost::asio::ip::tcp::endpoint

/* MPP */
#include "mpp/Request.hpp" // mpp::Request

/* Our headers */
#include "bosmacros/thread.hpp" // THREAD macro

/*
* This class encapsulates our client. It maintains state and handles all communication with the server, using input from the loop in main().
*/
class Client
{
	public:
		/**
		* @desc Tells the client that it should switch to a "active" state.
		**/
		void start();

		/**
		* @desc Default constructor. Initialises our state.
		**/
		Client();

		/**
		* @desc Main constructor. Initialises the client to connect to a server on the given host and port.
		* @param host The host to connect to.
		* @param port The port on the host to connect to.
		**/
		Client(char* host, short port);

		/**
		* @desc Tells the caller whether or not the client is active.
		* @return True if the client is active, false otherwise.
		**/
		bool isActive() const;

		#ifdef DEBUG
		/**
		* @desc Destructor. This is only needed in debug mode, to reset std::cout's flags to their original values.
		**/
		~Client();
		#endif

		/**
		* @desc Prompts the user for a Malayalam noun.
		*	It then fetches a space-terminated string and stores it in a property.
		**/
		void readInput();

		/**
		* @desc Determines whether or not the user has requested that we quit, based on the value of $input.
		* @return True if the user has requested that we quit, false otherwise.
		**/
		bool shouldQuit() const;

		/**
		* @desc Tells the client to quit.
		**/
		void quit();

		/**
		* @desc Fetches the current input string.
		* @return The current input string.
		**/
		std::string getInput() const;

		/**
		* @desc Checks whether or not the input string is a valid UTF-8 string.
		* @return True if the input string is a valid UTF-8 string, false otherwise.
		**/
		bool isInputValidUTF8() const;

		/**
		* @desc Determines whether or not the input string contains only Malayalam codepoints.
		* @return True if the input string contains only Malayalam codepoints, false otherwise.
		**/
		bool isInputValidMalayalam() const;

		/**
		* @desc Determines whether or not the current noun is singular by sending a request to the server.
		* @return True if the noun is singular, false otherwise.
		**/
		bool isSingular() const;

	private:
		/*** Methods ***/

		/**
		* @desc Creates and returns a copy of the given string with all alphabetic characters converted to lowercase.
		* @param toChange The string to create a lowercase copy of.
		* @return A copy of the given parameter with all alphabetic characters converted to lowercase.
		**/
		std::string toLower(const std::string toChange) const;

		/**
		* @desc Handles the signals that we registered to listen for. Causes the client to quit.
		* @param bsec An error code, set if an error occurred during the async. op.
		* @param sigNo The # of the signal that was caught.
		**/
		void signalHandler(const boost::system::error_code& ec, int sigNo);

		/**
		* @desc Runs our I/O context from our thread.
		**/
		void threadFunc();

		/**
		* @desc Callback for an attempt to connect to the server. Tries to send a request using the current input.
		* @param ec An error code. Set if any error occurred during the connection operation.
		* @param endPoint The endpoint that we connected to, if the connection operation was successful.
		**/
		void handleConnect(const boost::system::error_code& ec, const boost::asio::ip::tcp::endpoint& endPoint);

		/**
		* @desc Callback for sending the request to the server. Tries to read a response from the server.
		* @param ec An error code. Set if an error occurred during the write operation.
		* @param bytesTransferred The # of bytes that were sent to the server.
		**/
		void handleWrite(const boost::system::error_code& ec, std::size_t bytesTransferred);

		/*** Properties ***/

		bool active; // Whether or not we're active
		std::string input; // User input (before validation)
		boost::asio::io_context ioc; // Req'd by signal_set
		boost::asio::signal_set signals; // Used to catch signals that indicate that we should quit.
		boost::asio::ip::tcp::resolver resolver; // Used to resolve the server's address
		boost::asio::ip::tcp::resolver::results_type endpoints; // A list of possible end-points
		std::unique_ptr<boost::asio::ip::tcp::socket> sock; // The socket which we'll use to communicate
		std::unique_ptr<THREAD> workerThread; // The thread which keeps our I/O context running
		std::unique_ptr<mpp::Request> reqPtr; // This must be a property because the asynchronous handler functions need to be able to access it after the method that started the async. op. ends
		std::map<int, std::string> sigMsgs; // Stores messages to be printed upon catching a particular signal
		#ifdef DEBUG
		std::ios_base::fmtflags initFlags; // The initial flags of std::cout. We save them in the constructor, and restore them in the destructor.
		#endif

		/* Version #s */
		int major = 1;
		int minor = 6; // Asking the user for a noun, reading input, checking for exit, signal handling, validating UTF-8, validating that input is Malayalam text
		int patch = 5;
};

#endif // CLIENT_HPP

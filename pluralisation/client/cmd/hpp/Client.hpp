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
#include <vector> // std::vector
#include <functional> // std::function
#include <array> // std::array

/* Boost */
#include <boost/asio/signal_set.hpp> // boost::asio::signal_set
#include <boost/asio/io_context.hpp> // boost::asio::io_context
#include <boost/asio/ip/tcp.hpp> // boost::asio::ip::tcp::socket, boost::asio::ip::tcp::resolver, boost::asio::ip::tcp::resolver::results_type, boost::asio::ip::tcp::endpoint
#include <boost/asio/buffer.hpp> // boost::asio::const_buffer, boost::asio::mutable_buffer
#include <boost/asio/streambuf.hpp> // boost::asio::streambuf
#include <boost/system/error_code.hpp> // boost::system::error_code

/* MPP */
#include "mpp/Request.hpp" // mpp::Request
#include "mpp/RepParser.hpp" // mpp::RepParser
#include "mpp/Reply.hpp" // mpp::Reply

/* Our headers */
#include "bosmacros/thread.hpp" // THREAD_CLASS macro

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
		Client(const char* host, unsigned port);

		/**
		* @desc Tells the caller whether or not the client is active.
		* @return True if the client is active, false otherwise.
		**/
		bool isActive() const;

		/**
		* @desc Destructor. Performs 3 functions:
		*	1) In debug mode, it resets cout's flags.
		*	2) In all modes, it closes our socket.
		*	3) In all modes, it waits for our thread to join.
		**/
		~Client();

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
		* @param issingCallback A callback that will be called once the entire chain of asynchronous operations finishes.
		**/
		void isSingular(std::function<void(bool, std::string)> issingCallback);

		/**
		* @desc Finds the opposite form of a given noun.
		* @param fofCallback A callback that will be called once the chain of asynchronous operations involved in a FOF request finishes successfully.
		**/
		void findOppositeForm(std::function<void(std::string)> fofCallback);

	private:
		/*** Methods ***/

		/**
		* @desc Creates and returns a copy of the given string with all alphabetic characters converted to lowercase.
		* @param toChange The string to create a lowercase copy of.
		* @return A copy of the given parameter with all alphabetic characters converted to lowercase.
		**/
		std::string toLower(const std::string toChange) const;

		/**
		* @desc A callback that handles a successful connection to the server.
		*	As its name implies, it sends the ISSING request to the server.
		**/
		void sendSingReq();

		/**
		* @desc Called after the ISSING request has been sent.
		*	It reads the status line, and then decides how to proceed.
		**/
		void readSingRepStatus();

		/**
		* @desc Reads a header from the socket and stores it in the reply.
		**/
		void readHeader();

		/**
		* Handles the reply from the server.
		**/
		void handleReply();

		/**
		* @desc Sends the FOF request to the server after findOppositeForm establishes a connection.
		**/
		void sendFofReq();

		/**
		* @desc Resets our socket. Called at the end of each request and on destruction.
		**/
		void resetSocket();

		/*** Properties ***/

		bool active; // Whether or not we're active
		std::string input; // User input (before validation)
		boost::asio::io_context ioc; // Needed by Boost.Asio to talk to the OS
		boost::asio::signal_set signals; // Used to catch signals that indicate that we should quit.
		boost::asio::ip::tcp::resolver resolver; // Used to resolve the server's address
		boost::asio::ip::tcp::socket sock; // The socket which we'll use to communicate
		std::unique_ptr<THREAD_CLASS> workerThread; // The thread which keeps our I/O context running
		std::map<int, std::string> sigMsgs; // Stores messages to be printed upon catching a particular signal
		typename boost::asio::ip::tcp::resolver::results_type resolveResults; // Stores the results of the async_resolve operation
		std::function< void (bool, std::string)> isCB; // The callback that will be called once the sequence of operations involved in isSingular is complete.
		std::vector<boost::asio::const_buffer> reqBufs; // Holds the request buffers so that they won't be destroyed when a method ends and the vector goes out of scope.
		mpp::Request curReq; // The current request
		boost::asio::streambuf repBuf; // Holds the reply data to be parsed
		mpp::RepParser repParser; // Parses a reply from the buffer
		mpp::Reply rep; // The server's reply
		std::unique_ptr<THREAD_CLASS> signalThread; // Used to handle signals, separately from the async. ops. thread
		std::function<void(std::string)> fofCB; // The callback that will be called once the chain of async. ops. involved in a FOF request finishes.
		const std::string contentType; // Holds the content-type for all our text (text/plain;charset=utf-8)
		#ifdef DEBUG
		std::ios_base::fmtflags initFlags; // The initial flags of std::cout. We save them in the constructor, and restore them in the destructor.
		#endif

		/* Version #s */
		int major = 1;
		int minor = 10; // Asking the user for a noun, reading input, checking for exit, signal handling, validating UTF-8, validating that input is Malayalam text, sending the iSSING request, parsing the ISSING reply's status, parsing the ISSING reply's headers, detecting the end of the headers & calling the ISSING callback
		int patch = 5;
};

#endif // CLIENT_HPP

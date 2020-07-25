#ifndef CLIENT_HPP
#define CLIENT_HPP

/* Standard C++ */
#ifdef DEBUG
#include <ios> // std::ios_base::fmtflags
#endif

#include <string> // std::string

/* Boost */
#include <boost/asio.hpp> // boost::asio::signal_set, boost::asio::io_context
#include <boost/system/error_code.hpp> // boost::system::error_code

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
		* Default constructor. Initialises our state.
		**/
		Client();

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

	private:
		/*** Methods ***/

		/**
		* @desc Creates and returns a copy of the given string with all alphabetic characters converted to lowercase.
		* @param toChange The string to create a lowercase copy of.
		* @return A copy of the given parameter with all alphabetic characters converted to lowercase.
		**/
		std::string toLower(const std::string toChange) const;

		/**
		* @desc This method performs the appropriate action upon receiving a signal (which is usually quitting).
		* @param ec An error code that was set when the operation failed.
		* @param sig The signal that occurred.
		**/
		void signalHandler(const boost::system::error_code& ec, int sig);
		
		/*** Properties ***/

		bool active; // Whether or not we're active
		std::string input; // User input (before validation)
		boost::asio::io_context ioc; // Req'd by signal_set
		boost::asio::signal_set signals; // Used to catch signals that indicate that we should quit.
		#ifdef DEBUG
		std::ios_base::fmtflags initFlags; // The initial flags of std::cout. We save them in the constructor, and restore them in the destructor.
		#endif

		/* Version #s */
		int major = 1;
		int minor = 4; // Asking the user for a noun, reading input, checking for exit, signal handling
		int patch = 5;
};

#endif // CLIENT_HPP

#ifndef CLIENT_HPP
#define CLIENT_HPP

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

	private:
		bool active; // Whether or not we're active
};

#endif // CLIENT_HPP

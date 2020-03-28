#ifndef REQUEST_HPP
#define REQUEST_HPP

class Request
{
	public:
		enum Command
		{
			FOF // Find opposite form (singular -> plural, plural -> singular),
			ISSING, // Determine whether or not the current form is singular
			INVALID // A Request object is initialised to use this 
		};

		/**
		* @desc Default constructor. Initialises the command to an invalid one.
		**/
		Request();

		/**
		* @desc Sets the command associated with this request.
		**/
		void setCommand(Command com);

		/**
		* @desc Fetches the command associated with this request.
		**/
		Command getCommand() const;

	private:
		Command c; // The command which this request asks the server to perform
};

#endif // REQUEST_HPP

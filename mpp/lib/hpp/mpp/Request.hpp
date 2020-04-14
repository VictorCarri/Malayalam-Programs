#ifndef MPP_REQUEST_HPP
#define MPP_REQUEST_HPP

/* Because I keep switching */
#define GETCOM_FUNC getCommand
#define SETCOM_FUNC setCommand

namespace mpp
{
	class Request
	{
		public:
			enum Command
			{
				FOF, // Find opposite form (singular -> plural, plural -> singular),
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
			void SETCOM_FUNC(Command com);
	
			/**
			* @desc Fetches the command associated with this request.
			**/
			Command GETCOM_FUNC() const;
	
		private:
			Command c; // The command which this request asks the server to perform
	};
};

#endif // MPP_REQUEST_HPP

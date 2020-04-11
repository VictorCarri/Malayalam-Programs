#ifndef REPLY_HPP
#define REPLY_HPP

/* STL */
#include <string> // std::string

/*
* Represents a reply to a request.
*/
class Reply
{
	public:
		enum FailureCode // Reason why a request failed
		{
			badReq, // Malformed request
			badMajor, // Bad major #
			badMinor, // Bad minor #
			badPatch, // Bad patch #
			unknownVerb
		};

		/**
		* @desc Fetches a string version of the given FailureCode enum value.
		* @return A string version of the given FailureCode enum value.
		**/
		static std::string getFCString(FailureCode f);

	private:
};

#endif // REPLY_HPP

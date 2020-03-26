/* Our headers */
#include "ReqParser.hpp" // Class def'n

/**
* Construct ready to parse the request method.
**/
void ReqParser::ReqParser() : curStat(protocol_name_m) // Construct in start state
{
}

/**
* Reset to initial parser state.
**/
void ReqParser::reset()
{
	curStat = protocol_name_m;
}
		/**
		* @desc Handles the next character of input.
		* @param req The request object to set parameters on.
		* @param input The next character of input.
		**/
		boost::tribool consume(Request& req, wchar_t input);

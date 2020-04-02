/* STL */
#include <string> // std::string

/* Our headers */
#include "Reply.hpp" // Class def'n

/**
* @desc Fetches a string version of the given FailureCode enum value.
* @return A string version of the given FailureCode enum value.
**/
std::string Reply::getFCString(Reply::FailureCode f)
{
	std::string toReturn;

	switch (f)
	{
		case badReq:
		{
			toReturn = std::string("MPP/1.1 400 Bad Request");
			break;
		}

		case badMajor:
		{
			toReturn = std::string("MPP/1.1 401 Unrecognised Protocol Major Version Number");
			break;
		}

		case badMinor:
		{
			toReturn = std::string("MPP/1.1 402 Unrecognised Protocol Minor Version Number");
			break;
		}

		case badPatch:
		{
			toReturn = std::string("MPP/1.1 403 Unrecognised Protocol Patch NUmber");
			break;
		}
	
		case unknownVerb:
		{
			toReturn = std::string("MPP/1.1 404 Unrecognised Verb");
			break;
		}
	}

	return toReturn;
}

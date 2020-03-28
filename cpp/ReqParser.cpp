/* Standard C++ */
#include <locale> // std::isdigit, std::isspace, std::isalpha, std::toupper
#include <algorithm> // std::find_if
#include <string> // std:wstring

/* Boost */
#include <boost/logic/tribool.hpp> // boost::tribool, boost::indeterminate

/* Our headers */
#include "Reply.hpp" // Reply::ReasonCode, to indicate why the parser failed
#include "Request.hpp" // Request class
#include "ver.hpp" // Protocol version info
#include "ReqParser.hpp" // Class def'n

/**
* Construct ready to parse the request method.
**/
void ReqParser::ReqParser() : curStat(protocol_name_m), // Construct in start state
	version {VER_MAJOR, VER_MINOR, VER_PATCH},
	verbs {L"ISSING", L"FOF"}
{
	/*version = {VER_MAJOR, VER_MINOR, VER_PATCH}; // Initialise version info
	verbs = {L"ISSING", L"FOF"}; // Initialise array of recognised verbs*/
	
	/* Set up locale cache */
	gen.locale_cache_enabled(true);
	gen("en_US.UTF-8"); // Add US English
	gen("ml_IN.UTF-8"); // Add Malayalam
}

/**
* Reset to initial parser state.
**/
void ReqParser::reset()
{
	curStat = protocol_name_m; // Reset to init. state
}

/**
* @desc Handles the next character of input.
* @param req The request object to set parameters on.
* @param input The next character of input.
* @returns True if a valid request was parsed, false if invalid or unexpected input was received, boost::indeterminate if more info is required
**/
boost::tribool ReqParser::consume(Request& req, wchar_t input)
{
	/* Locales for parsing */
	std::locale usLoc = gen("en_US.UTF-8"); // US English, UTF-8
	std::locale mlLoc = gen("ml_IN.UTF-8"); // Malayalam
	
	prevStat = curStat; // Store the previous state, so that the 'space' state knows which parameter-parsing state to go to next

	switch (curStat)
	{
		case protocol_name_m: // Expecting 'M' of "MPP"
		{
			if (input != L'M') // Bad char. for current state
			{
				failedReason = Reply::badReq;
				return false; // Malformed
			}
			
			else // Current char is alpha. & is 'M'
			{
				curStat = protocol_name_first_p; // Go to next state - waiting for first 'P' in "MPP"
				return boost::indeterminate; // Indicate that the parser is waiting for input
			}

			break;
		}

		case protocol_name_first_p: // Expecting first 'P' of "MPP"
		{
			if (input != L'P') // Bad char. for current state
			{
				failedReason = Reply::badReq;
				return false; // Malformed
			}

			else // Current char is alpha. & is 'P'
			{
				curStat = protocol_name_second_p; // Go to next state - waiting for second 'P' in "MPP"
				return boost::indeterminate; // Indicate that the parser is waiting for input
			}

			break;
		}

		case protocol_name_second_p: // Expecting second 'P' of "MPP"
		{
			if (input != L'P') // Bad char for current state
			{
				failedReason = Reply::badReq;
				return false;
			}

			else
			{
				curStat = slash; // Expecting a '/' char next
				return boost::indeterminate;
			}

			break;
		}

		case slash: // Expecting '/' in protocol name
		{
			if (input != L'/') // Bad char for current state
			{
				failedReason = Reply::badReq;
				return false;
			}

			curStat = major; // Reading the major # in the version number
			return boost::indeterminate;

			break;
		}

		case major: // Reading a digit in the major version #
		{
			if (std::isdigit(input, usLoc)) // The current character is a digit
			{
				verSS[0] << input; // Append it to the end of the current version #
				return boost::indeterminate; // Keep parsing
			}

			else if (input == L'.') // Finished reading major #
			{
				short readVerNum; // Holds the version # which we read, for comparison
				verSS[0] >> readVerNum; // Convert string to num
	
				if (readVerNum != version[0]) // Error - incorrect major version
				{
					failedReason = Reply::badMajor;
					return false; // Invalid req.
				}

				else // Read minor # next
				{
					curStat = minor; // Need to read minor #
					return boost::indeterminate; // Keep parsing
				}
			}

			else // Invalid char. for this state
			{
				failedReason = Reply::badReq;
				return false;
			}

			break;
		}

		case minor: // Reading a digit in the minor version #
		{
			if (std::isdigit(input, usLoc)) // The current character is a digit
			{
				verSS[1] << input; // Append it to the end of the current version #
				return boost::indeterminate; // Keep parsing
			}

			else if (input == '.') // Finished reading minor #
			{
				short readVerNum; // Holds the version # which we read, for comparison
				verSS[1] >> readVerNum; // Convert string to num
	
				if (readVerNum != version[1]) // Error - incorrect minor version
				{
					failedReason = Reply::badMinor;
					return false; // Invalid req.
				}

				else // Read minor # next
				{
					curStat = patch; // Read patch #
					return boost::indeterminate; // Keep parsing
				}
			}

			else // Invalid char. for this state
			{
				failedReason = Reply::badReq;
				return false;
			}

			break;
		}

		case patch: // Reading a digit in the patch #
		{
			if (std::isdigit(input, usLoc)) // The current character is a digit
			{
				verSS[2] << input; // Append it to the end of the current version #
				return boost::indeterminate; // Keep parsing
			}

			else if (std::isspace(input, usLoc)) // Finished reading all 3 version #s, need to check the patch version
			{
				short readVerNum; // Holds the version # which we read, for comparison
				verSS[2] >> readVerNum; // Convert string to num
	
				if (readVerNum != version[2]) // Error - incorrect patch #
				{
					failedReason = Reply::badPatch;
					return false; // Invalid req.
				}

				else
				{
					curStat = verb_start; // Read verb
					return boost::indeterminate; // Keep parsing
				}
			}

			else // Invalid char. for this state
			{
				failedReason = Reply::badReq;
				return false; // Invalid request
			}

			break;
		}

		case verb_start: // Reading first char of request's verb
		{
			if (std::isalpha(input, usLoc)) // Expecting an alphabetic char as the first char of the verb
			{
				wchar_t upper = std::toupper(input, usLoc); // Convert first char. of verb to uppercase
				std::array<std::wstring, 2>::const_iterator verbIt = std::find_if(verbs.cbegin(), verbs.cend(), [=](std::wstring verb)
					{
						if (verb[0] == upper) // Found a match
						{
							return true;
						}
			
						else
						{
							return false;
						}
					}
				);

				if (verbIt = verbs.cend()) // No matching verb found
				{
					failedReason = Reply::unknownVerb;
					return false;
				}

				else // Check which verb matched
				{
					std::wstring verb = *verbIt;
					
					if (verb[0] == L'F') // Find the opposite form
					{
						curStat = fof_o; // We expect to parse the 'O' of the "FOF" command
					}

					else if (verb[0] == L'I') // Determine whether or not a form is singular
					{
						curStat = issing_first_s; // We expect to parse the first 's' of an "ISSING" command
					}

					return boost::indeterminate; // We need more info
				}
			}

			else // Unknown verb
			{
				failedReason = Reply::unknownVerb;
				return false;
			}
		}

		case fof_o: // Expect to parse the remainder of the verb 'O'
		{
			if (std::toupper(input, usLoc) == L'O') // Correct
			{
				curStat = fof_f; // Expect final 'F' of 'FOF'
				return boost::indeterminate; // Continue parsing
			}
	
			else // Error
			{
				failedReason = Reply::badReq; // Malformatted
				return false;
			}

			break;
		}

		case fof_f: // Expecting second 'f' of "FOF"
		{
			if (std::toupper(input, usLoc) == L'F') // Correct
			{
				curStat = space; // Need to skip the space which follows
				return boost::indeterminate;
			}

			else // Error
			{
				failedReason = Reply::badReq;
				return false;
			}

			break;
		}

		case issing_first_s: // Expecting first 'S' of "ISSING"
		{
			if (std::toupper(input, usLoc) == L'S') // Correct
			{
				curStat = issing_second_s; // Expecting second 'S' in "ISSING"
				return boost::indeterminate;
			}

			else // Error
			{
				failedReaosn = Reply::badReq;
				return false;
			}

			break;
		}

		case issing_second_s: // Expecting second 'S' in "ISSING"
		{
			if (std::toupper(input, usLoc) == L'S') // Correct
			{
				curStat = issing_second_i; // Expecting second 'I' in "ISSING"
				return boost::indeterminate;
			}

			else // Error
			{
				failedReaosn = Reply::badReq;
				return false;
			}

			break;
		}

		case issing_second_i: // Expecting second 'I' in "ISSING"
		{
			if (std::toupper(input, usLoc) == L'I') // Correct
			{
				curStat = issing_n; // Expecting 'N' in "ISSING"
				return boost::indeterminate;
			}

			else // Error
			{
				failedReaosn = Reply::badReq;
				return false;
			}

			break;
		}

		case issing_n: // Expecting 'N' in "ISSING"
		{
			if (std::toupper(input, usLoc) == L'N') // Correct
			{
				curStat = issing_g; // Expecting 'G' in "ISSING"
				return boost::indeterminate;
			}

			else // Error
			{
				failedReaosn = Reply::badReq;
				return false;
			}

			break;
		}

		case issing_g: // Expecting 'G' in "ISSING"
		{
			if (std::toupper(input, usLoc) == L'G') // Correct
			{
				curStat = space; // A space should follow this command
				return boost::indeterminate;
			}

			else // Error
			{
				failedReaosn = Reply::badReq;
				return false;
			}

			break;
		}

		case space: // Expecting a space char.
		{
			if (std::isspace(input, usLoc)) // Space character
			{
				switch (prevStat) // What did we parse before this?
				{
					case fof_f: // Parsing a "FOF" command
					{
						req.setCommand(Request::FOF);
						break;
					}

					case issing_g: // Parsing an "ISSING" command
					{
						req.setCommand(Request::ISSING);
						break;
					}

					curStat = parseMalNoun_beg; // We start parsing a Malayalam noun, in either case
				}
			}

			else // Error
			{
				failedReason = Reply::badReq;
				return false;
			}

			break;
		}
	} // switch
}

/**
* @desc Fetches the reason why the parser couldn't finish parsing a request. Needed by Reply::stockReply in Server.
* @return A reason code that indicates why the parser couldn't finish.
**/
Reply::ReasonCode ReqParser::getFailedReason() const
{
	return failedReason;
}

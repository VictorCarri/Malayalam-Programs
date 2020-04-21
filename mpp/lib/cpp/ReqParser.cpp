/* Standard C++ */
#include <locale> // std::isdigit, std::isspace, std::isalpha, std::toupper, std::tolower, std::isalnum
#include <algorithm> // std::find_if, std::for_each
#include <string> // std:wstring
#include <exception> // std::runtime_error
#include <sstream> // std::ostringstream
#include <memory> // std::make_unique

#ifdef DEBUG
#include <iostream> // std::cout, std::wcout
#include <ostream> // std::wostream
#endif

/* Boost */
#include <boost/logic/tribool.hpp> // boost::tribool, boost::indeterminate

/* Our headers */
#include "mpp/Reply.hpp" // Reply::FailureCode, to indicate why the parser failed
#include "mpp/Request.hpp" // Request class
#include "mpp/ver.hpp" // Protocol version info
#include "mpp/functors/Printer.hpp" // Functor that prints each item in a list. It is ASSUMED that the object passed to operator() implements operator<<
#include "mpp/functors/VerbChecker.hpp" // Functor that checks if a given character matches the first character of a given verb
#include "mpp/functors/PtrResetter.hpp" // Functor that resets pointers
#include "mpp/Header.hpp" // Represents a request header
#include "mpp/ReqParser.hpp" // Class def'n

/**
* Construct ready to parse the request method.
**/
mpp::ReqParser::ReqParser() : curStat(protocol_name_m), // Construct in start state
	version {mpp::VER_MAJOR, mpp::VER_MINOR, mpp::VER_PATCH},
	verbs {L"ISSING", L"FOF"},
	nrns(1),
	pNounSS(new std::stringstream),
	pSSHeaderName(new std::stringstream),
	pSSHeaderVal(new std::stringstream)
{
	/*version = {VER_MAJOR, VER_MINOR, VER_PATCH}; // Initialise version info
	verbs = {L"ISSING", L"FOF"}; // Initialise array of recognised verbs*/

	#ifdef DEBUG
	/* Set up map of states to state names */
	stateNames[protocol_name_m] = "protocol_name_m";
	stateNames[protocol_name_first_p] = "protocol_name_first_p";
	stateNames[protocol_name_second_p] = "protocol_name_second_p";
	stateNames[slash] = "slash";
	stateNames[major] = "major";
	stateNames[minor] = "minor";
	stateNames[patch] = "patch";
	stateNames[verb_start] = "verb_start";
	stateNames[fof_o] = "fof_o";
	stateNames[fof_f] = "fof_f";
	stateNames[issing_first_s] = "issing_first_s";
	stateNames[issing_second_s] = "issing_second_s";
	stateNames[issing_second_i] = "issing_second_i";
	stateNames[issing_n] = "issing_n";
	stateNames[issing_g] = "issing_g";
	stateNames[backslash_r_after_verb] = "backslash_r_after_verb";
	stateNames[backslash_n_after_verb] = "backslash_n_after_verb";

	std::cout << "ReqParser::ReqParser: starting state = " << stateNames[curStat] << std::endl
	<< "Version = " << version.at(0) << "." << version.at(1) << "." << version.at(2) << std::endl
	<< "Recognised verbs = ";
	/*std::for_each(verbs.cbegin(), verbs.cend()-1, [](std::wstring s)
		{
			std::wcout << s << L",";
		}
	);*/
	std::for_each(verbs.cbegin(), verbs.cend()-1, mpp::functors::Printer<std::wstring, std::wostream>(std::wcout));
	std::wcout << verbs.at(verbs.size()-1) << std::endl;
	#endif
	
	/* Set up locale cache */
	gen.locale_cache_enabled(true);
	gen("en_US.UTF-8"); // Add US English
	gen("ml_IN.UTF-8"); // Add Malayalam

	/* Create stringstream pointers */
	for (short i = 0; i < verSS.size(); i++)
	{
		verSS[i] = std::make_unique<std::wstringstream>(); // Create a pointer to a stringstream
	}
}

/**
* Reset to initial parser state.
**/
void mpp::ReqParser::reset()
{
	curStat = protocol_name_m; // Reset to init. state

	#ifdef DEBUG
	std::cout << "ReqParser::reset: reset to state " << stateNames[curStat] << std::endl;
	#endif

	std::for_each(verSS.begin(), verSS.end(), PtrResetter()); // Reset the unique_ptrs
	pSSHeaderName.reset(new std::stringstream); // Reset the header stringstream
	pSSHeaderVal.reset(new std::stringstream); // Reset the header stringstream
	pNounSS.reset(new std::stringstream);
}

/**
* @desc Handles the next character of input.
* @param req The request object to set parameters on.
* @param input The next character of input.
* @returns True if a valid request was parsed, false if invalid or unexpected input was received, boost::indeterminate if more info is required
**/
boost::tribool mpp::ReqParser::consume(Request& req, wchar_t input)
{
	/* Locales for parsing */
	std::locale usLoc = gen("en_US.UTF-8"); // US English, UTF-8
	std::locale mlLoc = gen("ml_IN.UTF-8"); // Malayalam
	boost::tribool toReturn;
	
	prevStat = curStat; // Store the previous state, so that the 'space' state knows which parameter-parsing state to go to next

	#ifdef DEBUG
	std::cout << "ReqParser::consume: state at start = " << stateNames[curStat] << std::endl;
	#endif

	switch (curStat)
	{
		case protocol_name_m: // Expecting 'M' of "MPP"
		{
			if (input != L'M') // Bad char. for current state
			{
				status = Reply::badReq;
				toReturn = false; // Malformed

				#ifdef DEBUG
				std::cout << "ReqParser::consume: protocol_name_m: bad char: toReturn = " << toReturn << std::endl;
				#endif
			}
			
			else // Current char is alpha. & is 'M'
			{
				curStat = protocol_name_first_p; // Go to next state - waiting for first 'P' in "MPP"
				toReturn = boost::indeterminate; // Indicate that the parser is waiting for input

				#ifdef DEBUG
				std::cout << "ReqParser::consume: protocol_name_m: 'M' found: toReturn = " << toReturn << std::endl;
				#endif
			}

			break;
		}

		case protocol_name_first_p: // Expecting first 'P' of "MPP"
		{
			if (input != L'P') // Bad char. for current state
			{
				status = Reply::badReq;
				toReturn = false; // Malformed

				#ifdef DEBUG
				std::cout << "ReqParser::consume: protocol_name_first_p: bad char found: toReturn = " << toReturn << std::endl;
				#endif
			}

			else // Current char is alpha. & is 'P'
			{
				curStat = protocol_name_second_p; // Go to next state - waiting for second 'P' in "MPP"
				toReturn = boost::indeterminate; // Indicate that the parser is waiting for input
			}

			break;
		}

		case protocol_name_second_p: // Expecting second 'P' of "MPP"
		{
			if (input != L'P') // Bad char for current state
			{
				status = Reply::badReq;
				toReturn = false;
			}

			else
			{
				curStat = slash; // Expecting a '/' char next
				toReturn = boost::indeterminate;
			}

			break;
		}

		case slash: // Expecting '/' in protocol name
		{
			if (input != L'/') // Bad char for current state
			{
				status = Reply::badReq;
				toReturn = false;
			}

			curStat = major; // Reading the major # in the version number
			toReturn = boost::indeterminate;

			break;
		}

		case major: // Reading a digit in the major version #
		{
			if (std::isdigit(input, usLoc)) // The current character is a digit
			{
				*verSS[0] << input; // Append it to the end of the current version #
				toReturn = boost::indeterminate; // Keep parsing
			}

			else if (input == L'.') // Finished reading major #
			{
				#ifdef DEBUG
				std::cout << "ReqParser::consume: read '.' in \"major\" state" << std::endl;
				#endif

				short readVerNum; // Holds the version # which we read, for comparison
				*verSS[0] >> readVerNum; // Convert string to num
	
				#ifdef DEBUG
				std::cout << "ReqParser::consume->case major: readVerNum = " << readVerNum << ", version[0] = " << version[0] << std::endl;
				#endif
	
				if (readVerNum != version[0]) // Error - incorrect major version
				{
					status = Reply::badMajor;
					toReturn = false; // Invalid req.
				}

				else // Read minor # next
				{
					curStat = minor; // Need to read minor #
					toReturn = boost::indeterminate; // Keep parsing
				}
			}

			else // Invalid char. for this state
			{
				status = Reply::badReq;
				toReturn = false;
			}

			break;
		}

		case minor: // Reading a digit in the minor version #
		{

			if (std::isdigit(input, usLoc)) // The current character is a digit
			{
				#ifdef DEBUG
				#endif

				*verSS[1] << input; // Append it to the end of the current version #
				toReturn = boost::indeterminate; // Keep parsing
			}

			else if (input == '.') // Finished reading minor #
			{
				short readVerNum; // Holds the version # which we read, for comparison
				*verSS[1] >> readVerNum; // Convert string to num

				#ifdef DEBUG
				std::cout << "ReqParser::consume: minor ver # = " << readVerNum << std::endl;
				#endif
	
				if (readVerNum != version[1]) // Error - incorrect minor version
				{
					status = Reply::badMinor;
					toReturn = false; // Invalid req.
				}

				else // Read minor # next
				{
					curStat = patch; // Read patch #
					toReturn = boost::indeterminate; // Keep parsing
				}
			}

			else // Invalid char. for this state
			{
				status = Reply::badReq;
				toReturn = false;
			}

			break;
		}

		case patch: // Reading a digit in the patch #
		{
			if (std::isdigit(input, usLoc)) // The current character is a digit
			{
				#ifdef DEBUG
				std::wcout << L"ReqParser::consume: character '" << input;
				std::cout << "' is a digit in the locale " << usLoc.name() << std::endl;
				#endif

				*verSS[2] << input; // Append it to the end of the current version #
				toReturn = boost::indeterminate; // Keep parsing
			}

			else if (std::isspace(input, usLoc)) // Finished reading all 3 version #s, need to check the patch version
			{
				#ifdef DEBUG
				std::wcout << L"ReqParser::consume: character '" << input << L"' is a space character in the locale ";
				std::cout << usLoc.name() << std::endl;
				#endif

				short readVerNum; // Holds the version # which we read, for comparison
				*verSS[2] >> readVerNum; // Convert string to num

				#ifdef DEBUG
				std::cout << "ReqParser::consume: patch # = " << readVerNum << std::endl;
				#endif
	
				if (readVerNum != version[2]) // Error - incorrect patch #
				{
					status = Reply::badPatch;
					toReturn = false; // Invalid req.
				}

				else
				{
					curStat = verb_start; // Read verb
					toReturn = boost::indeterminate; // Keep parsing
				}
			}

			else // Invalid char. for this state
			{
				#ifdef DEBUG
				std::wcout << "ReqParser::consume: character '" << input << "' is an invalid character." << std::endl;
				#endif

				status = Reply::badReq;
				toReturn = false; // Invalid request
			}

			break;
		}

		case verb_start: // Reading first char of request's verb
		{
			#ifdef DEBUG
			std::cout << "ReqParser::consume: at start of verb_start state handler." << std::endl;
			#endif

			if (std::isalpha(input, usLoc)) // Expecting an alphabetic char as the first char of the verb
			{
				#ifdef DEBUG
				std::wcout << "ReqParser::consume: input (" << input << ") is alphabetic in the locale ";
				std::cout << usLoc.name() << std::endl;
				#endif

				wchar_t upper = std::toupper(input, usLoc); // Convert first char. of verb to uppercase

				#ifdef DEBUG
				std::wcout << L"ReqParser::consume: uppercase input is '" << upper << "'" << std::endl;
				#endif

/*				std::array<std::wstring, 2>::const_iterator verbIt = std::find_if(verbs.cbegin(), verbs.cend(), [=](std::wstring verb)
					{
						#ifdef DEBUG
						std::wcout << L"ReqParser::consume: comparing first character of verb \"" << verb << L"\" to uppercase char '" << upper << L"'" << std::endl;
						#endif

						if (verb[0] == upper) // Found a match
						{
							#ifdef DEBUG std::wcout << L"ReqParser::consume: matched verb \"" << verb << "\"" << std::endl; #endif 
							return true;
						}
			
						else
						{
							#ifdef DEBUG
							std::wcout << L"ReqParser::consume: didn't match verb \"" << verb << "\"" << std::endl;
							#endif

							return false;
						}
					}
				);*/

				#ifdef DEBUG
				std::array<std::wstring, 2>::const_iterator verbIt = std::find_if(verbs.cbegin(), verbs.cend(), mpp::functors::VerbChecker(upper, "ReqParser::consume")); // Use a name to label debugging messages. This constructor of VerbChecker only exists in debug builds
				#else
				std::array<std::wstring, 2>::const_iterator verbIt = std::find_if(verbs.cbegin(), verbs.cend(), mpp::functors::VerbChecker(upper));
				#endif

				if (verbIt == verbs.cend()) // No matching verb found
				{
					#ifdef DEBUG
					std::cout << "ReqParser::consume: no matching verb found." << std::endl;
					#endif

					status = Reply::unknownVerb;
					toReturn = false;

					#ifdef DEBUG
					std::cout << "ReqParser::consume: no matching verb found: set toReturn to " << toReturn << std::endl;
					#endif
				}

				else // Check which verb matched
				{
					std::wstring verb = *verbIt;
		
					#ifdef DEBUG
					std::cout << "ReqParser::consume: matched verb is: ";
					std::wcout << verb << std::endl;
					#endif
					
					if (verb[0] == L'F') // Find the opposite form
					{
						#ifdef DEBUG
						std::cout << "ReqParser::consume: Found 'F' at start of matched verb, going to state " << stateNames[fof_o] << std::endl;
						#endif

						curStat = fof_o; // We expect to parse the 'O' of the "FOF" command
					}

					else if (verb[0] == L'I') // Determine whether or not a form is singular
					{
						#ifdef DEBUG
						std::cout << "ReqParser::consume: Found 'I' at start of matched verb, going to state " << stateNames[issing_first_s] << std::endl;
						#endif

						curStat = issing_first_s; // We expect to parse the first 's' of an "ISSING" command
					}

					toReturn = boost::indeterminate; // We need more info

					#ifdef DEBUG
					std::cout << "ReqParser::consume: at end of matched verb else: toReturn = " << toReturn << std::endl;
					#endif
				}
			}

			else // Unknown verb
			{
				#ifdef DEBUG
				std::cout << "ReqParser::consume: unknown verb given" << std::endl;
				#endif

				status = Reply::unknownVerb;
				toReturn = false;

				#ifdef DEBUG
				std::cout << "ReqParser::consume: at end of unknown verb else: toReturn = " << toReturn << std::endl;
				#endif
			}

			break;
		}

		case fof_o: // Expect to parse the remainder of the verb 'O'
		{
			if (std::toupper(input, usLoc) == L'O') // Correct
			{
				curStat = fof_f; // Expect final 'F' of 'FOF'
				toReturn = boost::indeterminate; // Continue parsing
			}
	
			else // Error
			{
				status = Reply::badReq; // Malformatted
				toReturn = false;
			}

			break;
		}

		case fof_f: // Expecting second 'f' of "FOF"
		{
			if (std::toupper(input, usLoc) == L'F') // Correct
			{
				req.SETCOM_FUNC(Request::FOF); // We have received a valid command, so we can set it
				curStat = backslash_r_after_verb;
				toReturn = boost::indeterminate;
			}

			else // Error
			{
				status = Reply::badReq;
				toReturn = false;
			}

			break;
		}

		case issing_first_s: // Expecting first 'S' of "ISSING"
		{
			#ifdef DEBUG
			std::cout << "In state ISSING_FIRST_S" << std::endl;
			#endif

			if (std::toupper(input, usLoc) == L'S') // Correct
			{
				#ifdef DEBUG
				std::wcout << L"ReqParser::consume: found first 'S' of \"ISSING\"" << std::endl;
				#endif

				curStat = issing_second_s; // Expecting second 'S' in "ISSING"
				toReturn = boost::indeterminate;
			}

			else // Error
			{
				#ifdef DEBUG
				std::wcout << L"ReqParser::consume: toupper of input ('" << std::toupper(input, usLoc) << "') != L'S'" << std::endl;
				#endif

				status = Reply::badReq;
				toReturn = false;
			}

			break;
		}

		case issing_second_s: // Expecting second 'S' in "ISSING"
		{
			if (std::toupper(input, usLoc) == L'S') // Correct
			{
				curStat = issing_second_i; // Expecting second 'I' in "ISSING"
				toReturn = boost::indeterminate;
			}

			else // Error
			{
				status = Reply::badReq;
				toReturn = false;
			}

			break;
		}

		case issing_second_i: // Expecting second 'I' in "ISSING"
		{
			if (std::toupper(input, usLoc) == L'I') // Correct
			{
				curStat = issing_n; // Expecting 'N' in "ISSING"
				toReturn = boost::indeterminate;
			}

			else // Error
			{
				status = Reply::badReq;
				toReturn = false;
			}

			break;
		}

		case issing_n: // Expecting 'N' in "ISSING"
		{
			if (std::toupper(input, usLoc) == L'N') // Correct
			{
				curStat = issing_g; // Expecting 'G' in "ISSING"
				toReturn = boost::indeterminate;
			}

			else // Error
			{
				status = Reply::badReq;
				toReturn = false;
			}

			break;
		}

		case issing_g: // Expecting 'G' in "ISSING"
		{
			if (std::toupper(input, usLoc) == L'G') // Correct
			{
				req.SETCOM_FUNC(Request::ISSING); // We have received a valid command, so we can set it
				curStat = backslash_r_after_verb; // Expecting a \r
				toReturn = boost::indeterminate;
			}

			else // Error
			{
				status = Reply::badReq;
				toReturn = false;
			}

			break;
		}

		case backslash_r_after_verb: // Expecting '\r' after verb
		{
			if (input == '\r') // Correct
			{
				curStat = backslash_n_after_verb;
				toReturn = boost::indeterminate;
			}

			else // Error
			{
				status = Reply::badReq;
				toReturn = false;
			}

			break;
		}

		case backslash_n_after_verb: // Expecting '\n' after the verb
		{
			if (input == '\n') // Correct
			{
				curStat = header_name; // Reading a header name
			}

			else // Error
			{
				status = Reply::badReq;
				toReturn = false;
			}

			break;
		}

		case header_name: // Reading the header's name
		{
			if (std::isalpha(input, usLoc) || input == L'-') // The header must contain only [a-zA-Z] and '-'
			{
				(*pSSHeaderName) << input; // Insert the input into the stream
			}

			else if (input == L':') // End of the header name
			{
				curStat = space_after_header_name; // Expect a single space
			}

			else if (input == L'\r') // Start of a second \r\n sequence after headers - headers are over
			{
				curStat = backslash_n_after_headers; // Expect a second \n as part of the \r\n\r\n sequence that separates headers from content
			}

			else // Invalid char.
			{
				status = Reply::badReq;
				toReturn = false;
			}

			break;
		}

		case space_after_header_name:
		{
			if (std::isspace(input, usLoc)) // Found a space
			{
				curStat = header_value; // Read the header's value next
			}

			else // Invalid char.
			{
				status = Reply::badReq;
				toReturn = false;
			}

			break;
		}

		case header_value:
		{
			if (input == L'\r') // End of header's value
			{
				/* We can create and add the header now */
				req.addHeader(pSSHeaderName->str(), pSSHeaderVal->str()); // Pass the Request object the name and value. It will create and add the Header object internally
				curStat = backslash_n_after_header_value; // Need to read a \n to terminate the header's value

				/* We need to know the length to read the noun, so check if this header is the content-length header */
				if (pSSHeaderName->str() == "Content-Length") // Yes, we need this header
				{
					(*pSSHeaderVal) >> mNBytes; // Read the # of bytes
				}
			}

			else // Part of header's value
			{
				(*pSSHeaderVal) << input; // Save it
			}

			break;
		}

		case backslash_n_after_header_value: // Expecting \n
		{
			if (input == L'\n') // Found it
			{
				curStat = header_name; // In case there are more headers
			}

			else // Error
			{
				status = Reply::badReq;
				toReturn = false;
			}

			break;
		}

		case backslash_n_after_headers: // Expecting final \n in "\r\n\r\n" sequence after final header value
		{
			if (input == L'\n') // Found it
			{
				curStat = noun; // Reading the bytes of the Malayalam noun
			}

			else // Error
			{
				status = Reply::badReq;
				toReturn = false;
			}
			break;
		}

		case noun: // Reading the Malayalam noun
		{
			if (mNBytes > 0) // Still reading
			{
				(*pNounSS) << input;
				--mNBytes; // Count this byte
			}

			break;
		}
	} // switch

	#ifdef DEBUG
	std::cout << "ReqParser::consume: state at end = " << stateNames[curStat] << std::endl
	<< "\ttoReturn = " << toReturn << std::endl;
	#endif

	return toReturn;
}

/**
* @desc Fetches the reason why the parser couldn't finish parsing a request. Needed by Reply::stockReply in Server.
* @return A reason code that indicates why the parser couldn't finish.
**/
mpp::Reply::Status mpp::ReqParser::getStatus() const
{
	return status;
}

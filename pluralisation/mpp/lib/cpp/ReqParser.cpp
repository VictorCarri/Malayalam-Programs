/* C++ versions of C headers */
#include <cstddef> // std::size_t

/* Standard C++ */
#include <locale> // std::isdigit, std::isspace, std::isalpha, std::toupper, std::tolower, std::isalnum
#include <algorithm> // std::find_if, std::for_each, std::all_of
#include <string> // std:wstring, std::string, std::stoll
#include <sstream> // std::ostringstream, std::stringstream
#include <memory> // std::make_unique
#include <utility> // std::pair
#include <stdexcept> // std::invalid_argument, std::out_of_range

#ifdef DEBUG
#include <iostream> // std::cout, std::cout
#include <ostream> // std::wostream
#include <bitset> // std::bitset
#endif

/* Boost */
#include <boost/logic/tribool.hpp> // boost::tribool, boost::indeterminate

/* My Unicode utilities library */
#include "vuu/UTF8Validator.hpp" // vuu::UTF8Validator, to ensure that a string contains valid UTF-8
#include "vuu/CodepointFinder.hpp" // vuu::CodepointFinder, to find the list of codepoints in the UTF-8 string

/* Our headers */
#include "mpp/Reply.hpp" // Reply::FailureCode, to indicate why the parser failed
#include "mpp/Request.hpp" // Request class
#include "mpp/ver.hpp" // Protocol version info
#include "mpp/Header.hpp" // Represents a request header
#include "mpp/functors/PtrResetter.hpp" // Resets pointers to stringstreams
#include "mpp/functors/Printer.hpp" // Class template that prints items
#include "mpp/ReqParser.hpp" // Class def'n

/**
* Construct ready to parse the request method.
**/
mpp::ReqParser::ReqParser() : curStat(protocol_name_m), // Construct in start state
	prevStat(invalid), // Unneeded on the first invocation of consume(), but initialised to satisfy g++
	status(mpp::Reply::invalid),
	version {mpp::VER_MAJOR, mpp::VER_MINOR, mpp::VER_PATCH},
	verSS {std::make_unique<std::stringstream>(), std::make_unique<std::stringstream>(), std::make_unique<std::stringstream>()},
	verbInfo {
		{"ISSING", issing_first_s},
		{"FOF", fof_o}
	},
	pSSHeaderName(new std::stringstream),
	pSSHeaderVal(new std::stringstream),
	mNBytes(0), // Initialise # of noun bytes read
	pNounSS(new std::stringstream)
{
	#ifdef DEBUG
	if (pSSHeaderName)
	{
		std::cout << "mpp::ReqParser::ReqParser: pSSHeaderName is valid." << std::endl;
	}

	else
	{
		std::cout << "mpp::ReqParser::ReqParser: pSSHeaderName is invalid!" << std::endl;
	}

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
	stateNames[header_name] = "header_name";
	stateNames[space_after_header_name] = "space_after_header_name";
	stateNames[header_value] = "header_value";
	stateNames[backslash_n_after_header_value] = "backslash_n_after_header_value";
	stateNames[backslash_n_after_headers] = "backslash_n_after_headers";
	stateNames[noun] = "noun";

	std::cout << "mpp::ReqParser::ReqParser: starting state = " << stateNames[curStat] << std::endl
	<< "Version = " << version.at(0) << "." << version.at(1) << "." << version.at(2) << std::endl
	<< "Recognised verbs = ";

	for (std::pair<std::string, State> pair : verbInfo)
	{
		std::cout << "\tState #" << static_cast<unsigned int>(pair.second) << "'s name is \"" << pair.first << "\"" << std::endl;
	}
	#endif
}

/**
* Reset to initial parser state.
**/
void mpp::ReqParser::reset()
{
	curStat = protocol_name_m; // Reset to init. state

	#ifdef DEBUG
	std::cout << "mpp::ReqParser::reset: reset to state " << stateNames[curStat] << std::endl;
	#endif

	for (auto& ptr : verSS)
	{
		ptr.reset();
	}

	pSSHeaderName.reset(new std::stringstream); // Reset the header stringstream

	#ifdef DEBUG
	if (pSSHeaderName)
	{
		std::cout << "mpp::ReqParser::reset: pSSHeaderName owns a new stringstream after reset." << std::endl;
	}
	
	else
	{
		std::cout << "mpp::ReqParser::reset: pSSHeaderName owns nothing after reset!" << std::endl;
	}
	#endif

	pSSHeaderVal.reset(new std::stringstream); // Reset the header stringstream
	pNounSS.reset(new std::stringstream); // Reset the noun's stringstream
	mNBytes = 0; // Reset expected # of bytes in noun
}

/**
* @desc Handles the next character of input.
* @param req The request object to set parameters on.
* @param input The next character of input.
* @returns True if a valid request was parsed, false if invalid or unexpected input was received, boost::indeterminate if more info is required
**/
boost::tribool mpp::ReqParser::consume(mpp::Request& req, char input)
{
	boost::tribool toReturn;

	#ifdef DEBUG
	std::bitset<8> charBits(static_cast<unsigned long long>(input));
	std::cout << "mpp::ReqParser::consume: char bits are " << charBits << std::endl;
	#endif
	
	prevStat = curStat; // Store the previous state, so that the 'space' state knows which parameter-parsing state to go to next

	#ifdef DEBUG
	std::cout << "mpp::ReqParser::consume: state at start = " << stateNames[curStat] << std::endl;
	#endif

	switch (curStat)
	{
		case protocol_name_m: // Expecting 'M' of "MPP"
		{
			if (input != 'M') // Bad char. for current state
			{
				status = Reply::badReq;
				toReturn = false; // Malformed

				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: protocol_name_m: bad char '" << input << "' found" << std::endl;
				#endif
			}
			
			else // Current char is alpha. & is 'M'
			{
				curStat = protocol_name_first_p; // Go to next state - waiting for first 'P' in "MPP"
				toReturn = boost::indeterminate; // Indicate that the parser is waiting for input

				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: protocol_name_m: 'M' found" << std::endl;
				#endif
			}

			break;
		}

		case protocol_name_first_p: // Expecting first 'P' of "MPP"
		{
			if (input != 'P') // Bad char. for current state
			{
				status = Reply::badReq;
				toReturn = false; // Malformed

				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: protocol_name_first_p: incorrect char '" << input << "' found" << std::endl;
				#endif
			}

			else // Current char is alpha. & is 'P'
			{
				#ifdef DEBUG
				std::cout << "mpp::ReqParser::counsume: protocol_name_first_p: found '" << input << "', as expected" << std::endl;
				#endif

				curStat = protocol_name_second_p; // Go to next state - waiting for second 'P' in "MPP"
				toReturn = boost::indeterminate; // Indicate that the parser is waiting for input
			}

			break;
		}

		case protocol_name_second_p: // Expecting second 'P' of "MPP"
		{
			if (input != 'P') // Bad char for current state
			{
				status = Reply::badReq;
				toReturn = false;

				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: protocol_name_second_p: unexpected char '" << input << "' found" << std::endl;
				#endif
			}

			else
			{
				curStat = slash; // Expecting a '/' char next
				toReturn = boost::indeterminate;

				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: protocol_name_second_p: found '" << input << "' as expected" << std::endl;
				#endif
			}

			break;
		}

		case slash: // Expecting '/' in protocol name
		{
			if (input != '/') // Bad char for current state
			{
				status = Reply::badReq;
				toReturn = false;

				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: slash: unexpected char '" << input << std::endl;
				#endif
			}

			else
			{
				curStat = major; // Reading the major # in the version number
				toReturn = boost::indeterminate;
				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: slash: found '" << input << "' as expected" << std::endl;
				#endif
			}

			break;
		}

		case major: // Reading a digit in the major version #
		{
			if (std::isdigit(input)) // The current character is a digit
			{
				*verSS[0] << input; // Append it to the end of the current version #
				toReturn = boost::indeterminate; // Keep parsing
				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: major: read digit '" << input << "'" << std::endl
				<< "\tverSS[0]->str() = \"" << verSS[0]->str() << "\"" << std::endl;
				#endif
			}

			else if (input == '.') // Finished reading major #
			{
				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: read '" << input << "' in \"major\" state" << std::endl;
				#endif

				short readVerNum; // Holds the version # which we read, for comparison
				*verSS[0] >> readVerNum; // Convert string to num
	
				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: major: readVerNum = " << readVerNum << ", version[0] = " << version[0] << std::endl;
				#endif
	
				if (readVerNum != version[0]) // Error - incorrect major version
				{
					status = Reply::badMajor;
					toReturn = false; // Invalid req.

					#ifdef DEBUG
					std::cout << "mpp::ReqParser::consume: major: bad major #" << std::endl;
					#endif
				}

				else // Read minor # next
				{
					curStat = minor; // Need to read minor #
					toReturn = boost::indeterminate; // Keep parsing

					#ifdef DEBUG
					std::cout << "mpp::ReqParser::consume: major: correct major #" << std::endl;
					#endif
				}
			}

			else // Invalid char. for this state
			{
				status = Reply::badReq;
				toReturn = false;

				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: major: invalid char '" << input << "' found" << std::endl;
				#endif
			}

			break;
		}

		case minor: // Reading a digit in the minor version #
		{
			if (std::isdigit(input)) // The current character is a digit
			{
				*verSS[1] << input; // Append it to the end of the current version #
				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: minor: read digit '" << input << "'" << std::endl
				<< "\tverSS[1]->str() = \"" << verSS[1]->str() << "\"" << std::endl;
				#endif
				toReturn = boost::indeterminate; // Keep parsing
			}

			else if (input == '.') // Finished reading minor #
			{
				short readVerNum; // Holds the version # which we read, for comparison
				*verSS[1] >> readVerNum; // Convert string to num

				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: minor: read minor ver # = " << readVerNum << ", expecting " << version[1] << std::endl;
				#endif
	
				if (readVerNum != version[1]) // Error - incorrect minor version
				{
					status = Reply::badMinor;
					toReturn = false; // Invalid req.

					#ifdef DEBUG
					std::cout << "mpp::ReqParser::consume: minor: incorrect minor version #" << std::endl;
					#endif
				}

				else // Read minor # next
				{
					curStat = patch; // Read patch #
					toReturn = boost::indeterminate; // Keep parsing

					#ifdef DEBUG
					std::cout << "mpp::ReqParser::consume: minor: found correct minor version #" << std::endl;
					#endif
				}
			}

			else // Invalid char. for this state
			{
				status = Reply::badReq;
				toReturn = false;

				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: major: invalid char '" << input << "' found" << std::endl;
				#endif
			}

			break;
		}

		case patch: // Reading a digit in the patch #
		{
			if (std::isdigit(input)) // The current character is a digit
			{
				*verSS[2] << input; // Append it to the end of the current version #
				toReturn = boost::indeterminate; // Keep parsing

				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: patch: character '" << input << "' is a digit" << std::endl
				<< "\tverSS[2]->str() = \"" << verSS[2]->str() << "\"" << std::endl;
				#endif
			}

			else if (std::isspace(input)) // Finished reading all 3 version #s, need to check the patch version
			{
				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: patch: character '" << input << "' is a space character" << std::endl;
				#endif

				short readVerNum; // Holds the version # which we read, for comparison
				*verSS[2] >> readVerNum; // Convert string to num

				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: patch: read patch # = " << readVerNum << ", expecting " << version[2] << std::endl;
				#endif
	
				if (readVerNum != version[2]) // Error - incorrect patch #
				{
					status = Reply::badPatch;
					toReturn = false; // Invalid req.

					#ifdef DEBUG
					std::cout << "mpp::ReqParser::consume: patch: incorrect patch #" << std::endl;
					#endif
				}

				else
				{
					curStat = verb_start; // Read verb
					toReturn = boost::indeterminate; // Keep parsing

					#ifdef DEBUG
					std::cout << "mpp::ReqParser::consume: patch: correct patch # found" << std::endl;
					#endif
				}
			}

			else // Invalid char. for this state
			{
				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: patch: character '" << input << "' is an invalid character." << std::endl;
				#endif

				status = Reply::badReq;
				toReturn = false; // Invalid request
			}

			break;
		}

		case verb_start: // Reading first char of request's verb
		{
			#ifdef DEBUG
			std::cout << "mpp::ReqParser::consume: at start of verb_start state handler." << std::endl;
			#endif

			if (std::isalpha(input)) // Expecting an alphabetic char as the first char of the verb
			{
				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: verb_start: input (" << input << ") is alphabetic" << std::endl;
				#endif

				char upper = std::toupper(input); // Convert first char. of verb to uppercase

				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: verb_start: uppercase input is '" << upper << "'" << std::endl;
				#endif

				auto verbIt = std::find_if(verbInfo.cbegin(), verbInfo.cend(), [=](std::pair<std::string, State> verbDat) -> bool
					{
						std::string verb = verbDat.first;

						#ifdef DEBUG
						std::cout << "mpp::ReqParser::consume: comparing first character of verb \"" << verb << "\" to uppercase char '" << upper << "'" << std::endl;
						#endif

						if (verb[0] == upper) // Found a match
						{
							#ifdef DEBUG
							std::cout << "mpp::ReqParser::consume: matched verb \"" << verb << "\"" << std::endl;
							#endif 
							return true;
						}
			
						else
						{
							#ifdef DEBUG
							std::cout << "mpp::ReqParser::consume: didn't match verb \"" << verb << "\"" << std::endl;
							#endif

							return false;
						}
					}
				);

				if (verbIt == verbInfo.cend()) // No matching verb found
				{
					#ifdef DEBUG
					std::cout << "mpp::ReqParser::consume: verb_start: no matching verb found." << std::endl;
					#endif

					status = Reply::unknownVerb;
					toReturn = false;

					#ifdef DEBUG
					std::cout << "mpp::ReqParser::consume: verb_start: no matching verb found: set toReturn to " << toReturn << std::endl;
					#endif
				}

				else // Check which verb matched
				{
					std::string verb = verbIt->first;
		
					#ifdef DEBUG
					std::cout << "mpp::ReqParser::consume: verb_start: matched verb is: " << verb << std::endl
					<< "mpp::ReqParser::consume: verb_start: found '" << verb[0] << "' at beginning of matched verb, going to state ";
					#endif
					
					curStat = verbInfo[verb]; // Go to whichever state is associated with parsing the verb's second character

					#ifdef DEBUG
					std::cout << stateNames[curStat] << std::endl;
					#endif

					toReturn = boost::indeterminate; // We need more info
				}
			}

			else // Unknown verb
			{
				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: unknown verb given" << std::endl;
				#endif

				status = Reply::unknownVerb;
				toReturn = false;
			}

			break;
		}

		case fof_o: // Expect to parse the remainder of the verb 'O'
		{
			if (std::toupper(input) == 'O') // Correct
			{
				curStat = fof_f; // Expect final 'F' of 'FOF'
				toReturn = boost::indeterminate; // Continue parsing

				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: fof_o: found '" << std::endl <<
				input << "', as expected." << std::endl;
				#endif
			}
	
			else // Error
			{
				status = Reply::badReq; // Malformatted
				toReturn = false;

				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: fof_o: unexpected character '" << input << "'" << std::endl;
				#endif
			}

			break;
		}

		case fof_f: // Expecting second 'f' of "FOF"
		{
			if (std::toupper(input) == 'F') // Correct
			{
				req.SETCOM_FUNC(Request::FOF); // We have received a valid command, so we can set it
				curStat = backslash_r_after_verb;
				toReturn = boost::indeterminate;

				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: fof_f: found final '" << input << "' in \"FOF\" and set request command accordingly." << std::endl;
				#endif
			}

			else // Error
			{
				status = Reply::badReq;
				toReturn = false;

				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: fof_f: unexpected char '" << input << "'" << std::endl;
				#endif
			}

			break;
		}

		case issing_first_s: // Expecting first 'S' of "ISSING"
		{
			if (std::toupper(input) == 'S') // Correct
			{
				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: issing_first_s: found first '" << input << "' of \"ISSING\"" << std::endl;
				#endif

				curStat = issing_second_s; // Expecting second 'S' in "ISSING"
				toReturn = boost::indeterminate;
			}

			else // Error
			{
				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: toupper of input ('" << input << "') [" << std::toupper(input) << "] != " << 'S' << std::endl;
				#endif

				status = Reply::badReq;
				toReturn = false;
			}

			break;
		}

		case issing_second_s: // Expecting second 'S' in "ISSING"
		{
			if (std::toupper(input) == 'S') // Correct
			{
				curStat = issing_second_i; // Expecting second 'I' in "ISSING"
				toReturn = boost::indeterminate;

				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: issing_second_s: input = '" << input << "', toupper(input) = '" << std::toupper(input) << "', as expected." << std::endl;
				#endif
			}

			else // Error
			{
				status = Reply::badReq;
				toReturn = false;

				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: issing_second_s: incorrect input '" << input << "' (toupper = '" << std::toupper(input) << "'" << std::endl;
				#endif
			}

			break;
		}

		case issing_second_i: // Expecting second 'I' in "ISSING"
		{
			if (std::toupper(input) == 'I') // Correct
			{
				curStat = issing_n; // Expecting 'N' in "ISSING"
				toReturn = boost::indeterminate;
				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: issing_second_i: input = '" << input << "', toupper(input) = '" << std::toupper(input) << "', as expected." << std::endl;
				#endif
			}

			else // Error
			{
				status = Reply::badReq;
				toReturn = false;
				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: issing_second_i: incorrect input '" << input << "' (toupper = '" << std::toupper(input) << "'" << std::endl;
				#endif
			}

			break;
		}

		case issing_n: // Expecting 'N' in "ISSING"
		{
			if (std::toupper(input) == 'N') // Correct
			{
				curStat = issing_g; // Expecting 'G' in "ISSING"
				toReturn = boost::indeterminate;
				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: issing_n: input = '" << input << "', toupper(input) = '" << std::toupper(input) << "', as expected." << std::endl;
				#endif
			}

			else // Error
			{
				status = Reply::badReq;
				toReturn = false;
				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: issing_n: incorrect input '" << input << "' (toupper = '" << std::toupper(input) << "'" << std::endl;
				#endif
			}

			break;
		}

		case issing_g: // Expecting 'G' in "ISSING"
		{
			if (std::toupper(input) == 'G') // Correct
			{
				req.SETCOM_FUNC(Request::ISSING); // We have received a valid command, so we can set it
				curStat = backslash_r_after_verb; // Expecting a gr
				toReturn = boost::indeterminate;

				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: issing_g: found '" << input << "', as expected." << std::endl
				<< "\treq.command = " << static_cast<unsigned short>(req.GETCOM_FUNC()) << std::endl;
				#endif
			}

			else // Error
			{
				status = Reply::badReq;
				toReturn = false;

				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: issing_g: unexpected char '" << input << "' found." << std::endl;
				#endif
			}

			break;
		}

		case backslash_r_after_verb: // Expecting '\r' after verb
		{
			if (input == '\r') // Correct
			{
				curStat = backslash_n_after_verb;
				toReturn = boost::indeterminate;

				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: backslash_r_after_verb: found '" << input << "', as expected." << std::endl;
				#endif
			}

			else // Error
			{
				status = Reply::badReq;
				toReturn = false;

				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: backslash_r_after_verb: incorrect input '" << input << "' found" << std::endl;
				#endif
			}

			break;
		}

		case backslash_n_after_verb: // Expecting '\n' after the verb
		{
			if (input == '\n') // Correct
			{
				curStat = header_name; // Reading a header name
				toReturn = boost::indeterminate;

				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: backslash_n_after_verb: found '" << input << "', as expected." << std::endl;
				#endif
			}

			else // Error
			{
				status = Reply::badReq;
				toReturn = false;

				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: backslash_n_after_verb: incorrect character '" << input << "' found." << std::endl;
				#endif
			}

			break;
		}

		case header_name: // Reading the header's name
		{
			if (std::isalpha(input) || input == '-') // The header must contain only [a-zA-Z] and '-'
			{
				#ifdef DEBUG
				if (pSSHeaderName) // Check to make sure that the stringstream exists
				{
					std::cout << "mpp::ReqParser::consume: The pointer to the string stream for the header's name is: " << pSSHeaderName.get() << std::endl;
				}

				else
				{
					std::cout << "mpp::ReqParser::consume: pSSHeaderName doesn't own an object!" << std::endl;
				}
				#endif

				(*pSSHeaderName) << input; // Insert the input into the stream
				toReturn = boost::indeterminate;

				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: header_name: inserted character that is alpha or '-' (" << input << ") into header name stringstream." << std::endl
				<< "\theader name = \"" << pSSHeaderName->str() << "\"" << std::endl;
				#endif
			}

			else if (input == ':') // End of the header name
			{
				curStat = space_after_header_name; // Expect a single space
				toReturn = boost::indeterminate;

				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: header_name: read '" << input << "', ending header name..." << std::endl;
				#endif
			}

			else if (input == '\r') // Start of a second \r\n sequence after headers - headers are over
			{
				curStat = backslash_n_after_headers; // Expect a second \n as part of the \r\n\r\n sequence that separates headers from content
				toReturn = boost::indeterminate;

				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: header_name: read '\\r', signifying second '\\r' of '\\r\\n\\r\\n' sequence." << std::endl;
				#endif
			}

			else // Invalid char.
			{
				status = Reply::badReq;
				toReturn = false;

				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: header_name: invalid char '" << input << "' received." << std::endl;
				#endif
			}

			break;
		}

		case space_after_header_name:
		{
			if (std::isspace(input)) // Found a space
			{
				curStat = header_value; // Read the header's value next
				toReturn = boost::indeterminate;

				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: space_after_header_name: found space char '" << input << "'" << std::endl;
				#endif
			}

			else // Invalid char.
			{
				status = Reply::badReq;
				toReturn = false;

				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: space_after_header_name: invalid char '" << input << "' received" << std::endl;
				#endif
			}

			break;
		}

		case header_value:
		{
			if (input == '\r') // End of header's value
			{
				/* We can create and add the header now */
				curStat = backslash_n_after_header_value; // Need to read a \n to terminate the header's value
				toReturn = boost::indeterminate;

				/* We need to know the length to read the noun, so check if this header is the content-length header */
				if (pSSHeaderName->str() == "Content-Length") // Yes, we need this header
				{
					if (isValidDecimalInt(pSSHeaderVal->str())) // Ensure that the value we have read so far is a valid int
					{
						(*pSSHeaderVal) >> mNBytes; // Read the # of bytes in the noun
						req.addHeader(pSSHeaderName->str(), mNBytes); // Pass the Request object the name and value. It will create and add the Header object internally.
						#ifdef DEBUG
						std::cout << "mpp::ReqParser::consume: header_value: noun has length " << mNBytes << " (in bytes)" << std::endl;
						#endif
					}

					else // Error in Content-Length header -> malformed request
					{
						status = Reply::badReq;
						toReturn = false;
					}
				}

				else // Treat it as a regular header
				{
					req.addHeader(pSSHeaderName->str(), pSSHeaderVal->str());

					#ifdef DEBUG
					std::cout << "mpp::ReqParser::consume: header_value: read header \"" << pSSHeaderName->str() << "\", with value \"" << pSSHeaderVal->str() << "\"" << std::endl;
					#endif
				}

				/* Reset stringstream pointers for the next header */
				pSSHeaderName.reset(new std::stringstream);
				std::cout << "mpp::ReqParser::consume: header_value: read '\r' and reset pSSHeaderName" << std::endl;
			
				#ifdef DEBUG
				if (pSSHeaderName)
				{
					std::cout << "mpp::ReqParser::consume: header_value: pSSHeaderName is valid after reset." << std::endl;
				}

				else
				{
					std::cout << "mpp::ReqParser::consume: header_value: pSSHeaderName is invalid after reset!" << std::endl;
				}
				#endif

				pSSHeaderVal.reset(new std::stringstream);

			}

			else // Part of header's value
			{
				(*pSSHeaderVal) << input; // Save it
				toReturn = boost::indeterminate;

				#ifdef DEBUG
				std::cout << "ReqParser::consume: header_value: read character '";
				std::cout << input;
				std::cout << "'" << std::endl;
				#endif
			}

			break;
		}

		case backslash_n_after_header_value: // Expecting \n
		{
			if (input == '\n') // Found it
			{
				curStat = header_name; // In case there are more headers
				toReturn = boost::indeterminate;

				#ifdef DEBUG
				std::cout << "ReqParser::consume: backslash_n_after_header_value: read newline after header" << std::endl;
				#endif
			}

			else // Error
			{
				status = Reply::badReq;
				toReturn = false;

				#ifdef DEBUG
				std::cout << "ReqParser::consume: backslash_n_afteR_header_value: unexpected character '";
				std::cout << input;
				std::cout << "' found" << std::endl;
				#endif
			}

			break;
		}

		case backslash_n_after_headers: // Expecting final \n in "\r\n\r\n" sequence after final header value
		{
			if (input == '\n') // Found it
			{
				curStat = noun; // Reading the bytes of the Malayalam noun
				toReturn = boost::indeterminate;
				
				#ifdef DEBUG
				std::cout << "ReqParser::consume: backslash_n_after_headers: found final '\\n'" << std::endl;
				#endif
			}

			else // Error
			{
				status = Reply::badReq;
				toReturn = false;

				#ifdef DEBUG
				std::cout << "ReqParser::consume: backslash_n_after_headers: unexpected character '";
				std::cout << input;
				std::cout << "'" << std::endl;
				#endif
			}
			break;
		}

		case noun: // Reading the Malayalam noun
		{
			if (mNBytes > 0) // Still reading
			{
				(*pNounSS) << input;
				--mNBytes; // Count this byte

				#ifdef DEBUG
				std::cout << "ReqParser::consume: noun: noun so far is \"";
				std::cout << pNounSS->str();
				std::cout << "\", " << mNBytes;

				if (mNBytes == 1)
				{
					std::cout <<  " byte remains.";
				}

				else
				{
					std::cout << " bytes remain.";
				}

				std::cout << std::endl;
				#endif

				if (mNBytes == 0) // Read the entire noun
				{
					/* Ensure that the noun contains valid UTF-8 */
					std::string noun = pNounSS->str(); // Fetch the contents of the stringstream as a string

					if (std::all_of(noun.cbegin(), noun.cend(), vuu::UTF8Validator())) // The noun is valid UTF-8
					{
						vuu::CodepointFinder vcf = std::for_each(noun.cbegin(), noun.cend(), vuu::CodepointFinder()); // Use the functor to get a list of codepoints in the string (i.e., find the 32-bit codepoints derived from the UTF-8 string)
						
						if (std::all_of(vcf.cbegin(), vcf.cend(), [](unsigned long long codePoint) -> bool
							{
								return codePoint >= 0xd00 && codePoint <= 0xd7f;
							})
						) // Ensure that all of the codepoints are in the Malayalam range
						{
							req.setNoun(pNounSS->str()); // Store the noun (as UTF-8 bytes) in the request
							toReturn = true; // We have successfully parsed an entire request
	
							#ifdef DEBUG
							std::cout << "ReqParser::consume: successfully parsed noun \"" << req.getNoun() << "\"" << std::endl;
							#endif
						}

						else // At least one of the codepoints isn't a Malayalam codepoint
						{
							toReturn = false;
							status = Reply::badReq;
						}
					}

					else // The noun contains invalid UTF-8
					{
						toReturn = false;
						status = Reply::invUTF8;
					}
				}

				else // Some bytes still remain
				{
					toReturn = boost::indeterminate; // Keep parsing
				}
			}

			else if (mNBytes < 0) // More data than specified
			{
				status = Reply::badReq;
				toReturn = false;

				#ifdef DEBUG
				std::cout << "ReqParser::consume: noun: too much data!" << std::endl;
				#endif
			}

			else // No data to read
			{
				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: no data to read." << std::endl;
				#endif
			}

			break;
		}

		case invalid: // We should never be in this state
		{
			break;
		}
	} // switch

	#ifdef DEBUG
	std::cout << "mpp::ReqParser::consume: state at end = " << stateNames[curStat] << std::endl
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

/**
* @desc Determines whether or not the given string represents a valid decimal integer.
* @param toCheck The string to check.
* @return True if the string represents a valid decimal integer, false otherwise.
**/
bool mpp::ReqParser::isValidDecimalInt(std::string toCheck)
{
	std::size_t fuci; // The index of the first character after the point in the string where conversion stopped

	try
	{
		std::stoll(toCheck, &fuci); // Use base 10 (default)

		/*
		* If we got here, the conversion was successful. But the conversion may not have consumed the entire string. We can check this by ensuring that fuci == toCheck.length().
		*/

		return (fuci == toCheck.length()); // The entire string should have been converted
	}

	catch (std::invalid_argument& stdia) // std::stoll couldn't convert the string to a number
	{
		return false; // Invalid decimal #
	}

	catch (std::out_of_range& stdoor) // The converted value is outside the range of a long long or std::strtoll set errno to ERANGE
	{
		return false;
	}
}

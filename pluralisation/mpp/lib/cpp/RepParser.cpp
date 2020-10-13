/* C++ versions of C headers */
#include <cctype> // std::isdigit, std::isspace

/* STL */
#include <sstream> // std::stringstream
#ifdef DEBUG
#include <bitset> // std::bitset
#include <iostream> // std::cout, std::endl
#endif

/* Boost */
#include <boost/logic/tribool.hpp> // boost::logic::tribool, boost::indeterminate
#ifdef DEBUG
#include <boost/logic/tribool_io.hpp> // operator<< for boost::logic::tribool
#endif

/* MPP */
#include "mpp/ver.hpp" // MPP protocol version info
#include "mpp/RepParser.hpp" // Class def'n

/**
* @desc Default constructor. Constructs the parser in a state such that it is ready to parse the beginning of a reply.
**/
mpp::RepParser::RepParser() : curStat(initial_m), // Start off by expecting the 'M' in "MPP"
	version {mpp::VER_MAJOR, mpp::VER_MINOR, mpp::VER_PATCH}
	#ifdef DEBUG
	,stateNames {
		{initial_m, "initial_m"},
		{first_p, "first_p"},
		{second_p, "second_p"},
		{slash, "slash"},
		{major, "major"},
		{minor, "minor"},
		{patch, "patch"},
		{first_code_digit, "first_code_digit"},
		{second_code_digit, "second_code_digit"},
		{third_code_digit, "third_code_digit"},
		{header_name, "header_name"},
		{header_val, "header_val"},
		{space_after_header_name, "space_after_header_name"}
	}
	#endif
{
	#ifdef DEBUG
	std::cout << "mpp::RepParser::RepParser: starting state = " << stateNames[curStat] << std::endl
	<< "\tVersion = " << version.at(0) << "." << version.at(1) << "." << version.at(2) << std::endl;
	#endif
}

/**
* @desc Resets the parser to its initial state.
**/
void mpp::RepParser::reset()
{
	curStat = initial_m; // Reset to expecting 'M' in protocol header again
}

/**
* @desc Handles the current character in the input stream.
* @param rep The Reply object whose parameters we'll set while parsing.
* @param input The next character of input.
**/
boost::tribool mpp::RepParser::consume(mpp::Reply& rep, char input)
{
	#ifdef DEBUG
	std::cout << "mpp::RepParser::consume: current char is '" << input << "'" << std::endl;
	#endif

	boost::tribool toReturn;

	#ifdef DEBUG
	std::bitset<8> charBits(static_cast<unsigned long long>(input)); // For debugging
	std::cout << "mpp::RepParser::consume: char bits are " << charBits << std::endl
	<< "\tStart state = " << stateNames[curStat] << std::endl;
	#endif

	switch (curStat)
	{
		/* Parsing the first line of a reply */
		case initial_m: // Expecting 'M' in "MPP"
		{
			if (input == 'M') // Correct
			{
				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: initial_m: read '" << input << "', as expected" << std::endl
				<< "\tGoing to state ";
				#endif
				curStat = first_p; // We expect the first 'P' in "MPP" to follow
				#ifdef DEBUG
				std::cout << stateNames[curStat] << std::endl;
				#endif
				toReturn = boost::indeterminate; // Need more data
			}

			else // Bad character
			{
				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: bad char '" << input << "' for current state " << stateNames[curStat] << std::endl;
				#endif
				toReturn = false; // Stop parsing
			}

			break;
		}

		case first_p: // Expecting first 'P' in "MPP"
		{
			if (input == 'P') // Correct
			{
				#ifdef DEBUG
				std::cout << "mpp::RepParser::consume: first_p: read '" << input << "', as expected." << std::endl
				<< "\tGoing to state ";
				#endif
				curStat = second_p;
				#ifdef DEBUG
				std::cout << stateNames[curStat] << std::endl;
				#endif
				toReturn = boost::indeterminate; // Need more data
			}

			else // Invalid input
			{
				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: bad char '" << input << "' for current state " << stateNames[curStat] << std::endl;
				#endif
				toReturn = false; // Stop parsing
			}

			break;
		}

		case second_p: // Expecting second 'P' in "MPP"
		{
			if (input == 'P') // Correct
			{
				#ifdef DEBUG
				std::cout << "mpp::RepParser::consume: second_p: read '" << input << "', as expected." << std::endl
				<< "\tGoing to state ";
				#endif
				curStat = slash;
				#ifdef DEBUG
				std::cout << stateNames[curStat] << std::endl;
				#endif
				toReturn = boost::indeterminate; // Need more data
			}

			else // Invalid input
			{
				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: bad char '" << input << "' for current state " << stateNames[curStat] << std::endl;
				#endif
				toReturn = false; // Stop parsing
			}

			break;
		}

		case slash: // Expecting the '/' that separates "MPP" from the protocol version
		{
			if (input == '/') // Correct
			{
				#ifdef DEBUG
				std::cout << "mpp::RepParser::consume: slash: read '" << input << "', as expected." << std::endl
				<< "\tGoing to state ";
				#endif

				curStat = major;
				pMajSS.reset(new std::stringstream); // Needed by the state that reads the major version #

				#ifdef DEBUG
				std::cout << stateNames[curStat] << std::endl;
				#endif
				toReturn = boost::indeterminate; // Need more data
			}

			else // Invalid input
			{
				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: bad char '" << input << "' for current state " << stateNames[curStat] << std::endl;
				#endif
				toReturn = false; // Stop parsing
			}

			break;
		}

		case major: // Expecting either a digit in the major version number or a dot to terminate it
		{
			if (std::isdigit(static_cast<unsigned char>(input))) // The current character is a digit
			{
				(*pMajSS) << input; // Insert it into the stream
				#ifdef DEBUG
				std::cout << "mpp::RepParser:: major: isdigit if: contents of major # ss after insert are \"" << pMajSS->str() << "\"" << std::endl;
				#endif
				toReturn = boost::indeterminate; // Keep parsing
			}

			else if (input == '.') // Terminator character
			{
				/* Check the major version */
				short majVer;
				(*pMajSS) >> majVer; // Read it as an int
				#ifdef DEBUG
				std::cout << "mpp::RepParser::major: terminator if: read major version #" << majVer << std::endl
				<< "\tCompiled major version # = " << version.at(0) << std::endl;
				#endif

				if (majVer != version.at(0)) // Not compatible with this version of the parser
				{
					curRepStat = Reply::badMajor;
					toReturn = false;

					#ifdef DEBUG
					std::cout << "mpp::RepParser::consume: major: expected major version #" << version.at(0) << ", but read " << majVer << std::endl;
					#endif
				}

				else // Correct version #
				{
					pMinSS.reset(new std::stringstream);
					curStat = minor; // Read the minor version # next
					toReturn = boost::indeterminate; // Keep parsing
					#ifdef DEBUG
					std::cout << "mpp::RepParser::consume: major: read correct version #" << majVer << ", going to state " << stateNames[curStat] << std::endl;
					#endif
				}
			}

			else // Invalid input
			{
				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: bad char '" << input << "' for current state " << stateNames[curStat] << std::endl;
				#endif
				toReturn = false; // Stop parsing
			}

			break;
		}

		case minor: // Expects digits in the minor version # or a '.' to terminate
		{
			if (std::isdigit(static_cast<unsigned char>(input))) // This is a digit
			{
				(*pMinSS) << input; // Store it
				#ifdef DEBUG
				std::cout << "mpp::RepParser::consume: minor: minor stringstream contains \"" << pMinSS->str() << "\" after insertion" << std::endl;
				#endif
				toReturn = boost::indeterminate; // Keep parsing
			}

			else if (input == '.') // Terminator character
			{
				short minVer;
				(*pMinSS) >> minVer;
				
				if (minVer != version.at(1)) // Bad minor version
				{
					toReturn = false; // We can't handle this
					#ifdef DEBUG
					std::cout << "mpp::RepParser::consume: minor: expected minor version #" << version.at(1) << ", but read " << minVer << std::endl;
					#endif
				}

				else // Correct minor version
				{
					pPatchSS.reset(new std::stringstream);
					curStat = patch;
					toReturn = boost::indeterminate; // Keep parsing
					#ifdef DEBUG
					std::cout << "mpp::RepParser::parse: read correct minor version # " << minVer << ", going to state " << stateNames[curStat] << std::endl;
					#endif
				}
			}

			else // Invalid input
			{
				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: bad char '" << input << "' for current state " << stateNames[curStat] << std::endl;
				#endif
				toReturn = false; // Stop parsing
			}

			break;
		}

		case patch: // Expect either a digit in the patch # or a space character to terminate it
		{
			if (std::isdigit(static_cast<unsigned char>(input))) // Digit in patch #
			{
				#ifdef DEBUG
				std::cout << "mpp::RepParser::consume: patch: read digit " << input << std::endl;
				#endif
				(*pPatchSS) << input;
				#ifdef DEBUG
				std::cout << "mpp::RepParser::consume: patch: patch ss contains \"" << pPatchSS->str() << "\" after insertion." << std::endl;
				#endif
				toReturn = boost::indeterminate;
			}

			else if (std::isspace(static_cast<unsigned char>(input))) // Space character, finished reading
			{
				#ifdef DEBUG
				std::cout << "mpp::RepParser::consume: patch: read space char '" << input << "'" << std::endl;
				#endif
				short patch;
				(*pPatchSS) >> patch;
				#ifdef DEBUG
				std::cout << "mpp::RepParser::consume: read patch # " << patch << std::endl;
				#endif

				if (patch != version.at(2)) // Bad version #
				{
					toReturn = false;
					#ifdef DEBUG
					std::cout << "mpp::RepParser::parse: patch: expected patch #" << version.at(2) << ", but read " << patch << std::endl;
					#endif
				}

				else
				{
					pCodeSS.reset(new std::stringstream); // Create a stringstream for the code reader to use
					curStat = first_code_digit; // We consumed the space after the patch, so expect the first digit of the code next
					toReturn = boost::indeterminate; // Keep parsing
					#ifdef DEBUG
					std::cout << "mpp::RepParser::consume: patch: read correct version #" << patch << ", going to state " << stateNames[curStat] << std::endl;
					#endif
				}
			}

			else // Invalid input
			{
				#ifdef DEBUG
				std::cout << "mpp::ReqParser::consume: bad char '" << input << "' for current state " << stateNames[curStat] << std::endl;
				#endif
				toReturn = false; // Stop parsing
			}

			break;
		}

		case first_code_digit: // Expecting the first digit of the numeric code
		{
			if (std::isdigit(static_cast<unsigned char>(input))) // Found a digit
			{
				(*pCodeSS) << input;
				curStat = second_code_digit;
				toReturn = boost::indeterminate; // Keep parsing
			}

			else // Not a digit, invalid
			{
				#ifdef DEBUG
				std::cout << "mpp::RepParser::consume: read '" << input << "' instead of a digit while attempting to read the code's first digit." << std::endl;
				#endif
				toReturn = false; // Stop parsing
			}

			break;
		}

		case second_code_digit: // Expecting second dig. of numeric code
		{
			if (std::isdigit(static_cast<unsigned char>(input))) // Found a digit
			{
				(*pCodeSS) << input;
				curStat = third_code_digit;
				toReturn = boost::indeterminate; // Keep parsing
			}

			else // Not a digit, invalid
			{
				#ifdef DEBUG
				std::cout << "mpp::RepParser::consume: read '" << input << "' instead of a digit while attempting to read the code's second digit." << std::endl;
				#endif
				toReturn = false; // Stop parsing
			}

			break;
		}

		case third_code_digit: // Expecting third digit in code #
		{
			if (std::isdigit(static_cast<unsigned char>(input))) // Found a digit
			{
				(*pCodeSS) << input;
				short code; // Holds the numeric code that we parse. The stringstream is guaranteed to hold a valid positive integer in the range 000-999, because of the constraints enforced on each digit
				(*pCodeSS) >> code; // Read the code value
				#ifdef DEBUG
				std::cout << "mpp::RepParser::consume: read code value " << code << std::endl;
				#endif

				/* Ensure that the code is in the valid range */
				if ( (code >= 200 && code <= 205) // OK response
					|| (code >= 400 && code <= 405) // Client error
				) // Code is in valid range
				{
					rep.setStatus(code); // The method handles the conversion to the enum. It'll be converted to an enum value
					#ifdef DEBUG
					std::cout << "mpp::RepParser::consume: reply's code is now " << rep.getStatText(rep.getStatus()) << std::endl;
					#endif
					toReturn = boost::indeterminate; // Keep parsing
				}

				else // Invalid response code
				{
					#ifdef DEBUG
					std::cout << "mpp::RepParser::consume: found invalid response code " << code << " in response." << std::endl;
					#endif
					toReturn = false; // Stop parsing
				}
			}

			else if (std::isspace(static_cast<unsigned char>(input))) // Code terminator
			{
				#ifdef DEBUG
				std::cout << "mpp::RepParser::consume: read space after third code digit, going to state ";
				#endif
				curStat = header_name;
				pHeaderNameSS.reset(new std::stringstream);
				#ifdef DEBUG
				std::cout << stateNames[curStat] << std::endl;
				#endif
			}

			else // Not a digit or a space, invalid
			{
				#ifdef DEBUG
				std::cout << "mpp::RepParser::consume: read '" << input << "' instead of a digit while attempting to read the code's third digit." << std::endl;
				#endif
				toReturn = false; // Stop parsing
			}

			break;
		}

		case header_name:
		{
			if (std::isalpha(static_cast<unsigned char>(input)) || input == '-') // Headers may only contain alphabetic characters and dashes
			{
				(*pHeaderNameSS) << input; // Store it
			}

			else if (input == ':') // Terminator
			{
				#ifdef DEBUG
				std::cout << "mpp::RepParser::consume: read '" << input << "' while reading a header name" << std::endl;
				#endif
				curStat = space_after_colon;
				#ifdef DEBUG
				std::cout << "mpp::RepParser::consume: going to state " << stateNames[curStat] << std::endl;
				#endif
			}

			else // Invalid character
			{
				#ifdef DEBUG
				std::cout << "mpp::RepParser::consume: header_name: read '" << input << "' instead of an alphabetic character or a dash" << std::endl;
				#endif
				toReturn = false;
			}

			break;
		}
	}

	#ifdef DEBUG
	std::cout << "mpp::ReqParser::consume returning " << toReturn << std::endl;
	#endif
	return toReturn;
}

/**
* @desc Sets our state before parsing more data.
* @param newStat The new state to change to.
**/
void mpp::RepParser::setState(mpp::RepParser::State newStat)
{
	curStat = newStat; // Store our new state
}

/**
* @desc Fetches the parser's current state.
* @return The parser's current state.
**/
mpp::RepParser::State mpp::RepParser::getState() const
{
	return curStat;
}

#ifdef DEBUG
std::string mpp::RepParser::getStateName(mpp::RepParser::State stat)
{
	return stateNames.at(stat); // Return the state's name or throw an exception
}
#endif

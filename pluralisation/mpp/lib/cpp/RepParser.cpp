/* C++ versions of C headers */
#include <cctype> // std::isdigit, std::isspace

/* STL */
#include <sstream> // std::ostringstream

#ifdef DEBUG
#include <bitset> // std::bitset
#include <iostream> // std::cout, std::endl
#endif

/* Boost */
#include <boost/logic/tribool.hpp> // boost::logic::tribool, boost::indeterminate
#include <boost/logic/tribool_io.hpp> // operator<< for boost::logic::tribool

/* MPP */
#include "mpp/ver.hpp" // MPP protocol version info
#include "mpp/RepParser.hpp" // Class def'n

/**
* @desc Default constructor. Constructs the parser in a state such that it is ready to parse the beginning of a reply.
**/
mpp::RepParser::RepParser() : curStat(initial_m), // Start off by expecting the 'M' in "MPP"
	version {mpp::VER_MAJOR, mpp::VER_MINOR, mpp::VER_PATCH},
	stateNames {
		{initial_m, "initial_m"},
		{first_p, "first_p"},
		{second_p, "second_p"},
		{slash, "slash"},
		{major, "major"},
		{minor, "minor"},
		{patch, "patch"},
		{space_after_patch, "space_after_patch"},
		{first_code_digit, "first_code_digit"},
		{second_code_digit, "second_code_digit"},
		{third_code_digit, "third_code_digit"},
		{header_name, "header_name"},
		{space_after_header_name, "space_after_header_name"},
		{header_value, "header_value"},
		{noun, "noun"}
	}
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
	<< "Start state = " << stateNames[curStat] << std::endl;
	#endif

	switch (curStat)
	{
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
				pMajSS.reset(new std::ostringstream); // Needed by the state that reads the major version #

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
			if (std::isdigit(input)) // The current character is a digit
			{
				(*pMajSS) << input; // Insert it into the stream
				toReturn = boost::indeterminate; // Keep parsing
			}

			else if (input == '.') // Terminator character
			{
				/* Check the major version */
				short majVer;
				(*pMajSS) >> majVer; // Read it as an int

				if (majVer != version.at(0)) // Not compatible with this version of the parser
				{
					status = Reply::badMajor;
					toReturn = false;

					#ifdef DEBUG
					std::cout << "mpp::RepParser::consume: major: expected major version #" << version.at(0) << ", but read " << majVer << std::endl;
					#endif
				}

				else // Correct version #
				{
					pMinSS.reset(new std::ostringstream);
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
			if (std::isdigit(input)) // This is a digit
			{
				(*pMinSS) << input; // Store it
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
					pPatchSS.reset(new std::ostringstream);
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
			if (std::isdigit(input)) // Digit in patch #
			{
				(*pPatchSS) << input;
				toReturn = boost::indeterminate;
			}

			else if (std::isspace(input)) // Space character, finished reading
			{
				short patch;
				(*pPatchSS) >> patch;

				if (patch != version.at(2)) // Bad version #
				{
					toReturn = false;
					#ifdef DEBUG
					std::cout << "mpp::RepParser::parse: patch: expected patch #" << version.at(2) << ", but read " << patch << std::endl;
					#endif
				}

				else
				{
					curStat = space_after_patch; // Expecting a space after the patch #
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

/* C++ versions of C headers */
#include <cctype> // std::toupper

/* STL */
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
		{protline_backslash_r, "protline_backslash_r"},
		{protline_backslash_n, "protline_backslash_n"},
		{header_name, "header_name"},
		{space_after_header_name, "space_after_header_name"},
		{header_value, "header_value"},
		{backslash_r_after_header_val, "backslash_r_after_header_val"},
		{backslash_n_after_header_val, "backslash_n_after_header_val"},
		{final_backslash_n, "final_backslash_n"},
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
				toReturn = false; // Stop parsing
			}

			break;
		}

		case first_p: // Expecting first 'P' in "MPP"
		{
			if (input == 'P') // Correct
			{
				#ifdef DEBUG
				#endif
			}

			else
			{
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

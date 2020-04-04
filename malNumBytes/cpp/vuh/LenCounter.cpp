/* STL */
#include <bitset> // std::bitset
#include <stdexcept> // std::logic_error
#include <sstream> // std::stringstream
#include <string> // std::string
#include <utility> // std::exchange
#include <algorithm> // std::for_each
#include <utility> // std::pair

#ifdef DEBUG
#include <iostream> // std::cout, std::endl
#endif

/* Our headers */
#include "vuh/LenCounter.hpp" // Class def'n

/**
* @desc Constructor. Initialises state.
**/
vuh::LenCounter::LenCounter() :
	curStat(codepoint_start),
	ncp(0),
	charPos(0)
{
	#ifdef DEBUG
	/* Set up reflection (names of states) for debugging */
	stateNames[codepoint_start] = "codepoint_start";
	stateNames[twobyte_second] = "twobyte_second";
	stateNames[threebyte_second] = "threebyte_second";
	stateNames[threebyte_third] = "threebyte_third";
	stateNames[fourbyte_second] = "fourbyte_second";
	stateNames[fourbyte_third] = "fourbyte_third";
	stateNames[fourbyte_fourth] = "fourbyte_fourth";

	std::for_each(stateNames.cbegin(), stateNames.cend(), [](std::pair<const State, std::string> curPair)
		{
			std::cout << "State value " << static_cast<int>(curPair.first) << " maps to string " << curPair.second << std::endl;
		}
	);
	#endif
}

/**
* @desc Resets the counter functor to the start state.
*	MUST be called after fetching the # of code points!
**/
void vuh::LenCounter::reset()
{
	curStat = codepoint_start;
	ncp = 0;
	charPos = 0;
	#ifdef DEBUG
	stateNames.clear();
	#endif
}

/**
* @desc Fetches the length of this string in code points, NOT bytes.
**/
short vuh::LenCounter::getNumCodePoints() const
{
	#ifdef DEBUG
	std::cout << "vuh::LenCounter::getNumCodePoints: ncp = " << ncp << std::endl;
	#endif
	return ncp;
}

/**
* @desc Handles the next character in the string, according to the current state.
**/
void vuh::LenCounter::operator()(char c)
{
	std::bitset<8> charBits(static_cast<unsigned long>(c)); // Convert char to unsigned long so that bitset's constructor can accept it

	#ifdef DEBUG	
	std::cout << "vuh::LenCounter::operator(): current byte = " << c << std::endl
	<< "\tBits = " << charBits << std::endl
	<< "\tByte value as int = " << charBits.to_ulong() << std::endl
	<< "\tState at start = " << stateNames[curStat] << std::endl << std::endl;
	#endif

	switch (curStat)
	{
		case codepoint_start: // Expecting the start of the next code point
		{
			if (!charBits.test(7)) // Byte 1: 0xxxxxxx
			{
				#ifdef DEBUG
				std::cout << "\tSingle-byte codepoint" << std::endl;
				#endif
				++ncp; // Single-byte code-point
			}

			else if (charBits.test(7) && charBits.test(6) && !charBits.test(5)) // Byte 1: 110xxxxx
			{
				#ifdef DEBUG
				std::cout << "\t2-byte codepoint" << std::endl;
				#endif
				curStat = twobyte_second; // Waiting for the second byte of a 2-byte code point
			}

			else if (charBits.test(7) && charBits.test(6) && charBits.test(5) && !charBits.test(4)) // Byte 1: 1110xxxx
			{
				#ifdef DEBUG
				std::cout << "\t3-byte codepoint" << std::endl;
				#endif
				curStat = threebyte_second; // Waiting for the second byte of a 3-byte character
			}

			else if (charBits.test(7) && charBits.test(6) && charBits.test(5) && charBits.test(4) && !charBits.test(3)) // Byte 1: 11110xxx
			{
				#ifdef DEBUG
				std::cout << "\t4-byte codepoint" << std::endl;
				#endif
				curStat = fourbyte_second; // Waiting for the second byte of a 4-byte code point
			}

			break;
		}

		case twobyte_second: // Expecting second byte of 2-byte code point
		{
			if (charBits.test(7) && !charBits.test(6)) // Second byte should be of the form 10xxxxxx
			{
				/* Valid 2-byte code point */
				++ncp;
				curStat = codepoint_start; // Wait for next code-point
			}

			else // Invalid second byte
			{
				std::stringstream etbs; // "E"rror "T"ext "B"uilder "S"tream
				etbs << "The second byte of a 2-byte code-point is invalid." << std::endl
					<< "\tCodepoint # [not including this one = " << ncp << std::endl
					<< "\t# of bytes processed (not including this one) = " << charPos << std::endl
					<< "\tThe value of this byte is: " << charBits << std::endl;
				std::logic_error err(etbs.str()); // Construct the error to throw using the generated string as the message
				throw err; // Throw it to halt execution/be caught
			}

			break;
		}

		case threebyte_second: // Expecting the second byte of a 3-byte UTF-8 code point
		{
			if (charBits.test(7) && !charBits.test(6)) // Second byte should be of the form 10xxxxxx
			{
				/* Valid second byte */
				curStat = threebyte_third; // Need to check the 3rd byte
			}

			else // Invalid second byte of a 3-byte char
			{
				std::stringstream etbs; // "E"rror "T"ext "B"uilder "S"tream
				etbs << "The second byte of a 3-byte code-point is invalid." << std::endl
					<< "\tCodepoint # [not including this one = " << ncp << std::endl
					<< "# of bytes processed (not including this one) = " << charPos << std::endl
					<< "\tThe value of this byte is: " << charBits << std::endl;
				std::logic_error err(etbs.str()); // Construct the error to throw using the generated string as the message
				throw err; // Throw it to halt execution/be caught
			}

			break;
		}

		case threebyte_third: // Expecting the 3rd byte of a 3-byte UTF-8 code point
		{
			if (charBits.test(7) && !charBits.test(6)) // The third byte should be of the form 10xxxxxx
			{
				/* Valid third byte, thus -> valid code point */
				++ncp; // Count this code point
				curStat = codepoint_start; // Be ready to count the next code point
			}

			else // Invalid third byte of a 3-byte code point
			{
				std::stringstream etbs; // "E"rror "T"ext "B"uilder "S"tream
				etbs << "The third byte of a 3-byte code-point is invalid." << std::endl
					<< "\tCodepoint # [not including this one = " << ncp << std::endl
					<< "# of bytes processed (not including this one) = " << charPos << std::endl
					<< "\tThe value of this byte is: " << charBits << std::endl;
				std::logic_error err(etbs.str()); // Construct the error to throw using the generated string as the message
				throw err; // Throw it to halt execution/be caught
			}

			break;
		}

		case fourbyte_second:
		{
			if (charBits.test(7) && !charBits.test(6)) // The second byte should be of the form 10xxxxxx
			{
				/* Valid second byte */
				curStat = fourbyte_third; // Need to check the next byte
			}

			else // Invalid second byte of a 4-byte code point
			{
				std::stringstream etbs; // "E"rror "T"ext "B"uilder "S"tream
				etbs << "The second byte of a 4-byte code-point is invalid." << std::endl
					<< "\tCodepoint # [not including this one = " << ncp << std::endl
					<< "# of bytes processed (not including this one) = " << charPos << std::endl
					<< "\tThe value of this byte is: " << charBits << std::endl;
				std::logic_error err(etbs.str()); // Construct the error to throw using the generated string as the message
				throw err; // Throw it to halt execution/be caught
			}

			break;
		}

		case fourbyte_third:
		{
			if (charBits.test(7) && !charBits.test(6)) // The second byte should be of the form 10xxxxxx
			{
				/* Valid third byte */
				curStat = fourbyte_fourth; // Need to check the next byte
			}

			else // Invalid third byte of a 4-byte code point
			{
				std::stringstream etbs; // "E"rror "T"ext "B"uilder "S"tream
				etbs << "The third byte of a 4-byte code-point is invalid." << std::endl
					<< "\tCodepoint # [not including this one = " << ncp << std::endl
					<< "# of bytes processed (not including this one) = " << charPos << std::endl
					<< "\tThe value of this byte is: " << charBits << std::endl;
				std::logic_error err(etbs.str()); // Construct the error to throw using the generated string as the message
				throw err; // Throw it to halt execution/be caught
			}

			break;
		}

		case fourbyte_fourth:
		{
			if (charBits.test(7) && !charBits.test(6)) // The second byte should be of the form 10xxxxxx
			{
				/* Valid fourth byte -> valid 4-byte UTF-8 code point*/
				curStat = codepoint_start; // Need to check the next code point
				++ncp; // Count this code point
			}

			else // Invalid fourth byte of a 4-byte code point
			{
				std::stringstream etbs; // "E"rror "T"ext "B"uilder "S"tream
				etbs << "The fourth byte of a 4-byte code-point is invalid." << std::endl
					<< "\tCodepoint # [not including this one = " << ncp << std::endl
					<< "# of bytes processed (not including this one) = " << charPos << std::endl
					<< "\tThe value of this byte is: " << charBits << std::endl;
				std::logic_error err(etbs.str()); // Construct the error to throw using the generated string as the message
				throw err; // Throw it to halt execution/be caught
			}

			break;
		}

		case invalid_state: // Should never happen unless moved from
		{
			std::logic_error err("Object was moved from! Don't use it!");
			throw err;
			break;
		}
	}

	++charPos; // We always increment the character (byte) position, regardless of the # of code-points read so far

	#ifdef DEBUG
	std::cout << "\tvuh::LenCounter::operator(): state at end = " << stateNames[curStat] << std::endl
	<< "\tCharacter counter @ end = " << charPos << std::endl
	<< "\t# of code-points @ end = " << ncp << std::endl;
	#endif
}

/**
* @desc Copy constructor.
* @param other The other LenCounter functor to copy data from.
**/	
vuh::LenCounter::LenCounter(const vuh::LenCounter& other) :
	curStat(other.curStat),
	ncp(other.ncp),
	charPos(other.charPos)
	#ifdef DEBUG
	, stateNames(other.stateNames)
	#endif
{
}

/**
* @desc Move constructor.
* @param other THe other functor to move data from.
**/
vuh::LenCounter::LenCounter(vuh::LenCounter&& other) : 
	curStat(std::exchange(other.curStat, invalid_state)),
	ncp(std::exchange(other.ncp, -1)),
	charPos(std::exchange(other.charPos, -1))
	#ifdef DEBUG
	, stateNames(std::exchange(other.stateNames, std::map<State, std::string>()))
	#endif
{
}

/**
* @desc Copy assignment operator.
* @param other The other functor to copy values from.
* @return This.
**/
vuh::LenCounter& vuh::LenCounter::operator=(const vuh::LenCounter& other)
{
	if (this != &other)
	{
		curStat = other.curStat;
		ncp = other.ncp;
		charPos = other.charPos;
		#ifdef DEBUG
		stateNames = other.stateNames;
		#endif
	}

	return *this;
}

/**
* @desc Move assignment operator.
* @param other The other functor to move values from.
* @return This.
*/
vuh::LenCounter& vuh::LenCounter::operator=(vuh::LenCounter&& other)
{
	if (this != &other)
	{
		curStat = std::exchange(other.curStat, invalid_state);
		ncp = std::exchange(other.ncp, -1);
		charPos = std::exchange(other.charPos, -1);
		#ifdef DEBUG
		stateNames = std::exchange(other.stateNames, std::map<State, std::string>());
		#endif
	}

	return *this;
}

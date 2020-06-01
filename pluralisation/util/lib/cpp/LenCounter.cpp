/* STL */
#include <bitset> // std::bitset
#include <sstream> // std::stringstream
#include <string> // std::string
#include <utility> // std::exchange
#include <algorithm> // std::for_each
#include <utility> // std::pair

#ifdef DEBUG
#include <iostream> // std::cerr, std::endl
#include <stdexcept> // std::out_of_range
#endif

/* Our headers */
#include "vuu/LenCounter.hpp" // Class def'n
#include "vuu/InvByteInCodePoint.hpp" // Thrown when operator() detects an invalid byte in a code point
#include "vuu/internals/StateNamePrinter.hpp" // Functor to print list of state names

/**
* @desc Constructor. Initialises state.
**/
vuu::LenCounter::LenCounter() :
	curStat(codepoint_start),
	ncp(0),
	charPos(0)
{
	#ifdef DEBUG
	std::cerr << "vuu::LenCounter::LenCounter() called." << std::endl;

	/* Set up reflection (names of states) for debugging */
	stateNames[codepoint_start] = "codepoint_start";
	stateNames[twobyte_second] = "twobyte_second";
	stateNames[threebyte_second] = "threebyte_second";
	stateNames[threebyte_third] = "threebyte_third";
	stateNames[fourbyte_second] = "fourbyte_second";
	stateNames[fourbyte_third] = "fourbyte_third";
	stateNames[fourbyte_fourth] = "fourbyte_fourth";
	stateNames[invalid_state] = "invalid_state";

	std::for_each(stateNames.cbegin(), stateNames.cend(), vuu::internals::StateNamePrinter()); // Print the names to be sure that they've been set correctly
	#endif
}

/**
* @desc Resets the counter functor to the start state.
*	MUST be called after fetching the # of code points!
**/
void vuu::LenCounter::reset()
{
	#ifdef DEBUG
	std::cerr << "vuu::LenCounter::reset called.";
	#endif

	curStat = codepoint_start;
	ncp = 0;
	charPos = 0;
}

/**
* @desc Fetches the length of this string in code points, NOT bytes.
**/
short vuu::LenCounter::getNumCodePoints() const
{
	#ifdef DEBUG
	std::cerr << "vuu::LenCounter::getNumCodePoints: ncp = " << ncp << std::endl;
	#endif
	return ncp;
}

/**
* @desc Handles the next character in the string, according to the current state.
**/
void vuu::LenCounter::operator()(char c)
{
	std::bitset<8> charBits(static_cast<unsigned long>(c)); // Convert char to unsigned long so that bitset's constructor can accept it

	#ifdef DEBUG	
	std::cerr << "vuu::LenCounter::operator(): current byte = " << c << std::endl
	<< "\tBits = " << charBits << std::endl
	<< "\tByte value as int = " << charBits.to_ulong() << std::endl
	<< "\tCurrent state = " << static_cast<short>(curStat) << std::endl;

	try
	{
		std::cerr << "\tState at start = " << stateNames.at(curStat) << std::endl << std::endl;
	}

	catch (std::out_of_range& stdoor)
	{
		std::cerr << "vuu::LenCounter::operator(): caught out_of_range after trying to fetch string for state " << static_cast<short>(curStat) << " at start " << std::endl
		<< "\tmessage = " << stdoor.what() << std::endl;
		std::cerr << "\tmap = [" << std::endl;
		std::for_each(stateNames.cbegin(), stateNames.cend(), vuu::internals::StateNamePrinter("vuu::LenCounter::operator():: catch 1"));
		std::cerr << "]" << std::endl;
	}
	#endif

	switch (curStat)
	{
		case codepoint_start: // Expecting the start of the next code point
		{
			if (!charBits.test(7)) // Byte 1: 0xxxxxxx
			{
				#ifdef DEBUG
				std::cerr << "\tSingle-byte codepoint" << std::endl;
				#endif
				++ncp; // Single-byte code-point
			}

			else if (charBits.test(7) && charBits.test(6) && !charBits.test(5)) // Byte 1: 110xxxxx
			{
				#ifdef DEBUG
				std::cerr << "\t2-byte codepoint" << std::endl;
				#endif
				curStat = twobyte_second; // Waiting for the second byte of a 2-byte code point
			}

			else if (charBits.test(7) && charBits.test(6) && charBits.test(5) && !charBits.test(4)) // Byte 1: 1110xxxx
			{
				#ifdef DEBUG
				std::cerr << "\t3-byte codepoint" << std::endl;
				#endif
				curStat = threebyte_second; // Waiting for the second byte of a 3-byte character
			}

			else if (charBits.test(7) && charBits.test(6) && charBits.test(5) && charBits.test(4) && !charBits.test(3)) // Byte 1: 11110xxx
			{
				#ifdef DEBUG
				std::cerr << "\t4-byte codepoint" << std::endl;
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
				vuu::InvByteInCodePoint err(etbs.str()); // Construct the error to throw using the generated string as the message
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
				vuu::InvByteInCodePoint err(etbs.str()); // Construct the error to throw using the generated string as the message
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
				vuu::InvByteInCodePoint err(etbs.str()); // Construct the error to throw using the generated string as the message
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
				vuu::InvByteInCodePoint err(etbs.str()); // Construct the error to throw using the generated string as the message
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
				vuu::InvByteInCodePoint err(etbs.str()); // Construct the error to throw using the generated string as the message
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
				vuu::InvByteInCodePoint err(etbs.str()); // Construct the error to throw using the generated string as the message
				throw err; // Throw it to halt execution/be caught
			}

			break;
		}

		case invalid_state: // Should never happen unless moved from
		{
			vuu::InvByteInCodePoint err(std::string("Object was moved from! Don't use it!"));
			throw err;
			break;
		}
	}

	++charPos; // We always increment the character (byte) position, regardless of the # of code-points read so far

	#ifdef DEBUG
	try
	{
		std::cerr << "vuu::LenCounter::operator(): state at end = " << stateNames.at(curStat) << std::endl;
	}

	catch (std::out_of_range& stdoor)
	{
		std::cerr << "vuu::LenCounter::operator(): caught out_of_range while trying to print state at end." << std::endl
		<< "\tMessage = " << stdoor.what() << std::endl;
		std::cerr << "\tmap = [" << std::endl;
		std::for_each(stateNames.cbegin(), stateNames.cend(), vuu::internals::StateNamePrinter());
		std::cerr << "]" << std::endl;
	}

	std::cerr << "vuu::LenCounter::operator(): Character counter @ end = " << charPos << std::endl
	<< "\t# of code-points @ end = " << ncp << std::endl;
	#endif
}

/**
* @desc Copy constructor.
* @param other The other LenCounter functor to copy data from.
**/	
vuu::LenCounter::LenCounter(const vuu::LenCounter& other) :
	curStat(other.curStat),
	ncp(other.ncp),
	charPos(other.charPos)
	#ifdef DEBUG
	,stateNames(other.stateNames)
	#endif
{
	#ifdef DEBUG
	std::cerr << "vuu::LenCounter: copy constructor called." << std::endl;
	std::cerr << "vuu::LenCounter::copy_constructor: before copying stateNames: stateNames = [";
	std::for_each(stateNames.cbegin(), stateNames.cend(), vuu::internals::StateNamePrinter("vuu::LenCounter::LenCounter(const vuu::LenCounter& other)"));
	std::cerr << "]" << std::endl << "\tother.stateNames = [";

	if (!other.stateNames.empty())
	{
		if (other.stateNames.cbegin() != other.stateNames.cend())
		{
			std::cerr << "\tother.stateNames.size() (unsigned) = " << other.stateNames.size() << std::endl;
			std::cerr << "\tother.stateNames.size() (int) = " << static_cast<long long>(other.stateNames.size()) << std::endl;
			std::for_each(other.stateNames.cbegin(), other.stateNames.cend(), vuu::internals::StateNamePrinter("vuu::LenCounter::LenCounter(const vuu::LenCounter& other): if1: if2"));
		}

		else
		{
			std::cerr << "No elements in map (begin() == end())" << std::endl;
		}
	}

	else
	{
		std::cerr << "\tempty" << std::endl;
	}

	std::cerr << "]";

	stateNames = other.stateNames;

	std::cerr << "vuu::LenCounter::copy_constructor: after copying stateNames: stateNames = [" << std::endl;
	std::for_each(stateNames.cbegin(), stateNames.cend(), vuu::internals::StateNamePrinter("vuu::LenCounter::LenCounter(const vuu::LenCounter& other): end"));
	std::cerr << "]" << std::endl << "\tother.stateNames = [" << std::endl;
	std::for_each(other.stateNames.cbegin(), other.stateNames.cend(), vuu::internals::StateNamePrinter("vuu::LenCounter::LenCounter(const vuu::LenCounter& other): other.stateNames"));
	std::cerr << "]";
	#endif
}

/**
* @desc Move constructor.
* @param other THe other functor to move data from.
**/
vuu::LenCounter::LenCounter(vuu::LenCounter&& other) : 
	curStat(std::exchange(other.curStat, invalid_state)),
	ncp(std::exchange(other.ncp, -1)),
	charPos(std::exchange(other.charPos, -1))
	#ifdef DEBUG
	, stateNames(other.stateNames)
	#endif
{
	#ifdef DEBUG
	std::cerr << "vuu::LenCounter: move constructor called." << std::endl;
	#endif
}

/**
* @desc Copy assignment operator.
* @param other The other functor to copy values from.
* @return This.
**/
vuu::LenCounter& vuu::LenCounter::operator=(const vuu::LenCounter& other)
{
	#ifdef DEBUG
	std::cerr << "vuu::LenCounter: copy assignment operator called." << std::endl;
	#endif

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
vuu::LenCounter& vuu::LenCounter::operator=(vuu::LenCounter&& other)
{
	#ifdef DEBUG
	std::cerr << "vuu::LenCounter: move assignment operator called." << std::endl;
	#endif

	if (this != &other)
	{
		curStat = std::exchange(other.curStat, invalid_state);
		ncp = std::exchange(other.ncp, -1);
		charPos = std::exchange(other.charPos, -1);
		#ifdef DEBUG
		stateNames = other.stateNames;
		#endif
		other.curStat = invalid_state;
	}

	return *this;
}

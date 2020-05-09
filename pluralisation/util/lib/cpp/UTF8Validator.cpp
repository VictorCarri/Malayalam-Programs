/* Standard C++ */
#include <bitset> // std::bitset

/* Our headers */
#include "vuu/UTF8Validator.hpp" // Class def'n

/**
* @desc Determines whether the current character:
*	a) Represents the (valid) start of a sequence of bytes that represent a Unicode codepoint in UTF-8 encoding.
*	b) Represents one (valid) byte in a sequence of bytes that represent a Unicode codepoint in UTF-8 encoding.
* @return True if either of the above conditions is true, false otherwise.
**/
bool vuu::UTF8Validator::operator()(char c)
{
	std::bitset<8> charBits(static_cast<unsigned long long>(c)); // Convert character to bits
	bool toReturn; // The value to return (to satisfy g++, which thinks that there's no return statement)

	switch (curStat)
	{
		case codepoint_start: // Waiting for the start of a codepoint
		{
			if (!charBits.test(7)) // 0xxxxxxx - single-byte codepoint
			{
				toReturn = true; // This codepoint is valid
			}

			else if (charBits.test(7) && charBits.test(6) && !charBits.test(5)) // 110xxxxx - start of 2-byte codepoint
			{
				curStat = twobyte_second; // Waiting for the second byte of a 2-byte codepoint
				toReturn = true; // This initial byte is valid
			}

			else if (charBits.test(7) & charBits.test(6) && charBits.test(5) && !charBits.test(4)) // 1110xxxx - start of 3-byte codepoint
			{
				curStat = threebyte_second;
				toReturn = true; // Initial byte is valid
			}

			else if (charBits.test(7) && charBits.test(6) && charBits.test(5) && charBits.test(4) && !charBits.test(3)) // 11110xxx - start of 4-byte codepoint
			{
				curStat = fourbyte_second;
				toReturn = true; // Initial byte is valid
			}
	
			else // Invalid byte
			{
				toReturn = false;
			}

			break;
		}

		case twobyte_second: // Waiting for the second byte of a 2-byte codepoint
		{
			if (charBits.test(7) && !charBits.test(6)) // 10xxxxxx - valid 2nd byte
			{
				curStat = codepoint_start; // Wait for a new codepoint
				toReturn = true; // Valid 2nd byte
			}

			else // Invalid
			{
				toReturn = false;
			}

			break;
		}

		case threebyte_second: // Waiting for the second byte of a 3-byte codepoint
		{
			if (charBits.test(7) && !charBits.test(6)) // 10xxxxxx - correct
			{
				curStat = threebyte_third; // Need to check the third byte
				toReturn = true; // Valid second byte
			}

			else // Invalid second byte
			{
				toReturn = false;
			}

			break;
		}

		case threebyte_third: // Waiting for the third byte of a 3-byte codepoint
		{
			if (charBits.test(7) && !charBits.test(6)) // 10xxxxxx - correct
			{
				curStat = codepoint_start; // This codepoint is valid
				toReturn = true; // Valid third byte
			}

			else // Invalid third byte
			{
				toReturn = false;
			}

			break;
		}

		case fourbyte_second: // Waiting for the fourth byte of a 4-byte codepoint
		{
			if (charBits.test(7) && !charBits.test(6)) // 10xxxxxx - correct
			{
				curStat = fourbyte_third; // Need to check the third byte
				toReturn = true; // Valid second byte
			}

			else // Invalid second byte of a 4-byte UTF-8 codepoint
			{
				toReturn = false;
			}

			break;
		}

		case fourbyte_third:
		{
			if (charBits.test(7) && !charBits.test(6)) // 10xxxxxx - correct
			{
				curStat = fourbyte_fourth; // Need to chec the 4th byte
				toReturn = true; // Valid byte
			}

			else // Invalid byte
			{
				toReturn = false;
			}

			break;
		}
		
		case fourbyte_fourth:
		{
			if (charBits.test(7) && !charBits.test(6)) // 10xxxxxx - correct
			{
				curStat = codepoint_start; // Valid 4-byte codepoint found. Need to restart with the next code point.
				toReturn = true; // Valid byte
			}

			else // Invalid byte
			{
				toReturn = false;
			}

			break;
		}
	}

	return toReturn;
}

/**
* @desc Default constructor. Initialises the functor's members.
**/
vuu::UTF8Validator::UTF8Validator() : curStat(codepoint_start) // Start by looking for the first byte in a code point
{
}

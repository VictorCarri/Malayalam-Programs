/* Standard C++ */
#include <bitset> // std::bitset
#include <sstream> // std::stringstream
#include <iostream> // std::endl
#include <utility> // std::move

/* Boost */
#include <boost/dynamic_bitset.hpp> // boost::dynamic_bitset

/* Our headers */
#include "vuu/InvByteInCodePoint.hpp" // Exception thrown if an invalid code-point is found
#include "vuu/CodepointFinder.hpp" // Class def'n

/**
* @desc Handles the current byte. This byte may be part of a code point, or it may be the start of the next one.
* @param cur The current byte to handle.
**/
void vuu::CodepointFinder::operator()(char cur)
{
	std::bitset<8> charBits(static_cast<unsigned long long>(cur)); // Reinterpret the character as a sequence of bits

	switch (curStat) // Check what state we are in
	{
		case codepoint_start: // Reading the first byte of a codepoint
		{
			if (!charBits.test(7)) // 0xxxxxxx - 1-byte codepoint
			{
				codePoints.push_front(static_cast<unsigned long long>(cur)); // We need only store this byte as the current codepoint
			}

			else if (charBits.test(7) && charBits.test(6) && !charBits.test(5)) // 110xxxxx - first byte of a 2-byte codepoint
			{
				(*pBitSS) << charBits.to_string().substr(4-1); // Fetch the bits as a string and discard the top 3 bits, since they're just indicators. Then, store it in the stringstream
				curStat = twobyte_second; // Wait for the next byte to calculate the full value
			}

			else if (charBits.test(7) && charBits.test(6) && charBits.test(5) && !charBits.test(4)) // 1110xxxx
			{
				(*pBitSS) << charBits.to_string().substr(5-1); // Discard the top 5 bits and store the rest of the bits
				curStat = threebyte_second; // Waiting for the second byte of a 3-byte codepoint
			}

			else if (charBits.test(7) && charBits.test(6) && charBits.test(5) && charBits.test(4) && !charBits.test(3)) // 11110xxx
			{
				(*pBitSS) << charBits.to_string().substr(6-1); // Discard the leading 6 bits and store the rest
				curStat = fourbyte_second;
			}

			break;
		}

		case twobyte_second: // Reading the second byte of a 2-byte codepoint
		{
			if (charBits.test(7) && !charBits.test(6)) // 10xxxxxx - correct
			{
				(*pBitSS) << charBits.to_string().substr(3-1); // Fetch the bits as a string, discard the top 2 bits, and append it to the bits that we've already read
				const boost::dynamic_bitset<> finalBits(pBitSS->str()); // Fetch the concatenated string of bits and initialise a dynamic bitset with it
				codePoints.push_front(static_cast<unsigned long long>(finalBits.to_ulong())); // Convert the final string of bits to an unsigned long, promote it to an unsigned long long, and add it to the list of code points
				pBitSS.reset(new std::stringstream); // Destroy the old stringstream and create a new one, so that we have a clean stringstream for the next codepoint
				curStat = codepoint_start; // Expect the start of the next codepoint
			}

			else // Invalid byte in code-point
			{
				std::stringstream ess;
				ess << "vuu::CodepointFinder::operator(): the second byte of a 2-byte codepoint is invalid!" << std::endl
				<< "\tInvalid byte = " << charBits.to_string() << std::endl
				<< "\tBitstring built so far = " << pBitSS->str() << std::endl;
				vuu::InvByteInCodePoint invByteEx(ess.str());
				throw invByteEx;
			}
		}

		case threebyte_second:
		{
			if (charBits.test(7) && !charBits.test(6)) // 10xxxxxx - valid second byte
			{
				(*pBitSS) << charBits.to_string().substr(3-1); // Fetch the bits as a string, remove the top 2 bits, then append them to the stored bits
				curStat = threebyte_third; // Waiting for the third byte of a 3-byte codepoint
			}
			
			else // Invalid codepoint
			{
				std::stringstream ess;
				ess << "vuu::CodepointFinder::operator(): the second byte of a 3-byte codepoint is invalid!" << std::endl
				<< "\tInvalid byte = " << charBits.to_string()
				<< "\tBitstring built so far = " << pBitSS->str() << std::endl;
				vuu::InvByteInCodePoint ex(ess.str());
				throw ex;
			}

			break;
		}
	
		case threebyte_third:
		{
			if (charBits.test(7) && !charBits.test(6)) // 10xxxxxx - valid third & final byte
			{
				(*pBitSS) << charBits.to_string().substr(3-1); // Fetch the bits as a string, drop the leading "10", and concatenate it to the bitstring we're building
				const boost::dynamic_bitset<> finalBits(pBitSS->str()); // Initialise a bitset using the generated string
				codePoints.push_front(static_cast<unsigned long long>(finalBits.to_ulong()));
				pBitSS.reset(new std::stringstream); // Use a fresh stringstream next time
				curStat = codepoint_start; // Wait for the next codepoint
			}

			else // Invalid codepoint
			{
				std::stringstream ess;
				ess << "vuu::CodepointFinder::operator(): the third byte of a 3-byte codepoint is invalid!" << std::endl
				<< "\tInvalid byte = " << charBits.to_string()
				<< "\tBitstring built so far = " << pBitSS->str() << std::endl;
				vuu::InvByteInCodePoint ex(ess.str());
				throw ex;
			}

			break;
		}

		case fourbyte_second:
		{
			if (charBits.test(7) && !charBits.test(6)) // 10xxxxxx - valid
			{
				(*pBitSS) << charBits.to_string().substr(3-1); // Store the string after removing the top 2 bits
				curStat = fourbyte_third; // Third byte of a 4-byte codepoint
			}

			else // Invalid codepoint
			{
				std::stringstream ess;
				ess << "vuu::CodepointFinder::operator(): the second byte of a 4-byte codepoint is invalid!" << std::endl
				<< "\tInvalid byte = " << charBits.to_string()
				<< "\tBitstring built so far = " << pBitSS->str() << std::endl;
				vuu::InvByteInCodePoint ex(ess.str());
				throw ex;
			}

			break;
		}

		case fourbyte_third:
		{
			if (charBits.test(7) && !charBits.test(6)) // 10xxxxxx - valid
			{
				(*pBitSS) << charBits.to_string().substr(3-1); // Append the current string to the bitstring after removing the top 2 bits
				curStat = fourbyte_fourth;
			}

			else // Invalid codepoint
			{
				std::stringstream ess;
				ess << "vuu::CodepointFinder::operator(): the third byte of a 4-byte codepoint is invalid!" << std::endl
				<< "\tInvalid byte = " << charBits.to_string()
				<< "\tBitstring built so far = " << pBitSS->str() << std::endl;
				vuu::InvByteInCodePoint ex(ess.str());
				throw ex;
			}

			break;
		}

		case fourbyte_fourth:
		{
			if (charBits.test(7) && !charBits.test(6)) // 10xxxxxx - valid
			{
				(*pBitSS) << charBits.to_string().substr(3-1);
				const boost::dynamic_bitset<> finalBits(pBitSS->str()); // Initialise a bitset using the generated string
				codePoints.push_front(static_cast<unsigned long long>(finalBits.to_ulong()));
				pBitSS.reset(new std::stringstream);
				curStat = codepoint_start;
			}

			else // Invalid codepoint
			{
				std::stringstream ess;
				ess << "vuu::CodepointFinder::operator(): the fourth byte of a 4-byte codepoint is invalid!" << std::endl
				<< "\tInvalid byte = " << charBits.to_string()
				<< "\tBitstring built so far = " << pBitSS->str() << std::endl;
				vuu::InvByteInCodePoint ex(ess.str());
				throw ex;
			}
		}
	} // switch
}

/**
* @desc Default constructor. Initialises the functor's state.
**/
vuu::CodepointFinder::CodepointFinder() : curStat(codepoint_start),
	pBitSS(new std::stringstream)
{
}

/**
* @desc Fetches an immutable iterator that points to the beginning of the sequence of code points.
* @return An immutable iterator that points to the beginning of the sequence of code points.
**/
vuu::CodepointFinder::const_iterator vuu::CodepointFinder::cbegin() const
{
	return codePoints.cbegin();
}

/**
* @desc Fetches an immutable iterator that points to the end of the sequence of code points.
* @return An immutable iterator that points to the end of the sequence of code points.
**/
vuu::CodepointFinder::const_iterator vuu::CodepointFinder::cend() const
{
	return codePoints.cend();
}

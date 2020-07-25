/* Standard library */
#include <iostream> // std::cout
#include <algorithm> // std::for_each, std::all_of
#include <string> // std::string
#include <iomanip> // std::quoted

/* Unicode utilities library */
#include "vuu/UTF8Validator.hpp" // vuu::UTF8Validator. Used with std::all_of to validate a string as a valid UTF-8 string.
#include "vuu/CodepointFinder.hpp" // vuu::CodepointFinder. Used with std::for_each to find a list of the Unicode codepoints in a UTF-8 string
#include "vuu/CodepointsInRange.hpp" // vuu::CodepointsInRange. Used with std::all_of to ensure that all of the code-points in a list are in a given range.

/* Our headers */
#include "Client.hpp" // Client class def'n

int main()
{
	/* Unicode utilities setup */
	vuu::UTF8Validator validator; // Used to ensure that an std::string contains valid UTF-8 text
	vuu::CodepointsInRange inRangeChecker(0xd00, 0xd7f); // Ensures that all of the code-points in a list of unsigned ints are in the correct range for Malayalam

	/* Client setup */
	#ifdef DEBUG
	std::cout << "main: constructing Client" << std::endl;
	#endif
	Client c; // The class that encapsulates our client
	#ifdef DEBUG
	std::cout << "main: constructed Client" << std::endl
	<< "main: starting client" << std::endl;
	#endif
	c.start(); // Tell the client that we're ready to start using it
	#ifdef DEBUG
	std::cout << "main: started client" << std::endl
	<< "main: entering while loop" << std::endl;
	#endif

	while (c.isActive()) // The client is running
	{
		#ifdef DEBUG
		std::cout << "main: fetching input" << std::endl;
		#endif
		c.readInput(); // Fetch input from the user
		#ifdef DEBUG
		std::cout << "main: fetched input" << std::endl
		<< "main: checking whether or not I should quit" << std::endl;
		#endif

		if (c.shouldQuit()) // The user requested that we quit
		{
			#ifdef DEBUG
			std::cout << "main: user has requested that I quit" << std::endl;
			#endif
			c.quit(); // Tell the client to quit
			#ifdef DEBUG
			std::cout << "main: told client to quit" << std::endl;
			#endif
		}

		else // Not a request to quit, validate input
		{
			std::string input = c.getInput(); // Fetch the input string

			if (std::all_of(input.cbegin(), input.cend(), validator)) // The string is a valid UTF-8 string
			{
				#ifdef DEBUG
				std::cout << "main: the string " << std::quoted(input) << " is a valid UTF-8 string!" << std::endl;
				#endif

				vuu::CodepointFinder vcf = std::for_each(input.cbegin(), input.cend(), vuu::CodepointFinder()); // Find the list of the code-points in this string

				if (std::all_of(vcf.cbegin(), vcf.cend(), inRangeChecker)) // All code-points are in the Malayalam range
				{
					#ifdef DEBUG
					std::cout << "main: the string " << std::quoted(input) << " contains only Malayalam code-points" << std::endl;
					#endif
				}
		
				else // At least one code-point was out of range
				{
					std::cerr << "The string " << std::quoted(input) << " contains at least one code-point that is outside the valid Malayalam range (0x0d00 to 0x0d7f)" << std::endl;
				}
			}

			else // The string isn't a valid UTF-8 string
			{
				std::cerr << "The string " << std::quoted(input) << " isn't a valid UTF-8 string!" << std::endl;
			}
		}
	}

	return 0;
}

/* Standard library */
#include <iostream> // std::cout
#include <algorithm> // std::for_each
#include <string> // std::string
#include <iomanip> // std::quoted

/* Unicode utilities library */
#include "vuu/UTF8Validator.hpp" // vuu::UTF8Validator. Used with std::all_of to validate a string as a valid UTF-8 string.

/* Our headers */
#include "Client.hpp" // Client class def'n

int main()
{
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

			if (std::all_of(input.cbegin(), input.cend(), vuu::UTF8Validator())) // The string is a valid UTF-8 string
			{
				#ifdef DEBUG
				std::cout << "main: the string " << std::quoted(input) << " is a valid UTF-8 string!" << std::endl;
				#endif
			}

			else // The string isn't a valid UTF-8 string
			{
				std::cerr << "The string " << std::quoted(input) << " isn't a valid UTF-8 string!" << std::endl;
			}
		}
	}

	return 0;
}

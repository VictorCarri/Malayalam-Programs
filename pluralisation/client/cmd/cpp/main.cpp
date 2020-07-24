/* Standard library */
#include <iostream> // std::cout

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
		c.getInput(); // Fetch input from the user
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
	}

	return 0;
}

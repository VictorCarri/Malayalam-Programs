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
		c.getInput(); // Fetch input from the user
	}

	return 0;
}

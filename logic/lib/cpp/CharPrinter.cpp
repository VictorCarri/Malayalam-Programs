/* STL */
#include <iostream> // std::cout

/* Our headers */
#include "CharPrinter.hpp" // Class def'n

void CharPrinter::operator()(const char c)
{
	if (c != '\0')
	{
		std::cout << c;
	}
}

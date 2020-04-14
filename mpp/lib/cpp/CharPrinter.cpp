/* STL */
#include <iostream> // std::cout

/* Our headers */
#include "mpp/CharPrinter.hpp" // Class def'n

void mpp::CharPrinter::operator()(const char c)
{
	if (c != '\0')
	{
		std::cout << c;
	}
}

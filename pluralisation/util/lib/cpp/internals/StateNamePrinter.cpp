/* STL */
#include <utility> // std::pair
#include <string> // std::string
#include <iostream> // std::cerr

/* Our headers */
#include "vuu/internals/StateNamePrinter.hpp" // Class def'n
#include "vuu/LenCounter.hpp" // vuu::LenCounter::State

/**
* @desc Handles a single pair in the map of States to state names (strings).
* @param p A pair representing the current mapping in the iteration.
**/
void vuu::internals::StateNamePrinter::operator()(std::pair<vuu::LenCounter::State, std::string> p)
{
	std::cerr << prefix << ": " << static_cast<int>(p.first) << " maps to string " << p.second << std::endl;
}

/**
* @desc Default constructor. Forwards to constructor that takes std::string, using the prefix "vuu::LenCounter::LenCounter()".
**/
vuu::internals::StateNamePrinter::StateNamePrinter() : vuu::internals::StateNamePrinter::StateNamePrinter("vuu::LenCounter::Lencounter()")
{
}

/**
* @desc Constructs a StateNamePrinter that prints the given prefix before each message.
**/
vuu::internals::StateNamePrinter::StateNamePrinter(std::string pref) : prefix(pref)
{
}

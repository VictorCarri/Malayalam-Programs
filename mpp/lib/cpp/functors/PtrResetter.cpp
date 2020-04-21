/* STL */
#include <sstream> // std::wstringstream

/* Our headers */
#include "mpp/functors/PtrResetter.hpp"

/**
* @desc Resets the given pointer (replaces the stringstream inside with a new one).
* @param ptr The pointer to reset.
**/
void mpp::functors::PtrResetter::operator()(std::unique_ptr<std::wstringstream> ptr)
{
	ptr.reset(new std::wstringstream);
}

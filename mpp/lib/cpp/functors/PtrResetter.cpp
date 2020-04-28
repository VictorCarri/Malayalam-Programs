/* STL */
#include <sstream> // std::stringstream
#include <memory> // std::unique_ptr

/* Our headers */
#include "mpp/functors/PtrResetter.hpp"

/**
* @desc Resets the given pointer (replaces the stringstream inside with a new one).
* @param ptr The pointer to reset.
**/
void mpp::functors::PtrResetter::operator()(std::unique_ptr<std::stringstream>& ptr)
{
	ptr.reset(new std::stringstream);
}

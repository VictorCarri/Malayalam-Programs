/* Standard C++ */
#include <memory> // std::unique_ptr
#include <sstream> // std::stringstream

/* Our headers */
#include "mpp/functors/PtrResetter.hpp" // Class def'n

/**
* @desc Resets the given pointer with a new stringstream.
* @param ptr A reference to the unique_ptr object to reset.
**/
void mpp::functors::PtrResetter::operator()(std::unique_ptr<std::stringstream>& ptr)
{
	ptr.reset(new std::stringstream);
}

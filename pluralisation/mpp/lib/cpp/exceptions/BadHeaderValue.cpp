/* Standard C++ */
#include <string> // std::string
#include <stdexcept> // std::logic_error

/* Our headers */
#include "mpp/exceptions/BadHeaderValue.hpp" // Class def'n

/**
* @desc Constructor. Constructs the parent with the given argument.
* @param whatArg A string that describes the error message, to be passed to std::logic_error's constructor.
**/
mpp::exceptions::BadHeaderValue::BadHeaderValue(std::string whatArg) : std::logic_error(whatArg)
{
}

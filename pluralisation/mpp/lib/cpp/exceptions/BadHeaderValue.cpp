/* Standard C++ */
#include <string> // std::string

/* Our headers */
#include "mpp/exceptions/Exception.hpp" // Base class
#include "mpp/exceptions/BadHeaderValue.hpp" // Class def'n

/**
* @desc Constructor. Constructs the parent with the given argument.
* @param whatArg A string that describes the error message, to be passed to std::logic_error's constructor.
**/
mpp::exceptions::BadHeaderValue::BadHeaderValue(std::string whatArg) : mpp::exceptions::Exception(whatArg)
{
}

/**
* @desc Constructor. Constructs the parent with the given argument.
* @param whatArg A string that describes the error message, to be passed to std::logic_error's constructor.
**/
mpp::exceptions::BadHeaderValue::BadHeaderValue(char* whatArg) : mpp::exceptions::Exception(whatArg)
{
}

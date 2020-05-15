/* Standard C++ */
#include <stdexcept> // std::logic_error

/* Our headers */
#include "mpp/exceptions/Exception.hpp" // Class def'n

/**
* @desc Constructor. Creates an exception that contains the given text.
* @param what The text to store in this exception.
**/
mpp::exceptions::Exception::Exception(std::string what) : std::logic_error(what)
{
}

/**
* @desc Constructor. Creates an exception that contains the given text.
* @param what The text to store in this exception.
**/
mpp::exceptions::Exception::Exception(char* what) : std::logic_error(what)
{
}

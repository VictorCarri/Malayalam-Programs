/* Standard C++ */
#include <string> // std::string
#include <stdexcept> // std::logic_error

/* Our headers */
#include "mpp/exceptions/Exception.hpp" // Parent
#include "mpp/exceptions/MissingDBInfo.hpp" // Class def'n

/**
* @desc Constructor. Propagates the given message up to the parent.
* @param what The message to store in this exception.
**/
mpp::exceptions::MissingDBInfo::MissingDBInfo(std::string what) : std::logic_error(what), mpp::exceptions::Exception(what)
{
}

/**
* @desc Constructor. Propagates the given message up to the parent.
* @param what The message to store in this exception.
**/
mpp::exceptions::MissingDBInfo::MissingDBInfo(char* what) : std::logic_error(what), mpp::exceptions::Exception(what)
{
}

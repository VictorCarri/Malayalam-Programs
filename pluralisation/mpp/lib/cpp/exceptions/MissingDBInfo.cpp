/* Standard C++ */
#include <string> // std::string

/* Our headers */
#include "mpp/exceptions/Exception.hpp" // Parent
#include "mpp/exceptions/MissingDBInfo.hpp" // Class def'n

/**
* @desc Constructor. Propagates the given message up to the parent.
* @param what The message to store in this exception.
**/
mpp::Exceptions::MissingDBInfo::MissingDBInfo(std::string what) : mpp::exceptions::Exception(what)
{
}

/**
* @desc Constructor. Propagates the given message up to the parent.
* @param what The message to store in this exception.
**/
mpp::Exceptions::MissingDBInfo::MissingDBInfo(char* what) : mpp::exceptions::Exception(what)
{
}

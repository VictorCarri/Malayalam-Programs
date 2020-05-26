/* Standard C++ */
#include <string> // std::string
#include <stdexcept> // std::logic_error

/* Our headers */
#include "mpp/exceptions/Exception.hpp" // Parent
#include "mpp/exceptions/MissingDBConfFile.hpp" // Class def'n

/**
* @desc Constructor. Creates the exception object by propagating the message up to the parent.
* @param whatArg The text to store in this exception.
**/
mpp::exceptions::MissingDBConfFile::MissingDBConfFile(std::string whatArg) : std::logic_error(whatArg), mpp::exceptions::Exception(whatArg)
{
}
/**
* @desc Constructor. Creates the exception object by propagating the message up to the parent.
* @param whatArg The text to store in this exception.
**/
mpp::exceptions::MissingDBConfFile::MissingDBConfFile(char* whatArg) : std::logic_error(whatArg), mpp::exceptions::Exception(whatArg)
{
}

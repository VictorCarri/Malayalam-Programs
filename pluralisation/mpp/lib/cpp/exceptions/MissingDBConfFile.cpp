/* Standard C++ */
#include <string> // std::string

/* Our headers */
#include "mpp/exceptions/Exception.hpp" // Base class
#include "mpp/exceptions/MissingDBConfFile.hpp" // Class def'n

/**
* @desc Constructor. Creates the exception object by propagating the message up to the parent.
* @param whatArg The text to store in this exception.
**/
mpp::exceptions::MissingDBConfFile::MissingDBConfFile(std::string whatArg) : mpp::exceptions::Exception(whatArg)
{
}
/**
* @desc Constructor. Creates the exception object by propagating the message up to the parent.
* @param whatArg The text to store in this exception.
**/
mpp::exceptions::MissingDBConfFile::MissingDBConfFile(char* whatArg) : mpp::exceptions::Exception(whatArg)
{
}

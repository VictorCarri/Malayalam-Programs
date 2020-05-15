/* Standard C++ */
#include <string> // std::string

/* Our headers */
#include "mpp/exceptions/Exception.hpp" // Parent
#include "mpp/exceptions/DBError.hpp" // Class def'n

/**
* @desc Constructor. Constructs the base using the message.
* @param what The message to store in this exception.
**/
mpp::exceptions::DBError::DBError(char* what) : mpp::exceptions::Exception(what)
{
}

/**
* @desc Constructor. Constructs the base using the message.
* @param what The message to store in this exception.
**/
mpp::exceptions::DBError::DBError(std::string what) : mpp::exceptions::Exception(what)
{
}

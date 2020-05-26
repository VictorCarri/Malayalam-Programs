/* STL */
#include <string> // std::string
#include <stdexcept> // std::logic_error

/* Our headers */
#include "mpp/exceptions/Exception.hpp" // Parent
#include "mpp/exceptions/UnknownHeader.hpp" // Class def'n

/**
* @desc Constructor. Creates the exception with the given message.
* @param msg The message that this exception should carry.
**/
mpp::exceptions::UnknownHeader::UnknownHeader(std::string msg) : std::logic_error(msg), mpp::exceptions::Exception(msg)
{
}

/**
* @desc Constructor. Creates the exception with the given message.
* @param msg The message that this exception should carry.
**/
mpp::exceptions::UnknownHeader::UnknownHeader(char* msg) : std::logic_error(msg), mpp::exceptions::Exception(msg)
{
}

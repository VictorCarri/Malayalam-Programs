/* STL */
#include <string> // std::string
#include <stdexcept> // std::invalid_argument

/* Our headers */
#include "mpp/exceptions/UnknownHeader.hpp" // Class def'n

/**
* @desc Constructor. Creates the exception with the given message.
* @param msg The message that this exception should carry.
**/
mpp::exceptions::UnknownHeader::UnknownHeader(std::string msg) : std::invalid_argument(msg)
{
}

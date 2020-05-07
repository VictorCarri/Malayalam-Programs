/* STL */
#include <stdexcept> // std::logic_error

/* Our headers */
#include "vuu/InvByteInCodePoint.hpp" // Class def'n

/*
* @desc Constructor. Builds the parent using the given message.
* @param message The message which this exception will contain.
*/
vuu::InvByteInCodePoint::InvByteInCodePoint(char* message) : std::logic_error(message)
{
}

/*
* @desc Constructor. Builds the parent using the given message.
* @param message The message which this exception will contain.
*/
vuu::InvByteInCodePoint::InvByteInCodePoint(std::string message) : std::logic_error(message)
{
}

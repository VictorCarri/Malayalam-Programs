/* Standard C++ */
#include <string> // std::string
#include <stdexcept> // std::logic_error

/* Our headers */
#include "mpp/exceptions/Exception.hpp" // Parent
#include "mpp/exceptions/UnknownNoun.hpp" // Class def'n

/**
* @desc Constructor. Constructs our parent with the given raw string.
* @param what A raw string containing the text to store in this exception.
**/
mpp::exceptions::UnknownNoun::UnknownNoun(char* what) : std::logic_error(what), mpp::exceptions::Exception(what)
{
}

/**
* @desc Constructor. Constructs our parent with the given raw string.
* @param what A raw string containing the text to store in this exception.
**/
mpp::exceptions::UnknownNoun::UnknownNoun(std::string what) : std::logic_error(what), mpp::exceptions::Exception(what)
{
}

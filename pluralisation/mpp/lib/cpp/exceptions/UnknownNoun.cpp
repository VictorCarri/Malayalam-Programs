/* Standard C++ */
#include <string> // std::string

/* Our headers */
#include "mpp/exceptions/UnknownNoun.hpp" // Class def'n

/**
* @desc Constructor. Constructs our parent with the given raw string.
* @param what A raw string containing the text to store in this exception.
**/
mpp::exceptions::UnknownNoun::UnknownNoun(char* what) : mpp::exceptions::Exception(what)
{
}

/**
* @desc Constructor. Constructs our parent with the given raw string.
* @param what A raw string containing the text to store in this exception.
**/
mpp::exceptions::UnknownNoun::UnknownNoun(std::string what) : mpp::exceptions::Exception(what)
{
}

/* Our headers */
#include "mpp/Header.hpp" // Class def'n

/**
* @name Constructor.
* @desc Contructs a Header with the given name and value.
**/
mpp::Header::Header(std::string name, std::string value) : _name(name), _value(value)
{
}

/**
* @desc Fetches this header's name.
* @return This header's name.
**/
std::string mpp::Header::getName() const
{
	return _name;
}

/**
* @desc Fetches this header's value.
* @return This header's value.
**/
std::string mpp::Header::getValue() const
{
	return _value;
}

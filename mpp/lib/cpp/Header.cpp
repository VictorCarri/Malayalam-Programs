/* C++ Standard Library */
#include <utility> // std::move
#include <string> // std::string
#include <any> // std::any

/* Our headers */
#include "mpp/Header.hpp" // Class def'n

/**
* @name Constructor.
* @desc Contructs a Header with the given name and value.
**/
mpp::Header::Header(std::string name, std::any value) : _name(name), _value(value)
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
std::any mpp::Header::getValue() const
{
	return _value;
}

/**
* @desc Copy constructor.
* @param other The other Header object to copy values from.
**/
mpp::Header::Header(const mpp::Header& other) : _name(other._name), _value(other._value)
{
}

/**
* @desc Move constructor.
* @param other The other Header object to move values from.
**/
mpp::Header::Header(mpp::Header&& other) : _name(std::move(other._name)), _value(std::move(other._value))
{
}

/**
* @desc Copy assignment operator.
* @param other The other Header object to copy values from.
**/
mpp::Header& mpp::Header::operator=(const mpp::Header& other)
{
	if (&other == this) // Self-assignment
		return *this;

	/* Copy values */
	_name = other._name;
	_value = other._value;

	return *this; // Allow chaining
}

/**
* @desc Move assignment operator.
* @param other THe other Header object to move values from.
**/
mpp::Header& mpp::Header::operator=(mpp::Header&& other)
{
	if (&other == this) // Self-assignment
		return *this;

	/* Move values */
	_name = std::move(other._name);
	_value = std::move(other._value);

	return *this; // Allow chaining
}

/**
* @desc Default constructor.
**/
mpp::Header::Header() : _name(), _value()
{
}

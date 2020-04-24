/* STL */
#include <utility> // std::move

/* Our headers */
#include "mpp/functors/HeaderFinder.hpp" // Class def'n

/**
* @desc Constructor. Stores the name to search for.
* @param nm The name to search for.
**/
mpp::functors::HeaderFinder::HeaderFinder(std::string nm) : name(nm)
{
}

/**
* @desc Checks the given Header to see if its name matches the one we were constructed with.
* @param h The header to check the name of.
* @return True if the header's name matches $name, false otherwise.
**/	
bool mpp::functors::HeaderFinder::operator()(const Header h)
{
	return h.getName() == name; // Check if the header's name matches what we were constructed with
}

/**
* @desc Copy constructor.
* @param other The other functor to copy from.
**/
mpp::functors::HeaderFinder(const mpp::functors::HeaderFinder& other) : name(other.name)
{
}

/**
* @desc Copy assignment operator.
* @param other The other functor to copy from.
* @return *this, to allow chaining.
**/
mpp::functors::HeaderFinder& mpp::functors::HeaderFinder::operator=(const mpp::functors::HeaderFinder& other)
{
	if (this != &other) // Avoid self-assignment
	{
		name = other.name; // Copy the string
	}

	return *this;
}

/**
* @desc Move constructor.
* @param other The other functor to move from.
**/
mpp::functors::HeaderFinder(mpp::functors::HeaderFinder&& other) : name(std::move(other.name))
{
}

/**
* @desc Move assignment operator.
* @param other The other functor to move from.
* @return *this, to allow chaining.
**/
mpp::functors::HeaderFinder& mpp::functors::HeaderFinder::operator=(mpp::functors::HeaderFinder&& other)
{
	if (this != &other)
	{
		name = std::move(other.name);
	}
}

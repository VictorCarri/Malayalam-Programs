/* STL */
#include <string> // std::string
#include <utility> // std::move
#ifdef DEBUG
#include <iostream> // std::cout
#endif

/* Our headers */
#include "mpp/functors/VerbChecker.hpp" // Class def'n

#ifdef DEBUG
/**
* @desc Constructor. Stores the character to check for as the first character of the verb.
* @param upr The uppercase character to check for as the first character of each verb string.
* @param nm THe name to use when printing debug messages.
**/
mpp::functors::VerbChecker::VerbChecker(char upr, std::string nm) : upper(upr), name(nm)
{
}

#else
/**
* @desc Constructor. Stores the character to check for as the first character of the verb.
* @param upr The uppercase character to check for as the first character of each verb string.
**/
mpp::functors::VerbChecker::VerbChecker(char upr) : upper(upr)
{
}
#endif

/**
* @desc Determines whether or not the current verb's first character is $upper.
* @param verb The current verb to check.
* @return True if the verb's first character matches $upper, false otherwise.
**/	
bool mpp::functors::VerbChecker::operator()(std::string verb)
{
	#ifdef DEBUG
	std::cout << name << ": comparing first character of verb \"" << verb << "\" to uppercase char '" << upper << "'" << std::endl;
	#endif

	if (verb[0] == upper) // Found a match
	{
		#ifdef DEBUG
		std::cout << name << ": matched verb \"" << verb << "\"" << std::endl;
		#endif

		return true;
	}

	else
	{
		#ifdef DEBUG
		std::cout << name << ": didn't match verb \"" << verb << "\"" << std::endl;
		#endif

		return false;
	}
}

/**
* @desc Copy constructor.
* @param other The other functor to copy from.
**/
#ifdef DEBUG
mpp::functors::VerbChecker::VerbChecker(const mpp::functors::VerbChecker& other) : upper(other.upper), name(other.name)
#else
mpp::functors::VerbChecker::VerbChecker(const mpp::functors::VerbChecker& other) : upper(other.upper)
#endif
{
}

/**
* @desc Move constructor.
* @param other The other VerbChecker to move from.
**/
#ifdef DEBUG
mpp::functors::VerbChecker::VerbChecker(mpp::functors::VerbChecker&& other) : upper(other.upper), name(std::move(other.name))
#else
mpp::functors::VerbChecker::VerbChecker(mpp::functors::VerbChecker&& other) : upper(other.upper)
#endif
{
}

/**
* @desc Move assignment operator.
* @param other The other VerbChecker to move from.
* @return A reference to this VerbChecker to allow chaining.
**/
mpp::functors::VerbChecker& mpp::functors::VerbChecker::operator=(mpp::functors::VerbChecker&& other)
{
	if (this != &other)
	{
		upper = other.upper;
		#ifdef DEBUG
		name = std::move(other.name);
		#endif
	}

	return *this;
}

/**
* @desc Copy assignment operator.
* @param other The other VerbChecker to move from.
* @return A reference to this VerbChecker to allow chaining.
**/
mpp::functors::VerbChecker& mpp::functors::VerbChecker::operator=(const mpp::functors::VerbChecker& other)
{
	if (this != &other)
	{
		upper = other.upper;
		#ifdef DEBUG
		name = other.name;
		#endif
	}

	return *this;
}

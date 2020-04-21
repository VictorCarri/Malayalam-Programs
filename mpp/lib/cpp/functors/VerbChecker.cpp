/* STL */
#include <string> // std::wstring
#ifdef DEBUG
#include <iostream> // std::wcout
#endif

/* Our headers */
#include "mpp/functors/VerbChecker.hpp" // Class def'n

#ifndef DEBUG
/**
* @desc Constructor. Stores the character to check for as the first character of the verb.
* @param upr The uppercase character to check for as the first character of each verb string.
**/
mpp::functors::VerbChecker::VerbChecker(wchar_t upr) : upper(upr)
{
}

#else
/**
* @desc Constructor. Stores the character to check for as the first character of the verb.
* @param upr The uppercase character to check for as the first character of each verb string.
* @param nm THe name to use when printing debug messages.
**/
mpp::functors::VerbChecker::VerbChecker(wchar_t upr, std::wstring nm) : upper(upr), name(nm)
{
}
#endif

/**
* @desc Determines whether or not the current verb's first character is $upper.
* @param verb The current verb to check.
* @return True if the verb's first character matches $upper, false otherwise.
**/	
bool mpp::functors::VerbChecker::operator()(std::wstring verb)
{
	#ifdef DEBUG
	std::wcout << name << L": comparing first character of verb \"" << verb << L"\" to uppercase char '" << upper << L"'" << std::endl;
	#endif

	if (verb[0] == upper) // Found a match
	{
		#ifdef DEBUG
		std::wcout << name << L": matched verb \"" << verb << "\"" << std::endl;
		#endif

		return true;
	}

	else
	{
		#ifdef DEBUG
		std::wcout << name << L": didn't match verb \"" << verb << "\"" << std::endl;
		#endif

		return false;
	}
}

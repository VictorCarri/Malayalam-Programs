/* Boost */
#include <boost/regex.hpp> // boost::smatch
#include <boost/regex/icu.hpp> // boost::u32regex, boost::u32regex_match

/* Our headers */
#include "mpp/functors/SingMatcher.hpp" // Class def'n

/**
* @desc Constructor. Stores the noun to match.
* @param noun The noun to match.
**/
mpp::functors::SingMatcher::SingMatcher(std::string noun) : n(noun)
{
}

/**
* @desc Attempts to match the given regex against the noun. The reference to what is passed to boost::u32regex_match, so that the match results can be
*	stored in it.
* @return True if the regex matches the noun, false otherwise.
**/
bool mpp::functors::SingMatcher::operator()(const boost::u32regex& reg, boost::smatch& what)
{
	return boost::u32regex_match(n, what, reg);
}

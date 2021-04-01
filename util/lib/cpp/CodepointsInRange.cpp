/* Our headers */
#include "vuu/CodepointsInRange.hpp" // Class def'n

/**
* @desc Constructor. Creates a functor that will check that each code-point is in the range [minimum, maximum].
* @param minimum The minimum valid codepoint.
* @param maximum The maximum valid codepoint.
**/
vuu::CodepointsInRange::CodepointsInRange(unsigned minimum, unsigned maximum) : min(minimum), max(maximum)
{
}

/**
* @desc Determines whether or not the given code-point is in the range this functor was constructed with.
* @param codePoint The current code-point value to check.
* @return True if min <= codePoint <= max, false otherwise.
**/
bool vuu::CodepointsInRange::operator()(unsigned codePoint)
{
	return min <= codePoint && codePoint <= max;
}

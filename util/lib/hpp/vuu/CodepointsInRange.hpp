#ifndef VUU_CODEPOINTSINRANGE_HPP
#define VUU_CODEPOINTSINRANGE_HPP

namespace vuu
{
	/**
	* This functor ensures that all of the code-points in a list of code-points are in the given range.
	* It is designed to be used with std::all_of.
	**/
	class CodepointsInRange
	{
		public:
			/**
			* @desc Constructor. Creates a functor that will check that each code-point is in the range [minimum, maximum].
			* @param minimum The minimum valid codepoint.
			* @param maximum The maximum valid codepoint.
			**/
			CodepointsInRange(unsigned minimum, unsigned maximum);

			/**
			* @desc Determines whether or not the given code-point is in the range this functor was constructed with.
			* @param codePoint The current code-point value to check.
			* @return True if min <= codePoint <= max, false otherwise.
			**/
			bool operator()(unsigned codePoint);

		private:
			unsigned min, max; // The minimum and maximum values of a code-point
	};
}

#endif // VUU_CODEPOINTSINRANGE_HPP

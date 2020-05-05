#ifndef MPP_FUNCTORS_SINGMATCHER_HPP
#define MPP_FUNCTORS_SINGMATCHER_HPP

/* Standard C++ */
#include <string> // std::string

/* Boost */
#include <boost/regex.hpp> // boost::smatch
#include <boost/regex/icu.hpp> // boost::u32regex

namespace mpp
{
	namespace functors
	{
		/**
		* Takes a noun to check the singularity of, a constant reference to a regex to use, a modifiable references to an array of boost::smatch, and a modifiable reference
		* to an array of bools. It checks whether the current regex matches the noun it was constructed with. The boolean result is stored in the given boolean reference
		* and the match results are stored in the given smatch reference.
		**/
		class SingMatcher
		{
			public:
				/**
				* @desc Constructor. Stores the noun to match.
				* @param noun The noun to match.
				**/
				SingMatcher(std::string noun);

				/**
				* @desc Attempts to match the given regex against the noun. The reference to what is passed to boost::u32regex_match, so that the match results can be
				*	stored in it.
				* @return True if the regex matches the noun, false otherwise.
				**/
				bool operator()(const boost::u32regex& reg, boost::smatch& what);

			private:
				std::string n; // The noun to match
		};
	};
};

#endif // MPP_FUNCTORS_SINGMATCHER_HPP

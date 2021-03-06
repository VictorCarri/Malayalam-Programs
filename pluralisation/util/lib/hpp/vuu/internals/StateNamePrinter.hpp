#ifndef VUU_INTERNALS_STATENAMEPRINTER_HPP
#define VUU_INTERNALS_STATENAMEPRINTER_HPP

/* STL */
#include <utility> // std::pair
#include <string> // std::string

/* Our headers */
#include "vuu/LenCounter.hpp" // Class for which we're used

namespace vuu
{
	namespace internals
	{
		/*
		* Used for debugging. A functor that prints the strings that are mapped to each state in vuu::LenCounter.
		* @example std::for_each(stateNames.cbegin(), stateNames.cend(), vuu::internals::StateNamePrinter())
		*/
		class StateNamePrinter
		{
			public:
				/**
				* @desc Handles a single pair in the map of States to state names (strings).
				* @param p A pair representing the current mapping in the iteration.
				**/
				void operator()(std::pair<vuu::LenCounter::State, std::string> p);

				/**
				* @desc Default constructor. Forwards to constructor that takes std::string, using the prefix "vuu::LenCounter::LenCounter()".
				**/
				StateNamePrinter();

				/**
				* @desc Constructs a StateNamePrinter that prints the given prefix before each message.
				**/
				StateNamePrinter(std::string pref);

			private:
				std::string prefix; // String to print before pairs
		};
	};
};

#endif // VUU_INTERNALS_STATENAMEPRINTER_HPP

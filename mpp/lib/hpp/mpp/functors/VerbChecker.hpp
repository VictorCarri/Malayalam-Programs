#ifndef MPP_FUNCTORS_VERBCHECKER_HPP
#define MPP_FUNCTORS_VERBCHECKER_HPP

/* STL */
#include <string> // std::wstring

namespace mpp
{
	namespace functors
	{
		class VerbChecker
		{
			public:
				#ifndef DEBUG
				/**
				* @desc Constructor. Stores the character to check for as the first character of the verb.
				* @param upr The uppercase character to check for as the first character of each verb string.
				**/
				VerbChecker(wchar_t upr);

				#else
				/**
				* @desc Constructor. Stores the character to check for as the first character of the verb.
				* @param upr The uppercase character to check for as the first character of each verb string.
				* @param nm THe name to use when printing debug messages.
				**/
				VerbChecker(wchar_t upr, std::wstring nm);
				#endif
	
				/**
				* @desc Determines whether or not the current verb's first character is $upper.
				* @param verb The current verb to check.
				* @return True if the verb's first character matches $upper, false otherwise.
				**/	
				bool operator()(std::wstring verb);

			private:
				wchar_t upper; // The uppercase string to search for
				#ifdef DEBUG
				std::wstring name; // The name to use when printing debugging info.
				#endif
		};
	};
};

#endif // MPP_FUNCTORS_VERBCHECKER_HPP

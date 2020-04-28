#ifndef MPP_FUNCTORS_VERBCHECKER_HPP
#define MPP_FUNCTORS_VERBCHECKER_HPP

/* STL */
#include <string> // std::string

namespace mpp
{
	namespace functors
	{
		class VerbChecker
		{
			public:
				#ifdef DEBUG
				/**
				* @desc Constructor. Stores the character to check for as the first character of the verb.
				* @param upr The uppercase character to check for as the first character of each verb string.
				* @param nm THe name to use when printing debug messages.
				**/
				VerbChecker(char upr, std::string nm);

				#else

				/**
				* @desc Constructor. Stores the character to check for as the first character of the verb.
				* @param upr The uppercase character to check for as the first character of each verb string.
				**/
				VerbChecker(char upr);
				#endif
	
				/**
				* @desc Copy constructor.
				* @param other The other functor to copy from.
				**/
				VerbChecker(const VerbChecker& other);

				/**
				* @desc Determines whether or not the current verb's first character is $upper.
				* @param verb The current verb to check.
				* @return True if the verb's first character matches $upper, false otherwise.
				**/	
				bool operator()(std::string verb);

				/**
				* @desc Move constructor.
				* @param other The other VerbChecker to move from.
				**/
				VerbChecker(VerbChecker&& other);

				/**
				* @desc Move assignment operator.
				* @param other The other VerbChecker to move from.
				* @return A reference to this VerbChecker to allow chaining.
				**/
				VerbChecker& operator=(VerbChecker&& other);

				/**
				* @desc Copy assignment operator.
				* @param other The other VerbChecker to move from.
				* @return A reference to this VerbChecker to allow chaining.
				**/
				VerbChecker& operator=(const VerbChecker& other);

			private:
				char upper; // The uppercase string to search for
				#ifdef DEBUG
				std::string name; // The name to use when printing debugging info.
				#endif
		};
	};
};

#endif // MPP_FUNCTORS_VERBCHECKER_HPP

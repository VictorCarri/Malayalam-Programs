#ifndef MPP_EXCEPTIONS_UNKNOWNNOUN_HPP
#define MPP_EXCEPTIONS_UNKNOWNNOUN_HPP

/* Standard C++ */
#include <string> // std::string

/* Our headers */
#include "mpp/exceptions/Exception.hpp" // Parent of all MPP exceptions

namespace mpp
{
	namespace exceptions
	{
		class UnknownNoun : public virtual Exception
		{
			public:
				/**
				* @desc Constructor. Constructs our parent with the given raw string.
				* @param what A raw string containing the text to store in this exception.
				**/
				UnknownNoun(char* what);

				/**
				* @desc Constructor. Constructs our parent with the given raw string.
				* @param what A raw string containing the text to store in this exception.
				**/
				UnknownNoun(std::string what);
		}; // class UnknownNoun
	}; // namespace exceptions
}; // namespace mpp

#endif // MPP_EXCEPTIONS_UNKNOWNNOUN_HPP

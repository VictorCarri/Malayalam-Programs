#ifndef MPP_EXCEPTIONS_BADHEADERVALUE_HPP
#define MPP_EXCEPTIONS_BADHEADERVALUE_HPP

/* Standard C++ */
#include <stdexcept> // std::logic_error
#include <string> // std::string

namespace mpp
{
	namespace exceptions
	{
		/**
		* Thrown when an any_cast to the expected type of a header's value (based on the header's name) fails.
		* Eg. It's thrown if trying to any_cast the value associated with the "Content-Type" header
		*     to "int" fails, because that header should have an "int" value associated with it.
		**/
		class BadHeaderValue : public std::logic_error
		{
			public:
				/**
				* @desc Constructor. Constructs the parent with the given argument.
				* @param whatArg A string that describes the error message, to be passed to std::logic_error's constructor.
				**/
				BadHeaderValue(std::string whatArg);
		};
	};
};

#endif // MPP_EXCEPTIONS_BADHEADERVALUE_HPP
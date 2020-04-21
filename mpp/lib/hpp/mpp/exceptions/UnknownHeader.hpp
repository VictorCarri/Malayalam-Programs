#ifndef MPP_EXCEPTIONS_UNKNOWNHEADER_HPP
#define MPP_EXCEPTIONS_UNKNOWNHEADER_HPP

/* STL */
#include <stdexcept> // std::invalid_argument
#include <string> // std::string

namespace mpp
{
	namespace exceptions
	{
		/**
		* Exception thrown when an unknown header name is given to a Request object.
		**/
		class UnknownHeader : public std::invalid_argument
		{
			public:
				/**
				* @desc Constructor. Creates the exception with the given message.
				* @param msg The message that this exception should carry.
				**/
				UnknownHeader(std::string msg);
		};
	};
};

#endif // MPP_EXCEPTIONS_UNKNOWNHEADER_HPP

#ifndef MPP_EXCEPTIONS_UNKNOWNHEADER_HPP
#define MPP_EXCEPTIONS_UNKNOWNHEADER_HPP

/* STL */
#include <string> // std::string

/* Our headers */
#include "mpp/exceptions/Exception.hpp" // Base class of all MPP exceptions

namespace mpp
{
	namespace exceptions
	{
		/**
		* Exception thrown when an unknown header name is given to a Request object.
		**/
		class UnknownHeader : public virtual Exception
		{
			public:
				/**
				* @desc Constructor. Creates the exception with the given message.
				* @param msg The message that this exception should carry.
				**/
				UnknownHeader(std::string msg);

				/**
				* @desc Constructor. Creates the exception with the given message.
				* @param msg The message that this exception should carry.
				**/
				UnknownHeader(char* msg);
		};
	};
};

#endif // MPP_EXCEPTIONS_UNKNOWNHEADER_HPP

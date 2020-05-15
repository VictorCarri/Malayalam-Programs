#ifndef MPP_EXCEPTIONS_DBERROR_HPP
#define MPP_EXCEPTIONS_DBERROR_HPP

/* Standard C++ */
#include <string> // std::string

/* Our headers */
#include "mpp/exceptions/Exception.hpp" // Base of all MPP exceptions

namespace mpp
{
	namespace exceptions
	{
		/**
		* @desc Thrown if some sort of DB-related error occurs.
		**/
		class DBError : public Exception
		{
			public:
				/**
				* @desc Constructor. Constructs the base using the message.
				* @param what The message to store in this exception.
				**/
				DBError(char* what);

				/**
				* @desc Constructor. Constructs the base using the message.
				* @param what The message to store in this exception.
				**/
				DBError(std::string what);
		};
	};
};

#endif // MPP_EXCEPTIONS_DBERROR_HPP

#ifndef MPP_EXCEPTIONS_MISSINGDBINFO_HPP
#define MPP_EXCEPTIONS_MISSINGDBINFO_HPP

/* Standard C++ */
#include <string> // std::string

/* Our headers */
#include "mpp/exceptions/Exception.hpp" // Parent

namespace mpp
{
	namespace exceptions
	{
		/**
		* Thrown if the configuration file was missing data that mpp::data::DBInfo expected to be there.
		**/
		class MissingDBInfo : public virtual Exception
		{
			public:
				/**
				* @desc Constructor. Propagates the given message up to the parent.
				* @param what The message to store in this exception.
				**/
				MissingDBInfo(std::string what);

				/**
				* @desc Constructor. Propagates the given message up to the parent.
				* @param what The message to store in this exception.
				**/
				MissingDBInfo(char* what);
		};
	};
};

#endif // MPP_EXCEPTIONS_MISSINGDBINFO_HPP

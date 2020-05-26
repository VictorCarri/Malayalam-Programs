#ifndef MPP_EXCEPTIONS_MISSINGDBCONFFILE_HPP
#define MPP_EXCEPTIONS_MISSINGDBCONFFILE_HPP

/* Standard C++ */
#include <string> // std::string

/* Our headers */
#include "mpp/exceptions/Exception.hpp" // Base class of all MPP exceptions

namespace mpp
{
	namespace exceptions
	{
		/**
		* An exception thrown if we can't find the DB info file.
		**/
		class MissingDBConfFile : public virtual Exception
		{
			public:
				/**
				* @desc Constructor. Creates the exception object by propagating the message up to the parent.
				* @param whatArg The text to store in this exception.
				**/
				MissingDBConfFile(std::string whatArg);

				/**
				* @desc Constructor. Creates the exception object by propagating the message up to the parent.
				* @param whatArg The text to store in this exception.
				**/
				MissingDBConfFile(char* whatArg);
		};
	};
};

#endif // MPP_EXCEPTIONS_MISSINGDBCONFFILE_HPP

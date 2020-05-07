#ifndef VUU_INVBYTEINCODEPOINT_HPP
#define VUU_INVBYTEINCODEPOINT_HPP

/* STL */
#include <stdexcept> // std::logic_error
#include <string> // std::string

namespace vuu
{
	/**
	* @desc A class that describes an error that occurs when a code-point contains an invalid byte.
	**/
	class InvByteInCodePoint : public std::logic_error
	{
		public:
			/*
			* @desc Constructor. Builds the parent using the given message.
			* @param message The message which this exception will contain.
			*/
			InvByteInCodePoint(char* message);

			/*
			* @desc Constructor. Builds the parent using the given message.
			* @param message The message which this exception will contain.
			*/
			InvByteInCodePoint(std::string message);
	};
};

#endif // VUU_INVBYTEINCODEPOINT_HPP

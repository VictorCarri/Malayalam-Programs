#ifndef VUU_UTF8VALIDATOR_HPP
#define VUU_UTF8VALIDATOR_HPP

namespace vuu
{
	/**
	* @desc A functor that validates an std::string as containing a valid sequence of bytes in UTF-8 format.
	* @usage bool isValidUTF8 = std::all_of(str.cbegin(), str.cend(), UTF8Validator());
	**/
	class UTF8Validator
	{
		public:
			/**
			* @desc Determines whether the current character:
			*	a) Represents the (valid) start of a sequence of bytes that represent a Unicode codepoint in UTF-8 encoding.
			*	b) Represents one (valid) byte in a sequence of bytes that represent a Unicode codepoint in UTF-8 encoding.
			* @return True if either of the above conditions is true, false otherwise.
			**/
			bool operator()(char c);

			/**
			* @desc Default constructor. Initialises the functor's members.
			**/
			UTF8Validator();

		private:
			enum State
			{
				codepoint_start, // Waiting for the start of a codepoint
				twobyte_second, // Waiting for the second byte of a 2-byte codepoint
				threebyte_second, // Waiting for the second byte of a 3-byte codepoint
				threebyte_third, // Waiting for the third byte of a 3-byte codepoint
				fourbyte_second, // Waiting for the second byte of a 4-byte codepoint
				fourbyte_third, // Waiting for the third byte of a 4-byte code point
				fourbyte_fourth // Waiting for the final byte of a 4-byte codepoint
			};

			State curStat; // Current state
	};
}

#endif // VUU_UTF8VALIDATOR_HPP

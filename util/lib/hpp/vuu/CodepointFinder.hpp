#ifndef VUU_CODEPOINTFINDER_HPP
#define VUU_CODEPOINTFINDER_HPP

/* Standard C++ */
#include <forward_list> // std::forward_list
#include <memory> // std::unique_ptr
#include <sstream> // std::stringstream

namespace vuu
{
	/**
	* This functor iterates through a valid UTF-8 string and creates a vector of UTF-32 codepoints for comparison.
	* It then allows the caller to fetch iterators that loop through the list of codepoints.
	**/
	class CodepointFinder
	{
		public:
			typedef std::forward_list<unsigned>::const_iterator const_iterator; // To allow the implementation & clients to use a simple type

			/**
			* @desc Handles the current byte. This byte may be part of a code point, or it may be the start of the next one.
			* @param cur The current byte to handle.
			**/
			void operator()(char cur);

			/**
			* @desc Default constructor. Initialises the functor's state.
			**/
			CodepointFinder();

			/**
			* @desc Fetches an immutable iterator that points to the beginning of the sequence of code points.
			* @return An immutable iterator that points to the beginning of the sequence of code points.
			**/
			const_iterator cbegin() const;

			/**
			* @desc Fetches an immutable iterator that points to the end of the sequence of code points.
			* @return An immutable iterator that points to the end of the sequence of code points.
			**/
			const_iterator cend() const;

		private:
			/* The parser's current state */
			enum State
			{
				codepoint_start, // Waiting for the start of a codepoint
				twobyte_second, // Waiting for the second byte of a 2-byte codepoint
				threebyte_second, // Waiting for the second byte of a 3-byte codepoint
				threebyte_third, // Waiting for the final byte of a 3-byte codepoint
				fourbyte_second,
				fourbyte_third,
				fourbyte_fourth
			};

			State curStat; // Current state
			std::forward_list<unsigned> codePoints; // Vector of codepoints
			std::unique_ptr<std::stringstream> pBitSS; // Pointer to stringstream that holds the string that contains the combined bits from multiple calls to operator()
	};
}

#endif // VUU_CODEPOINTFINDER_HPP

#ifndef VUU_LENCOUNTER_HPP
#define VUU_LENCOUNTER_HPP

#ifdef DEBUG
/* STL */
#include <map> // std::map
#include <string> // std::string
#endif

/*
* A namespace for my unicode utility classes. Used so that my library can live in its own namespace.
*/
namespace vuu
{
	/**
	* A functor that counts the # of Unicode chars. in a UTF-8 encoded string.
	**/
	class LenCounter
	{
		public:
			/**
			* @desc Handles the next character in the string, according to the current state.
			**/
			void operator()(char c);
	
			/**
			* @desc Fetches the length of this string in code points, NOT bytes.
			**/
			short getNumCodePoints() const;
	
			/**
			* @desc Constructor. Initialises state.
			**/
			LenCounter();
	
			/**
			* @desc Resets the counter functor to the start state.
			*	MUST be called after fetching the # of code points!
			**/
			void reset();
	
			/**
			* @desc Copy constructor.
			* @param other The other LenCounter functor to copy data from.
			**/	
			LenCounter(const LenCounter& other);
	
			/**
			* @desc Move constructor.
			* @param other THe other functor to move data from.
			**/
			LenCounter(LenCounter&& other);
	
			/**
			* @desc Copy assignment operator.
			* @param other The other functor to copy values from.
			* @return This.
			**/
			LenCounter& operator=(const LenCounter& other);
	
			/**
			* @desc Move assignment operator.
			* @param other The other functor to move values from.
			* @return This.
			*/
			LenCounter& operator=(LenCounter&& other);

			/**
			* The length-counter's current state.
			**/
			enum State
			{
				codepoint_start, // Expecting the first byte of the next codepoint
				twobyte_second, // Expecting the second byte of a 2-byte codepoint
				threebyte_second, // Expecting the second byte of a 3-byte codepoint
				threebyte_third, // Expecting the third byte of a 3-byte codepoint
				fourbyte_second, // Expecting the second byte of a 4-byte codepoint
				fourbyte_third, // Expecting the third byte of a 4-byte codepoint
				fourbyte_fourth, // Expecting the fourth byte of a 4-byte codepoint
				invalid_state // Invalid state for move constructor & assignment operator
			};
	
		private:
			State curStat; // Current state
			short ncp; // # of code points
			short charPos; // Current position in CHAR stream, NOT code-point index
		
			#ifdef DEBUG
			std::map<State, std::string> stateNames; // For debugging
			#endif
	};
}

#endif // VUU_LENCOUNTER_HPP

#ifndef MPP_REPPARSER_HPP
#define MPP_REPPARSER_HPP

/* STL */
#ifdef DEBUG
#include <iostream> // std::cout, std::wcout
#include <map> // std::map
#include <string> // std::string
#endif
#include <array> // std::array

/* Boost */
#include <boost/tuple/tuple.hpp> // boost::tuple, boost::make_tuple
#include <boost/logic/tribool.hpp> // boost::tribool, boost::indeterminate
#include <boost/logic/tribool_io.hpp> // operator<< for boost::tribool

/* MPP */
#include "mpp/Reply.hpp" // Represents a Reply to parse

namespace mpp
{
	/**
	* @desc This class parses a reply from the server into a Response object.
	**/
	class RepParser
	{
		public:
			/**
			* @desc Default constructor. Constructs the parser in a state such that it is ready to parse the beginning of a reply.
			**/
			RepParser();

			/**
			* @desc Resets the parser to its initial state.
			**/
			void reset();

			template<typename InputIterator>
			boost::tuple<boost::tribool, InputIterator> parse(Reply& rep, InputIterator begin, InputIterator end)
			{
				while (begin != end)
				{
					#ifdef DEBUG
					std::cout << "mpp::RepParser::parse: character at begin = '";
					std::wcout << *begin;
					std::cout << std::endl;
					#endif

					boost::tribool res = consume(req, *begin++); // Have our internal parser try to parse as much data as it can before reaching the end or encountering malformed data

					if (res || !res) // We have either successfully parsed a response, or encountered a malformed response
					{
						#ifdef DEBUG
						std::cout << "mpp::RepParser::parse: either finished parsing or encountered malformed data." << std::endl;
						std::cout << "\tReturning (" << res << "," << *begin << ")" << std::endl;
						#endif
						return boost::make_tuple(res, begin);
					}
				}

				#ifdef DEBUG
				std::cout << "mpp::RepParser::parse: reached end of input." << std::endl;
				std::cout << "\tReturning (" << boost::indeterminate << ", " << *begin << ")" << std::endl;
				#endif
				return boost::make_tuple(boost::indeterminate, begin);
			}

			/**
			* @desc Sets our state before parsing more data.
			* @param newStat The new state to change to.
			**/
			void setState(State newStat);

		private:
			/**
			* @desc Handles the current character in the input stream.
			* @param rep The Reply object whose parameters we'll set while parsing.
			* @param input The next character of input.
			**/
			boost::tribool consume(Reply& rep, char input);

			/**
			* We don't include states for '\r' and '\n's because the Client program that uses us
			* is expected to read until encountering a sequence of "\r\n", and
			* to set the parser's state before calling our parse() member as appropriate.
			**/
			enum State // Parser state
			{
				/* Reading "MPP" */
				initial_m, // Expecting 'M' in "MPP"
				first_p,
				second_p,

				/* Reading the protocol version */
				slash, // Expecting the slash in "MPP/{ver}"
				major, // Protocol major version number
				minor,
				patch, // Patch #
				space_after_patch, // Expecting a single space character

				/* Reading the code */
				first_code_digit, // Expecting the first digit of the reply code
				second_code_digit,
				third_code_digit,

				/* Reading headers */
				header_name, // Reading a header's name
				space_after_header_name,
				header_value,

				/* Reading the noun that the server sent (if any) */	
				noun
			};

			State curStat; // Parser's current state
			std::array<short, 3> version; // Current parser/client version
			std::map<std::string, State> stateNames; // Used for debugging
	}; // class RepParser
}; // namespace mpp

#endif // MPP_REPPARSER_HPP

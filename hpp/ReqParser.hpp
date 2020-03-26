#ifndef REQPARSER_HPP
#define REQPARSER_HPP

/* Boost */
#include <boost/tuple/tuple.hpp> // boost::tuple
#include <boost/logic/tribool.hpp> // boost::tribool, boost::indeterminate

/* Our headers */
#include "Request.hpp" // Represents a request

/*
* Parses a request uses a buffer of data obtained by the server.
*/
class ReqParser
{
	public:
		/**
		* Construct ready to parse the request method.
		**/
		void ReqParser();

		/**
		* Reset to initial parser state.
		**/
		void reset();

		template<typename InputIterator>
		boost::tuple<boost::tribool, InputIterator> parse(Request& req, InputIterator begin, InputIterator end)
		{
			while (begin != end)
			{
				boost::tribool res = consume(req, *begin++);
				
				if (res || !res)
				{
					return boost::make_tuple(res, begin);
				}
			}

			boost::tribool res = boost::indeterminate;
			return boost::make_tuple(res, begin);
		}

	private:
		/**
		* @desc Handles the next character of input.
		* @param req The request object to set parameters on.
		* @param input The next character of input.
		**/
		boost::tribool consume(Request& req, wchar_t input);

		enum State
		{
			protocol_name_m = 1, // Expecting 'M' of 'MPP'	
		};

		State curStat; // Current state
};

#endif // REQPARSER_HPP

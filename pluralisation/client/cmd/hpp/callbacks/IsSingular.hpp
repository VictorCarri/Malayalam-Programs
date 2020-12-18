#ifndef MPP_CMD_CLIENT_CALLBACKS_ISSING_HPP
#define MPP_CMD_CLIENT_CALLBACKS_ISSING_HPP

/* STL */
#include <string> // std::string

/* MPP */
#include "mpp/Reply.hpp" // mpp::Reply::Status

namespace callbacks
{
	/**
	* @desc A functor that provides overloaded operator()s that can be called as callbacks in response to an IsSing operation.
	**/
	class IsSingular
	{
		public:
			/**
			* @desc Called if the entire chain of async. ops. for an ISSING request succeeds.
			* @param isSingular True if the noun is singular, false if it's plural.
			* @param noun The noun that was sent to the server.
			**/
			void operator()(bool isSingular, std::string noun);

			/**
			* @desc Error callback for all 4xx codes EXCEPT "Unknown Verb" & "Invalid UTF-8".
			* @param stat The erroneous reply's status.
			* @param param Major, minor, or patch #, or unused if the reply is "Bad Request".
			**/
			void operator()(mpp::Reply::Status stat, short param);

			/**
			* @desc Error callback for codes "Unknown Verb" & "Invalid UTF-8", since these pass string parameters.
			* @param stat The erroneous reply's status.
			* @param param The offending verb or input string.
			**/
			void operator()(mpp::Reply::Status stat, std::string param);
	};
};

#endif // MPP_CMD_CLIENT_CALLBACKS_ISSING_HPP

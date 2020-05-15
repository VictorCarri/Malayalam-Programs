#ifndef MPP_REQHANDLER_HPP
#define MPP_REQHANDLER_HPP

/* Standard C++ */
#include <string> // std::string
#include <array> // std::array

/* Boost */
#include <boost/noncopyable.hpp> // boost::noncopyable
#include <boost/regex.hpp>
#include <boost/regex/icu.hpp> // boost::u32regex

/* MariaDB++ */
#include <mariadb++/account.hpp> // mariadb::account_ref
#include <mariadb++/connection.hpp> // mariadb::connection_ref
#include <mariadb++/statement.hpp> // mariadb::statement_ref

/* Our headers */
#include "mpp/Request.hpp" // Represents a single request
#include "mpp/Reply.hpp" // Represents a single reply
#include "mpp/data/DBInfo.hpp" // Encapsulates DB connection information (username, host, etc.)

namespace mpp
{
	/*
	* Responsible for handling a request. Examines the Request object to determine how to respond, and sets parameters on the Reply object accordingly.
	*/
	class ReqHandler : private boost::noncopyable
	{
		public:
			/**
			* @desc Handles a request and produces a reply. It does this by passing the DB objects to a Noun object, which loads the data from the DB and determines how it
			*	should pluralise/singularise itself.
			* @param req The request object to set parameters on by parsing.
			* @param rep The respnse object to set parameters on to generate a response.
			**/
			void handleReq(const Request& req, Reply& rep);

			/**
			* @desc Constructor. Performs initial setup, specifically:
			*	1) Loads DB info from a config file.
			* 	2) Opens a connection to the DB.
			* @param cfPath The path to the DB config file.
			**/
			ReqHandler(std::string cfPath);

		private:
			/**
			* @desc Acquires the resources needed to communicate with the DB.
			**/
			void openDBConn();

			/**
			* @desc Determines whether or not the given noun is singular.
			*	It first attempts to find the noun in the DB. If it does, it knows that the noun is singular.
			*	If it doesn't find the noun in the DB, it uses regexes to guess at whether or not the noun is singular.
			* @return True if the noun is singular, false otherwise.
			**/
			bool isSingular(std::string noun);

			/**
			* @desc Determines whether or not the given noun exists in the DB. It queries the DB for the noun and checks how many results there are.
			* @return True if the noun is the DB, false otherwise.
			**/
			bool inDB(std::string noun);

			/**
			* @desc Uses regexes to guess at whether or not the noun is singular. One regex is used for each class of singular noun.
			* @return True if any of the regexes for singular Malayalam nouns matches the given noun. False if none match.
			**/
			bool regGuess(std::string noun);

			/* Properties */
			data::DBInfo dbInfo; // Holds information req'd to connect to the DB
			mariadb::account_ref dbAcc; // Pointer to DB account object
			mariadb::connection_ref dbConn; // Pointer to DB connection object
			mariadb::statement_ref nounStmt; // Prepared statement used to query for nouns
			std::array<boost:u32regex, 7> declRegs; // Regexes used to determine which declension category a noun falls into if it doesn't exist in the DB
	};
};

#endif // MPP_REQHANDLER_HPP

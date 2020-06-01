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

// The # of regexes used to guess at a noun's declension
#define NDECLREGS 5

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
			explicit ReqHandler(std::string cfPath);

		private:
			/**
			* @desc Acquires the resources needed to communicate with the DB.
			**/
			void openDBConn();

			/**
			* @desc Determines whether or not the given noun is singular.
			*	It first attempts to find the noun in the DB. If it does, it knows that the noun is singular.
			*	If it doesn't find the noun in the DB, it uses regexes to guess at whether or not the noun is singular.
			* @param noun The Malayalam noun to find the plural of. It must be a UTF-8 encoded string, with codepoints in the range 0xd00 to 0xd7f.
			* @return True if the noun is singular, false otherwise.
			**/
			bool isSingular(std::string noun);

			/**
			* @desc Determines whether or not the given noun exists in the DB. It queries the DB for the noun and checks how many results there are.
			* @param noun The Malayalam noun to find the plural of. It must be a UTF-8 encoded string, with codepoints in the range 0xd00 to 0xd7f.
			* @return True if the noun is the DB, false otherwise.
			**/
			bool inDB(std::string noun);

			/**
			* @desc Uses regexes to guess at whether or not the noun is singular. One regex is used for each class of singular noun.
			* @param noun The Malayalam noun to find the plural of. It must be a UTF-8 encoded string, with codepoints in the range 0xd00 to 0xd7f.
			* @return True if any of the regexes for singular Malayalam nouns matches the given noun. False if none match.
			**/
			bool regGuess(std::string noun);

			/**
			* @desc Searches the DB to see whether or not this noun is pluralisable.
			* @param noun The Malayalam noun to find the plural of. It must be a UTF-8 encoded string, with codepoints in the range 0xd00 to 0xd7f.
			* @return True if the noun is in the DB and has a TRUE 'pluralisable' attribute. False otherwise.
			**/
			bool hasPlural(std::string noun);

			/**
			* @desc Given a SINGULAR noun, finds its plural form.
			* @param noun The SINGULAR noun to find the plural of. The noun ISN'T CHECKED for singularity.
			* @return The plural form of the noun.
			**/
			std::string findPlural(std::string noun);

			/* Properties */
			data::DBInfo dbInfo; // Holds information req'd to connect to the DB
			mariadb::account_ref dbAcc; // Pointer to DB account object
			mariadb::connection_ref dbConn; // Pointer to DB connection object
			mariadb::statement_ref existStmt; // Prepared statement used to check whether a noun is in the DB or not
			mariadb::statement_ref hasPluralStmt; // Prepared statement used to check whether or not a noun is pluralisable
			std::array<boost::u32regex, NDECLREGS> declRegs; // Array of regular expressions for use in determining the noun's declension class
	};
};

#endif // MPP_REQHANDLER_HPP

#ifndef MPP_REQHANDLER_HPP
#define MPP_REQHANDLER_HPP

/* Standard C++ */
#include <string> // std::string
#include <vector> // std::vector

/* Boost */
#include <boost/noncopyable.hpp> // boost::noncopyable
#include <boost/regex.hpp>
#include <boost/regex/icu.hpp> // boost::u32regex
#include <boost/logic/tribool.hpp> // boost::logic::tribool

/* MariaDB++ */
#include <mariadb++/account.hpp> // mariadb::account_ref
#include <mariadb++/connection.hpp> // mariadb::connection_ref
#include <mariadb++/statement.hpp> // mariadb::statement_ref

/* Our headers */
#include "bosmacros/array.hpp" // ARRAY_CLASS macro
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
			* @desc Handles a request and produces a reply. 
			* @param req The request object to get request data from.
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
			/* Types */
			enum Gender // A noun's gender
			{
				Masculine,
				Feminine,
				Neuter,
				Unknown
			};

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
			* @return True if the noun is in the DB and has a TRUE 'pluralisable' attribute, false if the noun has no plural form, indeterminate otherwise.
			**/
			boost::logic::tribool hasPlural(std::string noun);

			/**
			* @desc Given a SINGULAR noun, finds its plural form. A vector is returned because a noun may have multiple plural forms.
			* @param noun The SINGULAR noun to find the plural of. The noun ISN'T CHECKED for singularity.
			* @return The plural form of the noun or all plural forms of the noun.
			**/
			std::vector<std::string> findPlural(std::string noun);

			/**
			* @desc Given a PLURAL noun, determines whether or not it has a corresponding SINGULAR form.
			* @param noun The Malayalam noun to check (UTF-8 encoded, all codepoints in range 0xd00-0xd7f).
			* @return True if the noun has a corresponding singular form, false otherwise.
			**/
			bool hasSingular(std::string noun);

			/**
			* @desc Uses the DB to determine whether or not the given noun is animate.
			* @param noun The noun to check. Malayalam text, encoded in UTF-8.
			* @return True if the noun is animate, false if it isn't, boost::indeterminate if it isn't in the DB.
			**/
			boost::logic::tribool isAnimate(std::string noun);

			/**
			* @desc Uses the DB to determine whether or not the given noun refers to a human.
			* @param noun The noun to check. Malayalam text, encoded in UTF-8.
			* @return True if the noun refers to a human, false if it doesn't, boost::indeterminate if it isn't in the DB.
			**/
			boost::logic::tribool isHuman(std::string noun);

			/**
			* @desc Finds the gender of the given noun.
			* @param noun The noun to fetch the gender of. Malayalam text, encoded in UTF-8.
			* @return An enum value representing the noun's gender (masculine, feminine, or neuter).
			**/
			Gender getGender(std::string noun);

			/**
			* @desc Determines whether or not a noun ends in a vowel.
			* @param noun The noun to check. Must be UTF-8 encoded Malayalam text.
			* @return True if the noun is a vowel stem, false otherwise.
			**/
			bool isVowelStem(std::string noun);

			/**
			* @desc Determines whether or not a noun has an exceptional plural.
			* @param noun The noun to check. Must be UTF-8 encoded Malayalam text.
			* @return True if the noun has an exceptional plural, false if it doesn't, and boost::indeterminate if it isn't in the DB.
			**/
			boost::logic::tribool isException(std::string noun);

			/**
			* @desc Finds the singular form of a noun, given the plural form.
			* @param noun The noun to find the singular form of. Must be UTF-8 encoded Malayalam text.
			* @return 1 or more UTF-8 encoded Malayalam strings containing the noun's singular form(s).
			**/
			std::vector<std::string> findSingular(std::string noun);

			/**
			* @desc Determines whether or not a string contains the plural form of an exceptional noun.
			* @param noun A UTF-8 encoded Malayalam noun which may or may not be the plural form of an exceptional noun.
			* @return True if the noun has an exceptional plural, false if it doesn't, and boost::indeterminate if it isn't in the DB.
			**/
			boost::logic::tribool isExceptionalPlural(std::string noun);

			/* Properties */
			data::DBInfo dbInfo; // Holds information req'd to connect to the DB
			mariadb::account_ref dbAcc; // Pointer to DB account object
			mariadb::connection_ref dbConn; // Pointer to DB connection object
			mariadb::statement_ref existStmt; // Prepared statement used to check whether a noun is in the DB or not
			mariadb::statement_ref hasPluralStmt; // Prepared statement used to check whether or not a noun is pluralisable
			mariadb::statement_ref isAnimateStmt; // Prepared statement used to check whether or not a noun is animate
			mariadb::statement_ref isHumanStmt; // Used to check whether or not a noun refers to a human
			mariadb::statement_ref getGenderStmt; // Used to find a noun's gender
			mariadb::statement_ref exceptionStmt; // Used to determine whether a noun is an exception that has a special plural and what the exceptional plural is
			mariadb::statement_ref exSingStmt; // Used to determine the singular form of an exceptional noun's plural
			ARRAY_CLASS<boost::u32regex, NDECLREGS> declRegs; // Array of regular expressions for use in determining the noun's declension class
			boost::u32regex endsInKaar; // Regex used to check if a noun is a -kaaran/-kaari noun
	};
};

#endif // MPP_REQHANDLER_HPP

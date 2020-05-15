/* C++ Standard Library */
#include <string> // std::string
#include <any> // std::any
#include <sstream> // std::ostringstream
#include <array> // std::array
#include <algorithm> // std::transform

/* Boost */
#include <boost/filesystem.hpp> // boost::filesystem::path
#include <boost/regex.hpp> // boost::smatch
#include <boost/regex/icu.hpp> // boost::make_u32regex, boost::u32regex_match, boost::u32regex

/* MariaDB++ */
#include <mariadb++/account.hpp> // mariadb::account::create
#include <mariadb++/connection.hpp> // mariadb::connection
#include <mariadb++/result_set.hpp> // mariadb::result_set_ref
#include <mariadb++/exceptions.hpp> // mariadb::exception::connection

/* Our headers */
#include "mpp/Request.hpp" // Represents a request
#include "mpp/Reply.hpp" // Represents a reply
#include "mpp/Header.hpp" // Represents a (name, value) pair
#include "mpp/data/DBInfo.hpp" // A class that encapsulates the storage of DB info
#include "mpp/exceptions/DBError.hpp" // Thrown if some sort of error occurs while connecting to the DB
#include "mpp/ReqHandler.hpp" // Class def'n

/**
* @desc Handles a request and produces a reply.
* @param req The request object to set parameters on by parsing.
* @param rep The respnse object to set parameters on to generate a response.
**/
void mpp::ReqHandler::handleReq(const Request& req, Reply& rep)
{
	switch (req.GETCOM_FUNC())
	{
		case Request::FOF: // "F"ind "O"pposite "F"orm
		{
			if (isSingular(req.getNoun()))
			{
				if (hasPlural(req.getNoun())) // Some nouns lack plurals
				{
					rep.setStatus(Reply::pluralForm);
					std::string pluralForm = findPlural(req.getNoun());
					rep.addHeader("Content-Length", std::any(pluralForm.length()));
					rep.setContent(pluralForm); // Send the noun's plural form as UTF-8 text
				}

				else // Need to return an N/A reply
				{
				}
			}

			else
			{
				if (hasSingular(req.getNoun())) // Some nouns lack singular forms
				{
					rep.setStatus(Reply::singularForm);
					std::string singularForm = findPlural(req.getNoun());
					rep.addHeader("Content-Length", std::any(singularForm.length()));
					rep.setContent(singularForm); // Send the noun's singular form as UTF-8 text
				}

				else // Need to return an N/A reply
				{
				}
			}

			break;
		}

		case Request::ISSING: // Determine whether the given noun is singular
		{
			if (isSingular(noun))
			{
				rep.setStatus(Reply::singular);
				rep.setContent(""); // This response has no content
			}

			else // The noun is plural
			{
				rep.setStatus(Reply::plural);
				rep.setContent(""); // No content
			}

			break;
		}

		default: // Invalid command
		{
			break;
		}
	}
}

/**
* @desc Constructor. Performs initial setup, specifically:
*	1) Loads DB info from a config file.
* 	2) Opens a connection to the DB.
* @param cfPath The path to the DB config file.
**/
mpp::ReqHandler::ReqHandler(std::string cfPath) : dbInfo(boost::filesystem::path(cfPath)), // Load DB info from the path or throw an exception
	declRegs { // Set up array of regexes used to guess what declension a noun falls into
		boost::make_u32regex("\\x{d7b}$"), // an-stem
		boost::make_u32regex("\\x{d02}$"), // am-stem
		boost::make_u32regex("\\x{d31}\\x{d4d}$"), // ruh-stem
		boost::make_u32regex("\\x{d1f}\\x{d4d}$"), // duh-stem
		boost::make_u32regex("\\x{d7e}$"), // retroflex l-stem
		boost::make_u32regex("\\x{d4d}$"), // schwa-stem
		boost::make_u32regex("^[\\x{d7a}-\\x{d7f}]$") // Vowel stem - i.e., a noun that <b>doesn't</b> end in a chillu
	}
{
	openDBConn();
}

/**
* @desc Acquires the resources needed to communicate with the DB.
**/
void mpp::ReqHandler::openDBConn()
{
	dbAcc = mariadb::account::create(dbInfo.getHost(), dbInfo.getUser(), dbInfo.getPassword(), dbInfo.getDBName()); // Create a reference to the account, and open the DB we need on connection
	dbConn = mariadb::connection::create(acc); // Create a reference to a connection to the DB using our account info
	dbConn->set_charset("utf8"); // Ensure that Malayalam nouns are fetched properly
	dbConn->connect(); // Actually open the connection

	if (!dbConn->connected())
	{
		mpp::exceptions::DBError ex("mpp::ReqHandler::openDBConn: Couldn\'t connect to DB!");
		throw ex;
	}

	nounStmt = dbConn->create_statement("SELECT * FROM nouns WHERE noun='?'"); // Prepare the statement to use
}

/**
* @desc Determines whether or not the given noun is singular.
*	It first attempts to find the noun in the DB. If it does, it knows that the noun is singular.
*	If it doesn't find the noun in the DB, it uses regexes to guess at whether or not the noun is singular.
* @return True if the noun is singular, false otherwise.
**/
bool mpp::ReqHandler::isSingular(std::string noun)
{
	return inDB(noun) || regGuess(noun);
}

/**
* @desc Determines whether or not the given noun exists in the DB. It queries the DB for the noun and checks how many results there are.
* @return True if the noun is the DB, false otherwise.
**/
bool mpp::ReqHandler::inDB(std::string noun)
{
	mariadb::u64 nRowsAff; // # of rows affected by the query. If == 1, the noun is in the DB.
 	nounStmt->set_string(0, noun); // Load the noun into the query to make

	try
	{
		nRowsAff = nounStmt->execute(); // We don't care about the results, we just need the # of rows affected by the query
		return (nRowsAff == 1);
	}

	catch (mariadb::exception::connection& mece)
	{
		std::ostringstream ess;
		ess << "mpp::ReqHandler::inDB: caught MariaDB connection exception while trying to execute query" << std::endl
		<< "\tSELECT * FROM nouns WHERE noun='" << noun << "'" << std::endl
		<< "Exception: " << mece.what() << std::endl;
		mpp::exceptions::DBError ex(ess.what();
		throw ex;
	}
}

/**
* @desc Uses regexes to guess at whether or not the noun is singular. One regex is used for each class of singular noun.
* @return True if any of the regexes for singular Malayalam nouns matches the given noun. False if none match.
**/
bool mpp::ReqHandler::regGuess(std::string noun)
{
	std::array<bool, 7> matchRes; // Holds whether or not each singular regex matched the noun
	std::array<boost::smatch, 7> what; // Holds what matched (unused, but a necessary parameter for boost::u32regex_match

	std::transform(declRegs.cbegin(), declRegs.cend(), what.begin(), matchRes.begin(),
		[&](const boost::u32regex& reg, boost::smatch& whatMatched) -> bool // Check whether the current regex matches the noun. Store the match results (ignored) in what, and the boolean in matchRes.
		{
			return boost::u32regex_match(noun, whatMatched, reg); // Attempt to match this regex
		}
	);
}

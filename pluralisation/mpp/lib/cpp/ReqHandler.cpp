/* C++ Standard Library */
#include <string> // std::string
#include <any> // std::any
#include <sstream> // std::ostringstream
#include <array> // std::array
#include <algorithm> // std::transform
#include <numeric> // std::accumulate
#include <functional> // std::logical_or
#include <stdexcept> // std::out_of_range
#ifdef DEBUG
#include <iostream> // std::cout
#include <iomanip> // std::quoted
#include <ios> // std::boolalpha, std::noboolalpha
#endif

/* Boost */
#include <boost/filesystem.hpp> // boost::filesystem::path
#include <boost/regex.hpp> // boost::smatch
#include <boost/regex/icu.hpp> // boost::make_u32regex, boost::u32regex_match, boost::u32regex

/* MariaDB++ */
#include <mariadb++/account.hpp> // mariadb::account::create
#include <mariadb++/connection.hpp> // mariadb::connection::create
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
			if (isSingular(req.getNoun())) // Need to find the plural (if it exists)
			{
				if (hasPlural(req.getNoun())) // The noun is pluralisable
				{
					std::string pluralForm = findPlural(req.getNoun());
					rep.setStatus(Reply::pluralForm); // Set the right code
					rep.addHeader("Content-Type", std::any(std::string("UTF-8")));
					rep.addHeader("Content-Length", std::any(pluralForm.length()));
					rep.setContent(pluralForm);
				}

				else // The noun isn't pluralisable
				{
					rep.setStatus(Reply::noPlural);
					rep.addHeader("Content-Type", std::any(std::string("UTF-8")));
					rep.addHeader("Content-Length", std::any(0));
					rep.setContent("");
				}
			}

			else // Need to find the singular (if it exists)
			{
				if (hasSingular(req.getNoun())) // The noun is singularisable
				{
				}

				else // The noun isn't singularisable
				{
					rep.setStatus(Reply::noSingular);
					rep.addHeader("Content-Type", std::any(std::string("UTF-8")));
					rep.addHeader("Content-Length", std::any(0));
					rep.setContent("");
				}
			}

			break;
		}

		case Request::ISSING: // Determine whether the given noun is singular
		{
			#ifdef DEBUG
			std::cout << "mpp::ReqHandler::handleReq: checking whether " << std::quoted(req.getNoun()) << " is singular" << std::endl;
			#endif

			rep.addHeader("Content-Type", std::any(std::string("UTF-8")));
			rep.addHeader("Content-Length", std::any(0));

			if (isSingular(req.getNoun()))
			{
				#ifdef DEBUG
				std::cout << "mpp::ReqHandler::handleReq: " << std::quoted(req.getNoun()) << " is singular" << std::endl;
				#endif
				rep.setStatus(Reply::singular);
				rep.setContent(""); // This response has no content
			}

			else // The noun is plural
			{
				#ifdef DEBUG
				std::cout << "mpp::ReqHandler::handleReq: " << std::quoted(req.getNoun()) << " is plural" << std::endl;
				#endif
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
		boost::make_u32regex(".*\\x{d7b}$"), // an-stem
		boost::make_u32regex(".*\\x{d02}$"), // am-stem
		boost::make_u32regex(".*\\x{d31}\\x{d4d}$"), // ruh-stem
		boost::make_u32regex(".*\\x{d1f}\\x{d4d}$"), // duh-stem
		boost::make_u32regex(".*\\x{d4d}$"), // schwa-stem
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
	#ifdef DEBUG
	std::cout << "mpp::ReqHandler::openDBConn: created a reference to my account" << std::endl;
	#endif
	dbConn = mariadb::connection::create(dbAcc); // Create a reference to a connection to the DB using our account info
	#ifdef DEBUG
	std::cout << "mpp::ReqHandler::openDBConn: created a reference to a connection to my account" << std::endl;
	#endif
	dbConn->set_charset("utf8"); // Ensure that Malayalam nouns are fetched properly
	#ifdef DEBUG
	std::cout << "mpp::ReqHandler::openDBConn: set connection's character set to UTF-8" << std::endl;
	#endif
	dbConn->connect(); // Actually open the connection
	#ifdef DEBUG
	std::cout << "mpp::ReqHandler::openDBConn: opened the connection" << std::endl;
	#endif

	if (!dbConn->connected())
	{
		mpp::exceptions::DBError ex(std::string("mpp::ReqHandler::openDBConn: Couldn't connect to DB!"));
		throw ex;
	}

	existStmt = dbConn->create_statement("SELECT * FROM nouns WHERE noun=?"); // Prepare the statement used when checking whether or not a noun exists in the DB
	#ifdef DEBUG
	std::cout << "mpp::ReqHandler::openDBConn: created the statement used to check whether or not a noun exists in the DB" << std::endl;
	#endif
	hasPluralStmt = dbConn->create_statement("SELECT nouns.id,pluralisableNouns.pluralisable FROM nouns JOIN pluralisableNouns ON nouns.id=pluralisableNouns.id WHERE nouns.noun=?"); // Prepare the statement used when checking whether or not a noun is pluralisable
	#ifdef DEBUG
	std::cout << "mpp::ReqHandler::openDBConn: created the statement used to check whether or not a noun is pluralisable" << std::endl;
	#endif
}

/**
* @desc Determines whether or not the given noun is singular.
*	It first attempts to find the noun in the DB. If it does, it knows that the noun is singular.
*	If it doesn't find the noun in the DB, it uses regexes to guess at whether or not the noun is singular.
* @param noun The noun to check, encoded in UTF-8.
* @return True if the noun is singular, false otherwise.
**/
bool mpp::ReqHandler::isSingular(std::string noun)
{
	bool isInDB = inDB(noun);
	bool regMatched = regGuess(noun);

	#ifdef DEBUG
	std::cout << "mpp::ReqHandler::isSingular: noun " << std::quoted(noun) << " is" << (isInDB ? "" : "n't") << " in the DB" << std::endl;
	std::cout << "mpp::ReqHandler::isSingular: noun " << std::quoted(noun);

	if (regMatched)
	{
		std::cout << " matched one of the singular regexes." << std::endl;
	}
	
	else
	{
		std::cout << " matched none of the singular regexes." << std::endl;
	}
	#endif	

	return isInDB || regMatched;
}

/**
* @desc Determines whether or not the given noun exists in the DB. It queries the DB for the noun and checks how many results there are.
* @param noun The noun to check, encoded in UTF-8.
* @return True if the noun is the DB, false otherwise.
**/
bool mpp::ReqHandler::inDB(std::string noun)
{
	mariadb::u64 nRowsAff; // # of rows affected by the query. If == 1, the noun is in the DB.
	bool toReturn;
	int fno = 0; // Field # to load noun into in prepared statement
	#ifdef DEBUG
	std::cout << "mpp::ReqHandler::inDB: field # = " << fno << std::endl;
	#endif

	try
	{
 		existStmt->set_string(fno, noun); // Load the noun into the query to make
		//nRowsAff = existStmt->execute(); // We don't care about the results, we just need the # of rows affected by the query
		mariadb::result_set_ref results = existStmt->query();
		nRowsAff = results->row_count();
		#ifdef DEBUG
		std::cout << "mpp::ReqHandler::inDB: # of rows affected by existence query was " << nRowsAff << std::endl;
		#endif
		toReturn = (nRowsAff == 1);
		#ifdef DEBUG
		std::cout << "mpp::ReqHandler::inDB: nRowsAff";

		if (nRowsAff == 1)
		{
			std::cout << " == 1";
		}

		else
		{
			std::cout << " != 1";
		}
	
		std::cout << ", returning " << std::boolalpha << toReturn << std::noboolalpha << std::endl;
		#endif
	}

	catch (mariadb::exception::connection& mece)
	{
		std::ostringstream ess;
		ess << "mpp::ReqHandler::inDB: caught MariaDB connection exception while trying to execute query" << std::endl
		<< "\tSELECT * FROM nouns WHERE noun='" << noun << "'" << std::endl
		<< "Exception: " << mece.what() << std::endl;
		mpp::exceptions::DBError ex(ess.str());
		throw ex;
	}

	catch (std::out_of_range& stdoore)
	{
		std::ostringstream ess;
		ess << "mpp::ReqHandler::inDB: caught out of range exception while trying to execute query" << std::endl
		<< "\tSELECT COUNT(*) FROM nouns WHERE noun='" << noun << "'" << std::endl
		<< "Exception: " << stdoore.what() << std::endl;
		mpp::exceptions::DBError ex(ess.str());
		throw ex;
	}

	return toReturn;
}

/**
* @desc Uses regexes to guess at whether or not the noun is singular. One regex is used for each class of singular noun.
* @param noun The noun to check, encoded in UTF-8.
* @return True if any of the regexes for singular Malayalam nouns matches the given noun. False if none match.
**/
bool mpp::ReqHandler::regGuess(std::string noun)
{
	std::array<bool, NDECLREGS+2> matchRes; // Holds whether or not each singular regex matched the noun
	std::array<boost::smatch, NDECLREGS+4> what; // Holds what matched (unused, but a necessary parameter for boost::u32regex_match
	#ifdef DEBUG
	unsigned short regNum = 1; // Regex #, for printing
	#endif

	std::transform(declRegs.cbegin(), declRegs.cend(), what.begin(), matchRes.begin(),
		[&](const boost::u32regex& reg, boost::smatch& whatMatched) -> bool // Check whether the current regex matches the noun. Store the match results (ignored) in what, and the boolean in matchRes.
		{
			bool toReturn = boost::u32regex_match(noun, whatMatched, reg); // Attempt to match this regex
			#ifdef DEBUG
			std::cout << "mpp::ReqHandler::regGuess: lambda 1: regex #" << regNum << (toReturn ? " matched" : " didn't match") << " noun " << std::quoted(noun) << std::endl;
			++regNum;
			#endif
			return toReturn;
		}
	);
	 
	matchRes.at(matchRes.size()-2) = boost::u32regex_match(noun, what.at(what.size()-4), boost::make_u32regex(".*\\x{d7e}$")) && !boost::u32regex_match(noun, what.at(what.size()-3), boost::make_u32regex(".*\\x{d15}\\x{d7e}$")); // Retroflex l-stems are a special case, since we need to distinguish a plural -കൾ suffix from a singular noun that ends in -ൾ . Thus, we look for a match with a regex that ends in ൾ, and a non-match with a regex that matches a final -കൾ
	
	#ifdef DEBUG
	if (matchRes.at(matchRes.size()-2))
	{
		std::cout << "mpp::ReqHandler::regGuess: found a retroflex l-stem (ends in -ൾ but not in -കൾ)" << std::endl;
	}

	else
	{
		std::cout << "mpp::ReqHandler::RegGuess: didn't find a retroflex l-stem" << std::endl;
	}
	#endif

	matchRes.back() = boost::u32regex_match(noun, what.at(what.size()-2), boost::make_u32regex(".*[^\\x{d7a}-\\x{d7f}]$")) && !boost::u32regex_match(noun, what.back(), boost::make_u32regex(".*\\x{d4d}$")); // A vowel-stem must NOT end in a chillu AND must NOT end in a schwa

	#ifdef DEBUG
	if (matchRes.back())
	{
		std::cout << "mpp::ReqHandler::regGuess: found a vowel-stem (doesn't end with a chillu or a schwa)" << std::endl;
	}

	else
	{
		std::cout << "mpp::ReqHandler::RegGuess: didn't find a vowel-stem (noun ends in a chillu or a schwa)" << std::endl;
	}
	#endif

	return std::accumulate(matchRes.cbegin(), matchRes.cend(), false, std::logical_or{}); // OR will be true if any regex matched
}

/**
* @desc Searches the DB to see whether or not this noun is pluralisable.
* @param noun The noun to check, encoded in UTF-8.
* @return True if the noun is in the DB and has a TRUE 'pluralisable' attribute. False otherwise.
**/
bool mpp::ReqHandler::hasPlural(std::string noun)
{
	bool toReturn = true;

	if (inDB(noun)) // We can check whether or not this noun is pluralisable, since it's in the DB
	{
		#ifdef DEBUG
		std::cout << "mpp::ReqHandler::hasPlural: noun " << std::quoted(noun) << " is in the DB" << std::endl;
		#endif
		hasPluralStmt->set_string(0, noun); // Load the noun into the prepared statement

		try
		{
			mariadb::result_set_ref qRes = hasPluralStmt->query(); // Run the query
			
			while (qRes->next())
			{
				#ifdef DEBUG
				std::cout << "mpp::ReqHandler::hasPlural->if->try->while: current noun is" << (qRes->get_boolean("pluralisable") ? "" : "n't") << " pluralisable" << std::endl;
				#endif
				toReturn = toReturn && qRes->get_boolean("pluralisable");
			}
		}

		catch (mariadb::exception::connection& mece)
		{
			std::ostringstream ess;
			ess << "mpp::ReqHandler::hasPlural: caught MariaDB connection exception while trying to execute query" << std::endl
			<< "\tSELECT pluralisable FROM nouns WHERE noun='" << noun << "'" << std::endl
			<< "Exception: " << mece.what() << std::endl;
			mpp::exceptions::DBError ex(ess.str());
			throw ex;
		}
	}

	else // Unknown - assume false
	{
		#ifdef DEBUG
		std::cout << "mpp::ReqHandler::hasPlural: noun " << std::quoted(noun) << " isn't in the DB, so I'll assume that it isn't pluralisable" << std::endl;
		#endif
		toReturn = false;
	}

	return toReturn;
}

/**
* @desc Given a SINGULAR noun, finds its plural form.
* @param noun The SINGULAR noun to find the plural of. The noun ISN'T CHECKED for singularity.
* @return The plural form of the noun.
**/
std::string mpp::ReqHandler::findPlural(std::string noun)
{
}

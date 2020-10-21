/* C++ Standard Library */
#include <string> // std::string
#include <sstream> // std::ostringstream
#include <algorithm> // std::transform, std::for_each
#include <numeric> // std::accumulate
#include <functional> // std::logical_or
#include <stdexcept> // std::out_of_range
#include <vector> // std::vector
#include <iomanip> // std::quoted
#include <ios> // std::boolalpha, std::noboolalpha
#ifdef DEBUG
#include <iostream> // std::cout
#endif

/* Boost */
#include <boost/regex.hpp> // boost::smatch
#include <boost/regex/icu.hpp> // boost::make_u32regex, boost::u32regex_match, boost::u32regex
#include <boost/logic/tribool_fwd.hpp> // boost::logic::tribool fwd declarations
#include <boost/logic/tribool.hpp> // boost::logic::tribool
#include <boost/logic/tribool_io.hpp> // operator<< def'ns for boost::logic::tribool

/* MariaDB++ */
#include <mariadb++/account.hpp> // mariadb::account::create, mariadb::account_ref
#include <mariadb++/connection.hpp> // mariadb::connection::create
#include <mariadb++/result_set.hpp> // mariadb::result_set_ref
#include <mariadb++/exceptions.hpp> // mariadb::exception::connection

/* Our headers */
#include "bosmacros/array.hpp" // ARRAY_CLASS macro
#include "mpp/Request.hpp" // Represents a request
#include "mpp/Reply.hpp" // Represents a reply
#include "mpp/Header.hpp" // Represents a (name, value) pair
#include "mpp/data/DBInfo.hpp" // A class that encapsulates the storage of DB info
#include "mpp/exceptions/DBError.hpp" // Thrown if some sort of error occurs while connecting to the DB
#include "mpp/exceptions/UnknownNoun.hpp" // Thrown if a noun doesn't exist in the DB, and the method which throws it expected it to exist
#include "mpp/ReqHandler.hpp" // Class def'n

/**
* @desc Handles a request and produces a reply.
* @param req The request object to get request data from.
* @param rep The respnse object to set parameters on to generate a response.
**/
void mpp::ReqHandler::handleReq(const mpp::Request& req, mpp::Reply& rep)
{
	std::string utf8Text("text/utf-8"); // Initialise the string once instead of using several temporaries
	int zeroLengthInd = 0;

	switch (req.GETCOM_FUNC()) // Check what type of request it is
	{
		case Request::FOF: // "F"ind "O"pposite "F"orm
		{
			if (isSingular(req.getNoun())) // Need to find the plural (if it exists)
			{
				#ifdef DEBUG
				std::cout << "mpp::ReqHandler::handleReq::FOF: noun " << std::quoted(req.getNoun()) << " is singular, so we shall find its plural." << std::endl;
				#endif

				if (hasPlural(req.getNoun()) == true) // The noun is pluralisable
				{
					#ifdef DEBUG
					std::cout << "mpp::ReqHandler::handleReq::FOF: noun " << std::quoted(req.getNoun()) << " is pluralisable." << std::endl;
					#endif

					std::vector<std::string> pluralForms = findPlural(req.getNoun());
					#ifdef DEBUG
					std::cout << "mpp::ReqHandler::handleReq::FOF: # of plural forms found = " << pluralForms.size() << std::endl;
					#endif
				
					if (pluralForms.size() > 1) // There's > 1 possible plural
					{
						#ifdef DEBUG
						std::cout << "mpp::ReqHAndler::handleReq::FOF: possible plurals of " << std::quoted(req.getNoun()) << " are: " << std::endl << std::endl;
						int pno = 1;

						for (std::string form : pluralForms)
						{
							std::cout << pno << ")\t" << form << std::endl;
							++pno;
						}
						#endif

						rep.setStatus(Reply::pluralForm);
						rep.addHeader("Content-Type", utf8Text);
						std::ostringstream pfStrm;
						char delim = ';';
						std::for_each(pluralForms.cbegin(), pluralForms.cend()-1, [&](std::string form)
							{
								pfStrm << form << delim;
							}
						);
						pfStrm << pluralForms.back();
						rep.addHeader("Content-Length", pfStrm.str().length());
						rep.addHeader("Delimiter", delim);
						#ifdef DEBUG
						std::cout << "mpp::ReqHandler::handleReq::FOF:> 1 plural: content = " << std::quoted(pfStrm.str()) << std::endl;
						#endif
						rep.setContent(pfStrm.str());
					}

					else // Only 1 possible plural
					{
						rep.setStatus(Reply::pluralForm); // Set the right code
						rep.addHeader("Content-Type", utf8Text);
						rep.addHeader("Content-Length", pluralForms.front().length());
						#ifdef DEBUG
						std::cout << "mpp::ReqHandler::handleReq::FOF:only 1 plural: content = " << std::quoted(pluralForms.front()) << std::endl;
						#endif
						rep.setContent(pluralForms.front());
					}
				}

				else // The noun isn't pluralisable
				{
					rep.setStatus(Reply::noPlural);
					rep.addHeader("Content-Type", utf8Text);
					rep.addHeader("Content-Length", zeroLengthInd);
					rep.setContent("");
					#ifdef DEBUG
					std::cout << "mpp::ReqHandler::handleReq::FOF: the noun " << std::quoted(req.getNoun()) << " isn't pluralisable." << std::endl;
					#endif
				}
			}

			else // Need to find the singular (if it exists)
			{
				#ifdef DEBUG
				std::cout << "mpp::ReqHandler::handleReq::FOF: noun " << std::quoted(req.getNoun()) << " is plural, so we shall find its singular." << std::endl;
				#endif

				if (hasSingular(req.getNoun())) // The noun is singularisable
				{
					#ifdef DEBUG
					std::cout << "mpp::ReqHandler::handleReq::FOF: the noun " << std::quoted(req.getNoun()) << " is singularisable." << std::endl;
					#endif
					std::vector<std::string> singularForms = findSingular(req.getNoun());
					#ifdef DEBUG
					std::cout << "mpp::ReqHandler::handleReq::FOF: # of singular forms found = " << singularForms.size() << std::endl;
					#endif

					if (singularForms.size() == 1) // Only 1 singular form
					{
						std::string singularForm = singularForms.front();
						rep.setStatus(Reply::singularForm);
						rep.addHeader("Content-Type", utf8Text);
						rep.addHeader("Content-Length", singularForm.length());
						#ifdef DEBUG
						std::cout << "mpp::ReqHandler::handleReq::FOF: content = " << std::quoted(singularForm) << std::endl;
						#endif
						rep.setContent(singularForm);
					}

					else // Several possible singular forms
					{
						#ifdef DEBUG
						std::cout << "mpp::ReqHAndler::handleReq::FOF: possible singular forms of " << std::quoted(req.getNoun()) << " are: " << std::endl << std::endl;
						int pno = 1;

						for (std::string form : singularForms)
						{
							std::cout << pno << ")\t" << form << std::endl;
							++pno;
						}
						#endif

						rep.setStatus(Reply::singularForm);
						rep.addHeader("Content-Type", utf8Text);
						std::ostringstream sfsStrm;
						char delim = ';';
						std::for_each(singularForms.cbegin(), singularForms.cend()-1, [&](std::string form)
							{
								sfsStrm << form << delim;
							}
						);
						sfsStrm << singularForms.back();
						rep.addHeader("Content-Length", sfsStrm.str().length());
						rep.addHeader("Delimiter", delim);
						#ifdef DEBUG
						std::cout << "mpp::ReqHandler::handleReq::FOF:> 1 singular form: content = " << std::quoted(sfsStrm.str()) << std::endl;
						#endif
						rep.setContent(sfsStrm.str());
					}
				}

				else // The noun isn't singularisable
				{
					#ifdef DEBUG
					std::cout << "mpp::ReqHandler::handleReq::FOF: the noun " << std::quoted(req.getNoun()) << " isn't singularisable." << std::endl;
					#endif
					rep.setStatus(Reply::noSingular);
					rep.addHeader("Content-Type", utf8Text);
					rep.addHeader("Content-Length", zeroLengthInd);
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

			rep.addHeader("Content-Type", utf8Text);
			rep.addHeader("Content-Length", zeroLengthInd);

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
mpp::ReqHandler::ReqHandler(std::string cfPath) : dbInfo(cfPath), // Load DB info from the path or throw an exception
	declRegs { // Set up array of regexes used to guess what declension a noun falls into
		boost::make_u32regex(".*\\x{d7b}$"), // an-stem
		boost::make_u32regex(".*\\x{d02}$"), // am-stem
		boost::make_u32regex(".*\\x{d31}\\x{d4d}$"), // ruh-stem
		boost::make_u32regex(".*\\x{d1f}\\x{d4d}$"), // duh-stem
		boost::make_u32regex(".*\\x{d4d}$"), // schwa-stem
	}
{
	endsInKaar = boost::make_u32regex(".*\\x{d15}\\x{d3e}\\x{d30}(\\x{d7b}|\\x{d3f})$"); // A regex that matches -കാരൻ or -കാരി
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

	isAnimateStmt = dbConn->create_statement("SELECT nouns.*,animacies.animate FROM nouns LEFT JOIN animacies ON animacies.id=nouns.id WHERE nouns.noun=?"); // Prepare the statement used to check whether or not a noun is animate
	#ifdef DEBUG
	std::cout << "mpp::ReqHandler::openDBConn: created the statement used to check whether or not a noun is animate" << std::endl;
	#endif

	isHumanStmt = dbConn->create_statement("SELECT nouns.*,humanNouns.humanity FROM nouns LEFT JOIN humanNouns ON humanNouns.id=nouns.id WHERE nouns.noun=?"); // Prepare the statement used to check whether or not a noun refers to a human
	#ifdef DEBUG
	std::cout << "mpp::ReqHandler::openDBConn: created the statement used to check whether or not a noun is animate" << std::endl;
	#endif

	getGenderStmt = dbConn->create_statement("SELECT nouns.id,genders.gender FROM nouns JOIN genders ON nouns.id=genders.id WHERE nouns.noun=?"); // Prepare the statement used to fetch a noun's gender
	#ifdef DEBUG
	std::cout << "mpp::ReqHandler::openDBConn:: created the statement used to find a noun's gender." << std::endl;
	#endif

	exceptionStmt = dbConn->create_statement("SELECT nouns.id,nouns.noun,exceptions.plural FROM nouns JOIN exceptions ON exceptions.nid=nouns.id WHERE nouns.noun=?"); // Prepare the statement used to fetch the plural of exceptional nouns
	#ifdef DEBUG
	std::cout << "mpp::ReqHandler::openDBConn: created statement used to fetch plural of exceptional nouns." << std::endl;
	#endif

	exSingStmt = dbConn->create_statement("SELECT * FROM nouns WHERE nouns.id IN (SELECT nid FROM exceptions WHERE exceptions.plural=?)"); // Create the statement used to check whether a plural is that of an exceptional noun
	#ifdef DEBUG
	std::cout << "mpp::ReqHandler::openDBConn: created statement used to fetch the singular form of an exceptional noun." << std::endl;
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
* @desc Determines whether or not the given singular noun exists in the DB. It queries the DB for the noun and checks how many results there are.
* @param noun The singular noun to check, encoded in UTF-8.
* @return True if the singular noun is the DB, false otherwise.
**/
bool mpp::ReqHandler::inDB(std::string noun)
{
	mariadb::u64 nRowsAff; // # of rows affected by the query. If == 1, the noun is in the DB.
	bool toReturn = false; // Assume that it isn't in by default - which'll be true more often than not
	int fno = 0; // Field # to load noun into in prepared statement

	openDBConn(); // Open a connection for this call

	#ifdef DEBUG
	std::cout << "mpp::ReqHandler::inDB: noun to check is " << std::quoted(noun) << std::endl
	<< "\tfield # = " << fno << std::endl;
	#endif

	try
	{
 		existStmt->set_string(fno, noun); // Load the noun into the query to make
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
	/*	std::ostringstream ess;
		ess << "mpp::ReqHandler::inDB: caught MariaDB connection exception while trying to execute query" << std::endl
		<< "\tSELECT * FROM nouns WHERE noun=" << std::quoted(noun, '\'') << std::endl
		<< "Exception: " << mece.what() << std::endl;
		mpp::exceptions::DBError ex(ess.str());
		throw ex;*/

		try
		{
			openDBConn(); // Re-open the connection
		}

		catch (std::exception& secondEx) // Bail out if we can't re-establish the connection
		{
			std::ostringstream ess;
			ess << "mpp::ReqHandler::inDB: caught MariaDB connection exception after failing to re-open the DB connection for a second time" << std::endl
			<< "\tException: " << secondEx.what() << std::endl;
			mpp::exceptions::DBError ex(ess.str());
			throw ex;
		}
	}

	catch (std::out_of_range& stdoore)
	{
		std::ostringstream ess;
		ess << "mpp::ReqHandler::inDB: caught out of range exception while trying to execute query" << std::endl
		<< "\tSELECT COUNT(*) FROM nouns WHERE noun=" << std::quoted(noun, '\'') << std::endl
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
	ARRAY_CLASS<bool, NDECLREGS+2> matchRes; // Holds whether or not each singular regex matched the noun
	ARRAY_CLASS<boost::smatch, NDECLREGS+2> what; // Holds what matched (unused, but a necessary parameter for boost::u32regex_match
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
	 
	matchRes.at(matchRes.size()-1) = boost::u32regex_match(noun, what.at(what.size()-1), boost::make_u32regex(".*\\x{d7e}$")) && !boost::u32regex_match(noun, what.back(), boost::make_u32regex(".*\\x{d15}\\x{d7e}$")); // Retroflex l-stems are a special case, since we need to distinguish a plural -കൾ suffix from a singular noun that ends in -ൾ . Thus, we look for a match with a regex that ends in ൾ, and a non-match with a regex that matches a final -കൾ
	
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

	matchRes.back() = isVowelStem(noun);

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
* @param noun The Malayalam noun to find the plural of. It must be a UTF-8 encoded string, with codepoints in the range 0xd00 to 0xd7f.
* @return True if the noun is in the DB and has a TRUE 'pluralisable' attribute, false if the noun has no plural form, indeterminate otherwise.
**/
boost::logic::tribool mpp::ReqHandler::hasPlural(std::string noun)
{
	boost::logic::tribool toReturn = true;

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
			<< "\tSELECT pluralisable FROM nouns WHERE noun=" << std::quoted(noun, '\'') << std::endl
			<< "Exception: " << mece.what() << std::endl;
			mpp::exceptions::DBError ex(ess.str());
			throw ex;
		}
	}

	else // Unknown
	{
		#ifdef DEBUG
		std::cout << "mpp::ReqHandler::hasPlural: noun " << std::quoted(noun) << u8" isn't in the DB. Checking whether or not it's \u0d2a\u0d47\u0d7c" << std::endl;
		#endif

		toReturn = (noun != u8"\u0d2a\u0d47\u0d7c"); // Only the noun പേർ lacks a plural
	}

	return toReturn;
}

/**
* @desc Given a SINGULAR noun, finds its plural form. A vector is returned because a noun may have multiple plural forms.
* @param noun The SINGULAR noun to find the plural of. The noun ISN'T CHECKED for singularity.
* @return The plural form of the noun or all plural forms of the noun.
**/
std::vector<std::string> mpp::ReqHandler::findPlural(std::string noun)
{
	std::vector<std::string> toReturn;
	ARRAY_CLASS<boost::smatch, 2> what; // Holds what matched a regex. Unused - only used as a dummy parameter
	boost::u32regex endsInLongA = boost::make_u32regex(".*\\x{d3e}$"); // A noun that ends in /a:/
	boost::u32regex endsInSyllabicR = boost::make_u32regex(".*\\x{d43}$"); // A noun that ends in a short syllabic /r/
	boost::logic::tribool isH = isHuman(noun);
	boost::logic::tribool isE = isException(noun);

	if (isE == true) // This noun has an exceptional plural
	{
		#ifdef DEBUG
		std::cout << "mpp::ReqHandler::findPlural: the noun " << std::quoted(noun) << " has an exceptional plural" << std::endl;
		#endif
		exceptionStmt->set_string(0, noun); // Load the noun into the string

		try
		{
			mariadb::result_set_ref qRes = exceptionStmt->query(); // Find its plural using the prepared statement
			#ifdef DEBUG
			std::cout << "mpp::ReqHandler::findPlural: # of results = " << qRes->row_count() << std::endl;
			#endif

			while (qRes->next())
			{
				std::string pluralForm = qRes->get_string("plural");
				toReturn.push_back(pluralForm); // Find the noun's plural and store it
				#ifdef DEBUG
				std::cout << "mpp::ReqHandler::findPlural: isH: isE: try: while: added plural form " << std::quoted(pluralForm) << std::endl;
				#endif
			}
		}

		catch (mariadb::exception::connection& mece)
		{
			std::ostringstream ess;
			ess << "mpp::ReqHandler::findPlural: exceptional noun with human referent check: caught connection error\n"
			<< "\t" << mece.what() << "\n";
			mpp::exceptions::DBError ex(ess.str());
			throw ex;
		}
	}

	else // This noun has a regular plural
	{
		if (isH == true) // This noun has a human referent
		{
			#ifdef DEBUG
			std::cout << "mpp::ReqHandler::findPlural: the noun " << std::quoted(noun) << " has a human referent" << std::endl;
			#endif
	
			Gender g = getGender(noun); // The plural form depends on the noun's gender

			switch (g)
			{
				case Masculine:
				{
					#ifdef DEBUG
					std::cout << "mpp::ReqHandler::findPlural: isH: the noun " << std::quoted(noun) << " is masculine." << std::endl;
					#endif

					if (boost::u32regex_match(noun, what[0], endsInLongA) || boost::u32regex_match(noun, what[1], endsInSyllabicR)) // Add the suffix -ക്കൾ
					{
						toReturn.push_back(noun + u8"\u0d15\u0d4d\u0d15\u0d7e");
					}
	
					else if (boost::u32regex_match(noun, endsInKaar)) // This must be a -kaaran noun, since getGender already identified it as masculine
					{
						toReturn.push_back(noun + u8"\u0d2e\u0d3e\u0d7c"); // One possible plural is a -maar form
						toReturn.push_back(boost::u32regex_replace(noun, boost::make_u32regex("(.*)\\x{d30}\\x{d7b}"), u8"$1\u0d7c")); // Replace final -ran with chillu -r
					}
	
					else // All other masculine nouns
					{
						toReturn.push_back(noun + u8"\u0d2e\u0d3e\u0d7c"); // Add the suffix -മാർ
					}
			
					break;
				} // case Masculine
	
				case Feminine:
				{
					#ifdef DEBUG
					std::cout << "mpp::ReqHandler::findPlural: isH: the noun " << std::quoted(noun) << " is feminine." << std::endl;
					#endif

					boost::u32regex endsInA = boost::make_u32regex(".*[\\x{d15}-\\x{d3a}]$"); // Any noun that ends in a consonant that has no vowel sign after it ends in an /a/, since /a/ is the default vowel
					boost::u32regex endsInShortI = boost::make_u32regex(".*\\x{d3f}$"); // A noun that ends in /i/
	
					if (boost::u32regex_match(noun, what[0], endsInA))
					{
						toReturn.push_back(noun + u8"\u0d2e\u0d3e\u0d7c"); // Add the suffix -maar
					}
	
					else if (boost::u32regex_match(noun, what[0], endsInShortI)) // These nouns can take either -maar or -kaL
					{
						toReturn.push_back(noun + u8"\u0d2e\u0d3e\u0d7c"); // Add the suffix -മാർ
						toReturn.push_back(noun + u8"\u0d15\u0d7e"); // Add the suffix -കൾ
					}
	
					else if (boost::u32regex_match(noun, endsInKaar)) // This must be a -kaari noun, since getGender already identified it as feminine
					{
						toReturn.push_back(noun + u8"\u0d2e\u0d3e\u0d7c"); // One possible plural is a -maar form
						toReturn.push_back(boost::u32regex_replace(noun, boost::make_u32regex("\\x{d30}\\x{d3f}"), u8"\u0d7c")); // Replace final -ri with chillu -r
					}
	
					else if (boost::u32regex_match(noun, what[0], endsInLongA) || boost::u32regex_match(noun, what[1], endsInSyllabicR)) // Add the suffix -ക്കൾ
					{
						toReturn.push_back(noun + u8"\u0d15\u0d4d\u0d15\u0d7e");
					}
	
					else // All other feminine nouns take the suffix -kaL
					{
						toReturn.push_back(noun + u8"\u0d15\u0d7e");
					}

					break;
				} // case Feminine

				default: // Neuter
				{
					#ifdef DEBUG
					std::cout << "mpp::ReqHandler::findPlural: isH: the noun " << std::quoted(noun) << " is neuter." << std::endl;
					#endif
					toReturn.push_back(noun + u8"\u0d15\u0d7e"); // All neuter nouns with human referents take the suffix -kaL
					break;
				} // default

			} // switch
		} // if (isH == true)
	
		else // Not a noun that refers to humans
		{
			#ifdef DEBUG
			std::cout << "mpp::ReqHandler::findPlural: the noun " << std::quoted(noun) << " doesn't have a human referent." << std::endl;
			#endif
		
			boost::u32regex endsInAlveolarN = boost::make_u32regex(".*\\x{d7b}$");
	
			if (isAnimate(noun) == true && boost::u32regex_match(noun, endsInAlveolarN)) // This noun has an animate referent
			{
				#ifdef DEBUG
				std::cout << "mpp::ReqHandler::findPlural: the noun " << std::quoted(noun) << u8" is animate and ends in \u0d7b." << std::endl;
				#endif
				toReturn.push_back(noun + u8"\u0d2e\u0d3e\u0d7c"); // These nouns have -maar plurals
			}
		
			else // This noun's referent is neither animate nor human. It takes the underlying suffix -kaL, but phonetic assimilation occurs.
			{
				#ifdef DEBUG
				std::cout << "mpp::ReqHandler::findPlural: the noun " << std::quoted(noun) << " is neither animate nor human." << std::endl;
				#endif
				boost::u32regex isAmStem = boost::make_u32regex(".*\\x{d02}$"); // Matches a noun that ends in an anusvara
				boost::u32regex endsInSchwa = boost::make_u32regex(".*\\x{d4d}$"); // Matches a noun that ends in a schwa
				boost::u32regex cvcuReg = boost::make_u32regex("[\\x{d15}-\\x{d3a}]((?:)|[\\x{d3e}-\\x{d4e}])[\\x{d15}-\\x{d3a}]\\x{d41}"); // Matches a noun of the form CVCu
				boost::u32regex cLongVReg = boost::make_u32regex("[\\x{d15}-\\x{d3a}][\\x{d3e}|\\x{d40}|\\x{d42}|\\x{d44}|\\x{d47}|\\x{d4b}]"); // Matches a noun of the form C[long V]
	
				if (boost::u32regex_match(noun, isAmStem)) // Replace -am with -anngal
				{
					#ifdef DEBUG
					std::cout << "mpp::ReqHandler::findPlural: the noun " << std::quoted(noun) << " ends in \u0d02" << std::endl;
					#endif
					boost::u32regex replaceAmStem = boost::make_u32regex("(.*)\\x{d02}$"); // Capture everything before the final -am
					std::string pluralForm = boost::u32regex_replace(noun, replaceAmStem, u8"$1\u0d19\u0d4d\u0d19\u0d7e");
					#ifdef DEBUG
					std::cout << "mpp::ReqHandler::findPlural: the plural form of " << std::quoted(noun) << " is " << std::quoted(pluralForm) << std::endl;
					#endif
					toReturn.push_back(pluralForm);
				}
	
				else if (boost::u32regex_match(noun, endsInSchwa)) // Replace schwa with /u/ and add suffix -kaL
				{
					#ifdef DEBUG
					std::cout << "mpp::ReqHandler::findPlural: the noun " << std::quoted(noun) << " ends in a schwa" << std::endl;
					#endif
					boost::u32regex replaceSchwa = boost::make_u32regex("(.*)\\x{d4d}$"); // Capture everything before the schwa
					std::string nounWithU = boost::u32regex_replace(noun, replaceSchwa, u8"$1\u0d41"); // Replace schwa with /u/
					std::string plural = nounWithU + u8"\u0d15\u0d7e"; // Add the suffix -kaL
					#ifdef DEBUG
					std::cout << "mpp::ReqHandler::findPlural: the noun " << std::quoted(noun) << "'s plural is " << std::quoted(plural) << std::endl;
					#endif
					toReturn.push_back(plural); // Store it
				}
	
				else if (boost::u32regex_match(noun, cvcuReg) || boost::u32regex_match(noun, cLongVReg)) // Noun in the form CVCu or C[long V]
				{
					#ifdef DEBUG
					std::cout << "mpp::ReqHandler::findPlural: the noun " << std::quoted(noun) << " is in the form CVCu or C[long V]" << std::endl;
					#endif
					std::string plural = noun + u8"\u0d15\u0d4d\u0d15\u0d7e"; // Add the suffix -kkaL
					#ifdef DEBUG
					std::cout << "mpp::ReqHandler::findPlural: the plural of the noun " << std::quoted(noun) << " is " << std::quoted(plural) << std::endl;
					#endif
					toReturn.push_back(plural);
				}
	
				else // Not one of the special cases
				{
					#ifdef DEBUG
					std::cout << "mpp::ReqHandler::findPlural: the noun " << std::quoted(noun) << " isn't a special case." << std::endl;
					#endif
					std::string plural = noun + u8"\u0d15\u0d7e"; // Add the suffix -kaL
					#ifdef DEBUG
					std::cout << "mpp::ReqHandler::findPlural: the plural of the noun " << std::quoted(noun) << " is " << std::quoted(plural) << std::endl;
					#endif
					toReturn.push_back(plural);
				}
			}
		}
	}

	return toReturn;
}

/**
* @desc Given a PLURAL noun, determines whether or not it has a corresponding SINGULAR form.
* @param noun The Malayalam noun to check (UTF-8 encoded, all codepoints in range 0xd00-0xd7f).
* @return True if the noun has a corresponding singular form, false otherwise.
**/
bool mpp::ReqHandler::hasSingular(std::string noun)
{
	return noun != u8"\u0d2a\u0d47\u0d7c"; // Only /pe:ɾ/ has no plural
}

/**
* @desc Uses the DB to determine whether or not the given noun is animate.
* @param noun The noun to check. Malayalam text, encoded in UTF-8.
* @return True if the noun is animate, false if it isn't, boost::indeterminate if it isn't in the DB.
**/
boost::logic::tribool mpp::ReqHandler::isAnimate(std::string noun)
{
	bool toReturn = true;

	if (inDB(noun)) // The noun is in the DB
	{
		isAnimateStmt->set_string(0, noun); // Load the noun into the prepared statement

		try
		{
			mariadb::result_set_ref qRes = isAnimateStmt->query(); // Fetch the noun's animacy

			while (qRes->next()) // Should only run once, but still
			{
				toReturn = toReturn && qRes->get_boolean("animate"); // AND it to ensure that a single false stops the entire thing
			}
		}

		catch (mariadb::exception::connection& mece)
		{
			std::ostringstream ess;
			ess << "mpp::ReqHandler::isAnimate: caught MariaDB connection exception while trying to execute query" << std::endl
			<< "\tSELECT nouns.*,animacies.animate FROM nouns LEFT JOIN animacies ON animacies.id=nouns.id WHERE nouns.noun=" << std::quoted(noun, '\'') << std::endl
			<< "Exception: " << mece.what() << std::endl;
			mpp::exceptions::DBError ex(ess.str());
			throw ex;
		}
	}

	else // We don't know
	{
		toReturn = boost::indeterminate;
	}

	return toReturn;
}

/**
* @desc Uses the DB to determine whether or not the given noun refers to a human.
* @param noun The noun to check. Malayalam text, encoded in UTF-8.
* @return True if the noun refers to a human, false if it doesn't, boost::indeterminate if it isn't in the DB.
**/
boost::logic::tribool mpp::ReqHandler::isHuman(std::string noun)
{
	boost::logic::tribool toReturn = true;

	if (inDB(noun)) // The noun is in the DB
	{
		isHumanStmt->set_string(0, noun);

		try
		{
			mariadb::result_set_ref qRes = isHumanStmt->query(); // Fetch the noun's animacy

			while (qRes->next()) // Should only run once, but still
			{
				toReturn = toReturn && qRes->get_boolean("humanity"); // AND it to ensure that a single false stops the entire thing
			}
		}

		catch (mariadb::exception::connection& mece)
		{
			std::ostringstream ess;
			ess << "mpp::ReqHandler::isHuman: caught MariaDB connection exception while trying to execute query" << std::endl
			<< "\tSELECT nouns.*,humanNouns.humanity FROM nouns LEFT JOIN humanNouns ON humanNouns.id=nouns.id WHERE nouns.noun=" << std::quoted(noun, '\'') << std::endl
			<< "Exception: " << mece.what() << std::endl;
			mpp::exceptions::DBError ex(ess.str());
			throw ex;
		}
	}

	else // Unknown unless its a -kaaran/-kaari noun
	{
		if (boost::u32regex_match(noun, endsInKaar)) // The noun ends in -കാരൻ or -കാരി
		{
			toReturn = true;
		}

		else
		{
			toReturn = boost::indeterminate;
		}
	}

	return toReturn;
}

/**
* @desc Finds the gender of the given noun.
* @param noun The noun to fetch the gender of. Malayalam text, encoded in UTF-8.
* @return An enum value representing the noun's gender (masculine, feminine, or neuter).
* @note Although most members return a tribool instead of throwing an exception if the noun isn't in the DB, this method throws an exception.
*	I chose to do this because this method should only be called when it's already known that the noun exists in the DB,
*	and more importantly, because I want to return a proper Gender type instead of a tribool.
**/
mpp::ReqHandler::Gender mpp::ReqHandler::getGender(std::string noun)
{
	Gender toReturn = Unknown;
	
	if (inDB(noun)) // The noun is in the DB
	{
		getGenderStmt->set_string(0, noun); // Load the noun into the prepared statement
		
		try
		{
			mariadb::result_set_ref qRes = getGenderStmt->query(); // Run the query

			while (qRes->next())
			{
				std::string genStr = qRes->get_string("gender"); // Fetch the gender as a string
				
				if (genStr == "Masculine")
				{
					toReturn = Masculine;
				}

				else if (genStr == "Feminine")
				{
					toReturn = Feminine;
				}

				else
				{
					toReturn = Neuter;
				}
			}
		}

		catch (mariadb::exception::connection& mece)
		{
			std::ostringstream ess;
			ess << "mpp::ReqHandler::getGender: caught MariaDB connection exception while trying to execute query" << std::endl
			<< "\tSELECT nouns.id,genders.gender FROM nouns JOIN genders ON nouns.id=genders.id WHERE nouns.noun=" << std::quoted(noun, '\'') << std::endl
			<< "Exception: " << mece.what() << std::endl;
			mpp::exceptions::DBError ex(ess.str());
			throw ex;
		}
	}

	else // Error
	{
		if (boost::u32regex_match(noun, boost::make_u32regex(".*\\x{d15}\\x{d3e}\\x{d30}\\x{d7b}"))) // -kaaran is masculine
		{
			toReturn = Masculine;
		}

		else if (boost::u32regex_match(noun, boost::make_u32regex(".*\\x{d15}\\x{d3e}\\x{d30}\\x{d3f}"))) // -kaari is feminine
		{
			toReturn = Feminine;
		}

		else // Unknown
		{
			std::ostringstream ess;
			ess << "mpp::ReqHandler::getGender: noun " << std::quoted(noun, '\'') << " doesn't exist in the DB!";
			mpp::exceptions::UnknownNoun ex(ess.str());
			throw ex;
		}
	}

	return toReturn;
}

/**
* @desc Determines whether or not a noun ends in a vowel.
* @param noun The noun to check. Must be UTF-8 encoded Malayalam text.
* @return True if the noun is a vowel stem, false otherwise.
**/
bool mpp::ReqHandler::isVowelStem(std::string noun)
{
	ARRAY_CLASS<boost::smatch, 2> what;
	bool doesntEndInChillu = boost::u32regex_match(noun, what.at(what.size()-1), boost::make_u32regex(".*[^\\x{d7a}-\\x{d7f}]$"));
	bool doesntEndInSchwa = boost::u32regex_match(noun, what.back(), boost::make_u32regex(".*[^\\x{d4d}]$"));
	bool isIva = (noun == u8"\u0d07\u0d35"); // iva is a special case - it's a vowel stme, but it's plural
	bool isAva = (noun == u8"\u0d05\u0d35"); // ava is also a special case, for the same reason as iva
	return doesntEndInChillu && doesntEndInSchwa && !(isIva || isAva); // A vowel-stem must NOT end in a chillu AND must NOT end in a schwa AND must NOT be (iva OR ava)
}

/**
* @desc Determines whether or not a singular noun has an exceptional plural.
* @param noun The singular noun to check. Must be UTF-8 encoded Malayalam text.
* @return True if the singular noun has an exceptional plural, false if it doesn't, and boost::indeterminate if it isn't in the DB.
**/
boost::logic::tribool mpp::ReqHandler::isException(std::string noun)
{
	boost::logic::tribool toReturn = true; // Default to true so that a single AND with a 'false' value will set it to false
	#ifdef DEBUG
	std::cout << "mpp::ReqHandler::isException: the noun to check is " << std::quoted(noun) << std::endl
	<< "\ttoReturn = " << std::boolalpha << toReturn << std::noboolalpha << std::endl;
	#endif

	if (inDB(noun)) // The noun is in the DB
	{
		#ifdef DEBUG
		std::cout << "mpp::ReqHandler::isException: the noun " << std::quoted(noun) << " is in the DB" << std::endl;
		#endif
		exceptionStmt->set_string(0, noun); // Load the noun into the prepared statement
		
		try
		{
			mariadb::result_set_ref qRes = exceptionStmt->query(); // Run the query
			#ifdef DEBUG
			std::cout << "mpp::ReqHandler::isException: # of results found = " << qRes->row_count() << std::endl;
			int pno = 1; // # of current plural form
			#endif

			if (qRes->row_count() > 0) // The query returned results
			{
				while (qRes->next())
				{
					std::string pluralStr = qRes->get_string("plural"); // Fetch the noun's stored plural (or empty string)
					#ifdef DEBUG
					std::cout << "mpp::ReqHandler::isException: plural #" << pno << " of noun " << std::quoted(noun) << " is " << std::quoted(pluralStr) << std::endl
					<< "\ttoReturn = " << std::boolalpha << toReturn << " && " << !pluralStr.empty() << " (" << (toReturn && !pluralStr.empty()) << std::noboolalpha << std::endl;
					#endif
					toReturn = toReturn && !pluralStr.empty(); // A noun has an irregular plural if the stored string isn't empty
				}
			}

			else // No results - the noun must have a regular plural, since it's in the DB but lacks an exceptional plural
			{
				toReturn = false;
			}
		}

		catch (mariadb::exception::connection& mece)
		{
			std::ostringstream ess;
			ess << "mpp::ReqHandler::isException: caught MariaDB connection exception while trying to execute query" << std::endl
			<< "SELECT nouns.id,nouns.noun,exceptions.plural FROM nouns JOIN exceptions ON exceptions.id=nouns.id WHERE nouns.noun=" << std::quoted(noun, '\'') << std::endl
			<< "Exception: " << mece.what() << std::endl;
			mpp::exceptions::DBError ex(ess.str());
			throw ex;
		}
	}

	else // The noun isn't in the DB
	{
		#ifdef DEBUG
		std::cout << "mpp::ReqHandler::isException: the noun " << std::quoted(noun) << " isn't in the DB, returning ";
		#endif
		toReturn = boost::indeterminate;
		#ifdef DEBUG
		std::cout << toReturn << std::endl;
		#endif
	}

	return toReturn;
}

/**
* @desc Finds the singular form of a noun, given the plural form.
* @param noun The noun to find the singular form of. Must be UTF-8 encoded Malayalam text.
* @return 1 or more UTF-8 encoded Malayalam strings containing the noun's singular form(s).
**/
std::vector<std::string> mpp::ReqHandler::findSingular(std::string noun)
{
	/* First, try regexes */
	std::vector<std::string> toReturn;
	
	if (boost::u32regex_match(noun, boost::make_u32regex(".*\\x{d15}\\x{d7e}$"))) // Plural noun ending in kaL
	{
		boost::u32regex kaLfinder = boost::make_u32regex("(.*)\\x{d15}\\x{d7e}"); // Capture everything before the -kaL
		std::string replacement = "$1"; // Just keep everything except the kaL
		toReturn.push_back(boost::u32regex_replace(noun, kaLfinder, replacement));
	}

	else if (boost::u32regex_match(noun, boost::make_u32regex(".*\\x{d2e}\\x{d3e}\\x{d7c}"))) // Plural ending in -maar
	{
		boost::u32regex stemFinder = boost::make_u32regex("(.*)\\x{d2e}\\x{d3e}\\x{d7c}"); // Capture everything before the -maar
		toReturn.push_back(boost::u32regex_replace(noun, stemFinder, "$1")); // Return everything before the -maar
	}

	else if (boost::u32regex_match(noun, boost::make_u32regex(".*\\x{d15}\\x{d4d}\\x{d15}\\x{d7e}"))) // Plural ending in -kkaL
	{
		boost::u32regex stemFinder = boost::make_u32regex("(.*)\\x{d15}\\x{d4d}\\x{d15}\\x{d7e}"); // Capture everything before the -kkaL
		toReturn.push_back(boost::u32regex_replace(noun, stemFinder, "$1")); // Return everything before the -kkaL
	}

	else if (boost::u32regex_match(noun, boost::make_u32regex(".*\\x{d15}\\x{d3e}\\x{d7c}"))) // Noun ending in -kaar
	{
		/* There are masculine and feminine singular forms, since this is an epicene plural */
		toReturn.push_back(noun + u8"\u0d7b"); // Masculine singular
		toReturn.push_back(noun + u8"\u0d3f"); // Feminine singular
	}

	else if (boost::u32regex_match(noun, boost::make_u32regex("[\\x{d05}|\\x{d07}]\\x{d35}\\x{d7c}"))) // ivar or avar
	{
		/* The plural corresponds to either the masculine or feminine singular pronoun, so we need to add both to the vector */
		if (noun == u8"\u0d07\u0d35\u0d7c") // ivar
		{
			toReturn.push_back("\u0d07\u0d35\u0d7b"); // ivan
			toReturn.push_back("\u0d07\u0d35\u0d7e"); // ivaL
		}

		else // avar
		{
			toReturn.push_back("\u0d05\u0d35\u0d7b"); // avan
			toReturn.push_back("\u0d05\u0d35\u0d7e"); // avaL
		}
	}

	else if (isExceptionalPlural(noun) == true) // Need to check the DB
	{
		try
		{
			exSingStmt->set_string(0, noun); // Load the noun into the string
			mariadb::result_set_ref qRes = exSingStmt->query(); // Find its plural using the prepared statement

			while (qRes->next())
			{
				toReturn.push_back(qRes->get_string("noun")); // Find the noun's singular form and store it
			}
		}

		catch (mariadb::exception::connection& mece)
		{
			std::ostringstream ess;
			ess << "mpp::ReqHandler::isExceptionalPlural: caught MariaDB connection exception while trying to execute query" << std::endl
			<< "\tSELECT * FROM nouns WHERE noun=" << std::quoted(noun, '\'') << std::endl
			<< "Exception: " << mece.what() << std::endl;
			mpp::exceptions::DBError ex(ess.str());
			throw ex;
		}
	}

	else // Not a known stem type, and not in the DB. Therefore, we can't guess.
	{
		std::ostringstream ess;
		ess << "mpp::ReqHAndler::isExceptionalPlural: noun " << std::quoted(noun, '\'') << " doesn't match any of the known stem types and isn't in the DB!" << std::endl;
		mpp::exceptions::UnknownNoun ex(ess.str());
		throw ex;
	}

	return toReturn;
}

/**
* @desc Determines whether or not a string contains the plural form of an exceptional noun.
* @param noun A UTF-8 encoded Malayalam noun which may or may not be the plural form of an exceptional noun.
* @return True if the noun has an exceptional plural, false if it doesn't, and boost::indeterminate if it isn't in the DB.
**/
boost::logic::tribool mpp::ReqHandler::isExceptionalPlural(std::string noun)
{
	try
	{
		exSingStmt->set_string(0, noun); // Load the noun into the prepared statement
		mariadb::u64 rowsAff = exSingStmt->execute();
		return (rowsAff != 0);
	}

	catch (mariadb::exception::connection& mece)
	{
		std::ostringstream ess;
		ess << "mpp::ReqHandler::isExceptionalPlural: caught MariaDB connection exception while trying to execute query" << std::endl
		<< "\tSELECT * FROM nouns WHERE noun=" << std::quoted(noun, '\'') << std::endl
		<< "Exception: " << mece.what() << std::endl;
		mpp::exceptions::DBError ex(ess.str());
		throw ex;
	}
}

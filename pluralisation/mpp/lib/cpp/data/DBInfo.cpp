/* Standard C++ */
#include <sstream> // std::ostringstream
#include <string> // std::string
#ifdef DEBUG
#include <iostream> // std::cout
#include <iomanip> // std::quoted
#endif

/* Boost */
#include <boost/filesystem.hpp> // boost::filesystem::path, boost::filesystem::exists
#include <boost/program_options.hpp> // boost::program_options::options_description, boost:program_options::value, boost::program_options::variables_map, boost::program_options::store, boost::program_options::notify, boost::program_options::parse_config_file

/* Our headers */
#include "mpp/exceptions/MissingDBConfFile.hpp" // Thrown if the file @ the given path DNE
#include "mpp/exceptions/MissingDBInfo.hpp" // Throw if the configuration file doesn't contain all of the needed data
#include "mpp/data/DBInfo.hpp" // Class def'n

/**
* @desc Constructor. Attempts to parse the file @ the given path and load DB info from it.
*	The file is assumed have lines of the format "$key=$value", one per line.
*	The expected keys are "db" (DB name), "user" (DB user), "password" (DB password), and "host" (DB host).
* @param cfPath The path of the file to load data from.
**/
mpp::data::DBInfo::DBInfo(boost::filesystem::path cfPath)
{
	/* Step 1: check for the existence of the given file */
	if (!boost::filesystem::exists(cfPath)) // Can't load data
	{
		std::ostringstream ess; // Used to create the error message
		ess << "mpp::data::DBInfo::DBInfo: the file named by the given config path (" << cfPath << ") doesn't exist!";
		mpp::exceptions::MissingDBConfFile ex(ess.str());
		throw ex;
	}

	#ifdef DEBUG
	std::cout << "mpp::data::DBInfo::DBInfo: data file " << cfPath << " exists." << std::endl;
	#endif

	/* Step 2: set up option parsing */
	boost::program_options::options_description dbOpts("Database options");
	boost::program_options::variables_map vm;

	dbOpts.add_options()
		("user", boost::program_options::value<std::string>(), "DB username")
		("password", boost::program_options::value<std::string>(), "DB password")
		("host", boost::program_options::value<std::string>(), "DB host")
		("db", boost::program_options::value<std::string>(), "DB name");

	#ifdef DEBUG
	std::cout << "mpp::data::DBInfo::DBInfo: set up options " << std::endl
	<< std::endl
	<< dbOpts
	<< std::endl;
	#endif

	/* Step 3: open config file */
	boost::filesystem::ifstream confStrm(cfPath); // Now that we know that the path exists, we can open a stream to read it

	if (!(confStrm.is_open() && confStrm.good())) // Some kind of error
	{
		std::ostringstream ess;
		ess << "Couldn't open file " << cfPath << " for reading.";
		mpp::exceptions::MissingDBInfo ex(ess.str());
		throw ex;
	}

	#ifdef DEBUG
	std::cout << "mpp::data::DBInfo::DBInfo: opened data file " << cfPath << " for reading." << std::endl;
	#endif

	/* Step 4: parse options from config file */
	boost::program_options::store(
		boost::program_options::parse_config_file(confStrm, dbOpts)
		, vm);
	boost::program_options::notify(vm);

	#ifdef DEBUG
	std::cout << "mpp::data::DBInfo::DBInfo: parsed options from config file" << std::endl;
	#endif

	/* Step 5: ensure that all needed options are present */
	if (!vm.count("user")) // No username
	{
		std::ostringstream ess;
		ess << "The configuration file " << cfPath << " doesn't contain the username required to access the DB!";
		mpp::exceptions::MissingDBInfo ex(ess.str());
		throw ex;
	}

	if (!vm.count("password")) // No password
	{
		std::ostringstream ess;
		ess << "The configuration file " << cfPath << " doesn't contain the password required to access the DB!";
		mpp::exceptions::MissingDBInfo ex(ess.str());
		throw ex;
	}

	if (!vm.count("host")) // No host
	{
		std::ostringstream ess;
		ess << "The configuration file " << cfPath << " doesn't contain the DB's host!";
		mpp::exceptions::MissingDBInfo ex(ess.str());
		throw ex;
	}

	if (!vm.count("db")) // No DB name
	{
		std::ostringstream ess;
		ess << "The configuration file " << cfPath << " doesn't contain the name of the DB to open on connection!";
		mpp::exceptions::MissingDBInfo ex(ess.str());
		throw ex;
	}

	#ifdef DEBUG
	std::cout << "mpp::data::DBInfo::DBInfo: loaded all variables from config file" << std::endl;
	#endif

	/* Step 6: we have loaded all needed options, store them */
	user = vm["user"].as<std::string>();
	password = vm["password"].as<std::string>();
	host = vm["host"].as<std::string>();
	db = vm["db"].as<std::string>();

	#ifdef DEBUG
	std::cout << "mpp::data::DBInfo::DBInfo: loaded the following data: " << std::endl
	<< "\tDB user name = " << std::quoted(user) << std::endl
	<< "\tDB password = " << std::quoted(password) << std::endl
	<< "\tDB host name = " << std::quoted(host) << std::endl
	<< "\tDB name = " << std::quoted(db) << std::endl;
	#endif
}

/**
* @desc Fetches the name of the user to use when connecting to the DB.
* @return The name of the user to use when connecting to the DB.
**/
std::string mpp::data::DBInfo::getUser() const
{
	return user;
}

/**
* @desc Fetches the password to use when connecting to the DB.
* @return The password to use when connecting to the DB.
**/
std::string mpp::data::DBInfo::getPassword() const
{
	return password;
}

/**
* @desc Fetches the host to connect to.
* @return The host to connect to.
**/
std::string mpp::data::DBInfo::getHost() const
{
	return host;
}

/**
* @desc Fetches the name of the DB to open on connection.
* @return The name of the DB to open on connection.
**/
std::string mpp::data::DBInfo::getDBName() const
{
	return db;
}

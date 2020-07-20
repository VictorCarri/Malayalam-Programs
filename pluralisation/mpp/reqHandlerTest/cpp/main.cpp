/* Standard C++ */
#include <iostream> // std::cout
#include <string> // std::string
#include <iomanip> // std::quoted

/* Boost */
#include <boost/program_options.hpp> // boost::program_options::options_description, boost::program_options::value, boost::program_options::variables_map, boost::program_options::store, boost:program_options::notify, boost::program_options::positional_options_description. boost::program_options::command_line_parser, boost::program_options::unknown_option
#include <boost/filesystem.hpp> // boost::filesystem::path

/* MPP headers */
#include "mpp/ReqHandler.hpp" // Class to test
#include "mpp/Request.hpp" // Represents a request
#include "mpp/Reply.hpp" // Represents a reply

enum ExitCode
{
	OK = 0,
	HELP,
	UNKNOWN_OPTION
};

int main(int argc, char* argv[])
{
	/* Set up arg parsing and other info */
	boost::filesystem::path ourPath(argv[0]); // Convert our name to a path
	std::string ourName = ourPath.filename().string(); // Convert our name to a string
	boost::program_options::options_description cmdOpts("Command-line options");
	boost::program_options::options_description posConvOpts("Options for converting positional options to named options");
	boost::program_options::options_description allOpts("All options (for parsing)");
	boost::program_options::variables_map vm;
	boost::program_options::positional_options_description posOpts;

	/* Set up positional to named options conversion */
	posOpts.add("noun", 1); // Convert the first positional option to a "noun" option
	posOpts.add("dbinfo", -1); // Convert all other positional options to "dbinfo" options

	/* Set up named options that are used to convert positional options to named ones */
	posConvOpts.add_options()
		("dbinfo,d", boost::program_options::value<std::string>()->default_value("/home/victor/info/pluraliser.dbinfo"), "Path to the DB info file")
		("noun,n", boost::program_options::value<std::string>()->default_value(u8"\u0d05\u0d35\u0d7b"), "The noun to test");

	/* Set up other options */
	cmdOpts.add_options()
		("help,h", "Print a help message");

	/* Set up a list of all options for parsing */
	allOpts.add(posConvOpts).add(cmdOpts);
	
	try
	{
		boost::program_options::store(
			boost::program_options::command_line_parser(argc, argv)
			.options(allOpts)
			.positional(posOpts)
			.run(),
		vm);
	}
	
	catch (boost::program_options::unknown_option& bpouoe)
	{
		std::cerr << ourName << ": you passed an unknown option" << std::endl
		<< "\tOption name = " << std::quoted(bpouoe.get_option_name()) << std::endl
		<< "\tError message = " << bpouoe.what() << std::endl
		<< "\tError template = " << std::quoted(bpouoe.m_error_template) << std::endl;
		return UNKNOWN_OPTION;
	}

	boost::program_options::notify(vm);

	if (vm.count("help"))
	{
		std::cout << "Usage: " << ourName << " [-h|--help]"
		<< std::endl << std::endl
		<< cmdOpts;
		return HELP;
	}

	/* Set up test vars */
	std::cout << ourName << ": creating ReqHandler with DB info file located at path " << std::quoted(vm["dbinfo"].as<std::string>()) << std::endl;
	mpp::ReqHandler rh(vm["dbinfo"].as<std::string>()); // Try to instantiate it with the path to the DB config file
	mpp::Request req; // Request to use to test
	mpp::Reply rep; // Reply to use as a test
	std::cout << "------------------------------------------------------------------------------------------------------------------------------------" << std::endl;

	/* Test an ISSING request */
	std::cout << ourName << ": testing ISSING request" << std::endl;
	req.setNoun(vm["noun"].as<std::string>());
	req.setCommand(mpp::Request::ISSING);
	std::cout << ourName << ": the noun to test is " << std::quoted(req.getNoun()) << std::endl;
	rh.handleReq(req, rep);
	std::cout << "------------------------------------------------------------------------------------------------------------------------------------" << std::endl;

	/* Test a FOF request */
	std::cout << ourName << ": testing FOF request" << std::endl;
	req.setCommand(mpp::Request::FOF);
	std::cout << ourName << ": the noun to test is " << std::quoted(req.getNoun()) << std::endl;
	rh.handleReq(req, rep);

	return 0;
}

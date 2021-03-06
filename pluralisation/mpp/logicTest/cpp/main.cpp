/* STL */
#include <string> // std::string
#include <iostream> // std::cout, std::wcout, std::boolalpha
#include <sstream> // std::stringstream

#include <boost/program_options.hpp> // boost::program_options::options_description, boost::program_options::value, boost::program_options::variables_map, boost::program_options::positional_options_description, boost::program_options::store, boost::program_options::command_line_parser, boost::filesystem::ifstream
#include <boost/filesystem.hpp> // boost::filesystem::path, boost::filesystem::exists

/* Our headers */
#include "mpp/Request.hpp" // Request object
#include "mpp/Reply.hpp" // Reply::FailureCode
#include "mpp/ReqParser.hpp" // Request parser object

#define COMLEN 100 // Length of a command
#define INPLEN 200 // Length of input

enum ExitCode
{
	NORMAL = 0,
	HELP,
	NOINPFILE,
	COULDNTOPENFILE,
	BADREQ,
	NEEDMOREDATA,
	INPDNE
};

int main(int argc, char* argv[])
{
	mpp::Request req; // Test object
	mpp::ReqParser reqParser; // Parses a request

	/* Vars for version that reads input from a file */
	boost::program_options::options_description cmd("Command-line options");
	boost::program_options::options_description posConv("Options for converting positional options to named options");
	boost::program_options::variables_map vm;
	boost::program_options::positional_options_description posOpts;
	boost::program_options::options_description all("All options"); // Needed for parsing, since positional options are converted to named ones, and the options live in separate options_description objects
	boost::filesystem::path ourPath(argv[0]); // Convert first argument to path
	std::string ourName = ourPath.filename().string(); // Remove any folders and get the program's name

	/* Set up options */	
	cmd.add_options()
		("help,h", "Print this help message.");
	posConv.add_options()
		("file,f", boost::program_options::value<boost::filesystem::path>(), "Path to file containing test request to parse.");
	all.add(cmd).add(posConv); // Register all options in the description that'll be used for parsing
	posOpts.add("file", -1);

	/* Enable Boolean strings */
	std::cout << std::boolalpha;
	std::wcout << std::boolalpha;

	/* Parse options */
	boost::program_options::store(
		boost::program_options::command_line_parser(argc, argv)
		.options(all)
		.positional(posOpts)
		.run(),
		vm
	);
	boost::program_options::notify(vm);

	if (vm.count("help")) // User asked for help
	{
		std::cout << "Usage: " << ourName << " [path-to-input-file]" << std::endl
		<< std::endl
		<< cmd;
		return HELP;
	}

	if (!vm.count("file")) // No path given
	{
		std::cerr << "Usage: " << ourName << " input-file-path" << std::endl;
		return NOINPFILE;
	}

	boost::filesystem::path fp = vm["file"].as<boost::filesystem::path>(); // Fetch path to file to parse

	if (!boost::filesystem::exists(fp)) // Input file DNE
	{
		std::cerr << "Input file " << fp << " doesn't eixst." << std::endl;
		return INPDNE;
	}

	boost::filesystem::ifstream inpFStrm(fp); // Try to open file

	if (!inpFStrm.is_open()) // File didn't open
	{
		std::cerr << ourName << ": couldn't open file " << fp << std::endl;
		return COULDNTOPENFILE;
	}

	else // File is open
	{
		std::stringstream fContsStrm; // Used to read entire file
		fContsStrm << inpFStrm.rdbuf(); // Read entire file into stringstream
		std::string fConts = fContsStrm.str(); // Read entire file as string from stringstream
		boost::tribool result;
		boost::tie(result, boost::tuples::ignore) = reqParser.parse(req, fConts.cbegin(), fConts.cend());

		if (result)
		{
			std::cout << ourName << ": successfully parsed request." << std::endl;
			return NORMAL;
		}
		
		else if (!result)
		{
			std::cout << ourName << ": Error occurred while parsing request." << std::endl;
			mpp::Reply::Status stat = reqParser.getStatus();
			mpp::Reply temp;
			std::string reasonStr = temp.getStatText(stat);
			std::cout << reasonStr << std::endl;
			return BADREQ;
		}

		else
		{
			std::cout << ourName << ": need more data." << std::endl;
			return NEEDMOREDATA;
		}
		
	}

	return NORMAL;
}

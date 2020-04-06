/* STL */
#include <string> // std::wstring, std::string
#include <iostream> // std::wcerr, std::cerr, std::wclog, std::clog
#include <sstream> // std::wstringstream, std::stringstream
#include <algorithm> // std::for_each

/* Boost */
#include <boost/program_options.hpp> // boost::program_options::options_description, boost::program_options::value, boost::program_options::variables_map, boost::program_options::store, boost::program_options::command_line_parser, boost::program_options::positional_options_description, boost::program_options::notify
#include <boost/filesystem.hpp> // boost::filesystem::path, boost::filesystem::exists, boost::filesystem::ifstream
#include <boost/locale.hpp> // boost::locale::generator, boost::locale::normalize

/* Our headers */
#include "vuu/LenCounter.hpp" // Functor that counts the # of Unicode chars. in a string
#include "vuu/InvByteInCodePoint.hpp" // Exception thrown when an invalid byte is detected in a code point

enum ExitCode
{
	NORMAL = 0,
	HELP,
	NOARG,
	INPFDNE,
	COUNTERR
};

int main(int argc, char* argv[])
{
	/* Option parsing */
	boost::program_options::options_description dispOpts("Options"); // Options that'll be displayed to the user
	boost::program_options::options_description posConv("Positional options conversion"); // Used to convert positional options to named options
	boost::filesystem::path inpFilePath;
	boost::program_options::options_description allOpts("All options (for parsing)");
	boost::program_options::variables_map vm;
	boost::program_options::positional_options_description posOpts;

	/* Find our name */	
	boost::filesystem::path ourPath(argv[0]); // Convert path to program to a Boost.FileSystem.Path
	std::string ourName = ourPath.filename().string();
	std::wstring ourNameW = ourPath.filename().wstring();

	#ifdef DEBUG
	std::clog << "Our path: " << ourPath << std::endl
	<< "\tOur name = " << ourName << std::endl;
	std::wclog << L"Our path (wide):" << ourPath.wstring() << std::endl
	<< "\tOur name (wide): " << ourNameW << std::endl;
	#endif

	/* Locale vars */
	boost::locale::generator gen;
	vuu::LenCounter ulc; // Functor that counts the # of Unicode characters in an std::string
	vuu::LenCounter ulc2; // Functor that counts the # of Unicode characters in an std::wstring

	/* Set up locales */
	gen.locale_cache_enabled(true);
	gen("en_US.UTF-8"); // Add US locale
	gen("ml_IN.UTF-8"); // Add Malayalam locale

	/* Declare options */
	dispOpts.add_options()
		("help,h", "Print this help message.");
	posConv.add_options()
		("file,f", boost::program_options::value<boost::filesystem::path>(&inpFilePath), "Path to file containing noun to find the length of");
	allOpts.add(dispOpts).add(posConv);
	posOpts.add("file", -1); // Convert all positional arguments to "file" options
	
	/*
	* I use a file so that I can ensure that the data is stored as UTF-8. I don't know how to pass command-line args as UTF-8, & I don't want to bother with it.
	*/
	boost::program_options::store(
		boost::program_options::command_line_parser(argc, argv)
		.options(allOpts)
		.positional(posOpts)
		.run()
		,vm
	);
	boost::program_options::notify(vm);

	if (vm.count("help")) // User wants help
	{
		std::wcerr << L"Usage: ";
		//std::cerr << ourName;
		std::wcerr << ourNameW;
		std::wcerr << L" [path-to-file-containing-Malayalam-text]" << std::endl
		<< std::endl;
		std::cerr << dispOpts;
		return HELP;
	}

	if (!vm.count("file")) // Path to file not given
	{
		std::wcerr << L"Usage: ";
		//std::cerr << ourName;
		std::wcerr << ourNameW;
		std::wcerr << L" [path-to-file-containing-Malayalam-text]" << std::endl;
		return NOARG;
	}

	else
	{
		if (!boost::filesystem::exists(inpFilePath)) // Input file DNE
		{
			//std::cerr << ourName;
			std::wcerr << ourNameW;
			std::wcerr << L": file " << inpFilePath << " doesn't exist." << std::endl;
			return INPFDNE;
		}

		else
		{
			boost::filesystem::ifstream inpStrm(inpFilePath);
			std::stringstream inpFContsStrm;
			std::wstringstream inpFContsStrmW;
			inpFContsStrm << inpStrm.rdbuf(); // Read entire file into string
			inpFContsStrmW << inpStrm.rdbuf(); // Read entire file into wide string
			std::string fConts = inpFContsStrm.str(); // Extract string from stream
			std::wstring fContsW = inpFContsStrmW.str(); // Extract string from stream
			std::cout << "File contents: " << fConts << std::endl
			<< "\tString length: " << fConts.length() << std::endl;
			std::wcout << L"File contents (wide): " << fContsW << std::endl
			<< L"\tString length (wide): " << fContsW.length() << std::endl;

			/* Normalize file contents for Malayalam */
			std::string normFConts = boost::locale::normalize(fConts, boost::locale::norm_default, gen("ml_IN.UTF-8"));
			std::wstring normFContsW = boost::locale::normalize(fContsW, boost::locale::norm_default, gen("ml_IN.UTF-8"));
			std::cout.imbue(gen("ml_IN.UTF-8"));
			std::wcout.imbue(gen("ml_IN.UTF-8"));
				
			try
			{
				ulc = std::for_each(fConts.cbegin(), fConts.cend(), ulc); // Count # of codepoints using functor. We use the assignement operator to save the copy of the functor that std::for_each makes
			}

			catch (vuu::InvByteInCodePoint& countErr) // An error occurred while counting the # of codepoints in this string
			{
				//std::cerr << ourName;
				std::wcerr << ourNameW;
				std::wcerr << L": an error occurred while counting the # of codepoints in the file contents." << std::endl;
				std::cerr << countErr.what() << std::endl;
				return COUNTERR;
			}

			std::cout << ourName << ": file contents (normalized): " << normFConts << std::endl
			<< "\tNumber of UTF-8 codepoints in the string: " << ulc.getNumCodePoints() << std::endl;
			std::wcout << ourNameW << ": file contents (normalized, wide): " << normFContsW << std::endl
			<< "\tNumber of UTF-8 codepoints in the string: " << ulc.getNumCodePoints() << std::endl;
			//<< "\tString length: " << normFConts.length() << std::endl;
		}
	}

	return NORMAL;
}

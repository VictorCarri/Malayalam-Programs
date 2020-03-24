/* STL */
#include <iostream> // std::cout

/* Boost */
#include <boost/program_options.hpp> // boost::program_options::options_description, boost::program_options::value, boost::program_options::variables_map, boost::program_options::store, boost::program_options::store, boost::program_options::command_line_parser, boost::program_options::positional_options_description, boost::program_options::invalid_option_value, boost::program_options::unknown_option, boost::program_options::ambiguous_option

/* Our headers */
#include "Server.hpp" // Main server class

enum ExitCode
{
	NORMAL = 0,
	HELP,
	INVALID_OPTION_VALUE,
	UNKNOWN_OPTION,
	AMBIG_OPT
};

int main(int argc, char* argv[])
{
	/* Get port arg */
	boost::program_options::options_description generic("Options");
	boost::program_options::variables_map vm;
	int port; // Port #
	boost::program_options::positional_options_description posOpts;
	boost::program_options::options_description posOptsDesc("Positional options descriptor");
	boost::program_options::options_description cmdOpts("Command-line options");

	generic.add_options()
		("help,h", "Print this help message");
	posOptsDesc.add_options()
		("port,p", boost::program_options::value<int>(&port)->default_value(50001), "Set the port to listen on.");
	cmdOpts.add(generic).add(posOptsDesc);
	posOpts.add("port", -1);

	try
	{
		boost::program_options::store(
			boost::program_options::command_line_parser(argc, argv)
				.options(cmdOpts)
				.positional(posOpts)
				.run(),
			vm
		);
		boost::program_options::notify(vm);
	}

	catch (boost::program_options::invalid_option_value& bpoiov)
	{
		std::cerr << "Invalid value given for option: " << bpoiov.what() << std::endl;
		return INVALID_OPTION_VALUE;
	}

	catch (boost::program_options::unknown_option& bpouo)
	{
		std::cerr << "Received unknown option: " << bpouo.what() << std::endl;
		return UNKNOWN_OPTION;
	}

	catch (boost::program_options::ambiguous_option& bpoao)
	{
		std::cerr << "Ambiguous option: " << bpoao.what() << std::endl;
		return AMBIG_OPT;
	}

	if (vm.count("help"))
	{
		std::cout << "Usage: " << argv[0] << "[-h|--help] [port number]" << std::endl
			<< std::endl
			<< generic << std::endl;
		return HELP;
	}

	#ifdef DEBUG
	std::clog << "Port #" << port << std::endl;
	#endif

	return NORMAL;
}

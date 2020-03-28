/* C++ versions of C headers */
#include <cstddef> // std::size_t

/* STL */
#include <iostream> // std::cout
#include <string> // std::string
#include <exception> // std::exception

/* Boost */
#include <boost/program_options.hpp> // boost::program_options::options_description, boost::program_options::value, boost::program_options::variables_map, boost::program_options::store, boost::program_options::parse_command_line

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
	/* Option handling */
	boost::program_options::options_description opts("Options");
	boost::program_options::variables_map vm;

	/* Server vars */
	int port; // Port #
	std::size_t threads; // # of threads
	std::string address; // Address to run on

	opts.add_options()
		("help,h", "Print this help message")
		("port,p", boost::program_options::value<int>(&port)->default_value(50001), "Set the port to listen on.")
		("threads,t", boost::program_options::value<std::size_t>(&threads)->default_value(5), "Set the number of threads to use.")
		("address,a", boost::program_options::value<std::string>(&address)->default_value("127.0.0.1"), "Set the address which the server will run on");

	try
	{
		boost::program_options::store(
			boost::program_options::parse_command_line(argc, argv, opts),
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
		std::cout << opts << std::endl;
		return HELP;
	}

	#ifdef DEBUG
	std::clog << "main: Port #:" << port << std::endl
		<< "\t# of threads: " << threads << std::endl
		<< "\tAddress: " << address << std::endl;
	#endif

	try
	{	
		Server s(address, port, threads); // Create the server
		s.run(); // Run the server until stopped
	}

	catch (std::exception& e)
	{
		std::cerr << "An exception occurred while starting or running the server: " << e.what() << std::endl;
	}

	return NORMAL;
}

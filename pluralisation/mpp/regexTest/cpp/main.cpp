/* Standard C++ */
#include <iostream> // std::cout

/* Boost */
#include <boost/regex.hpp> // boost::smatch
#include <boost/regex/icu.hpp> // boost::u32regex, boost::u32regex_match, boost::make_u32regex

int main()
{
	/* Misc regex vars */
	boost::smatch what; // What matched

	/* Set up regexes */
	boost::u32regex isAnStem = boost::make_u32regex(".*\\x{0d7b}$"); // Match final chillu alveolar n
	boost::u32regex doesntEndInChillu = boost::make_u32regex(".*[^\\x{d7a}-\\x{d7f}]$");
	boost::u32regex endsInSchwa = boost::make_u32regex(".*\\x{d4d}$");
	
	/* Test nouns */
	std::string anStemTest("\u0d05\u0d35\u0d7b"); // avan
	std::string vowelStemTest("\u0d15\u0d30"); // kara

	std::cout << "Test noun #1 (" << anStemTest << ") " << (boost::u32regex_match(anStemTest, what, isAnStem) ? "matched " : "didn't match") << " the an-stem regex." << std::endl
	<< "Test noun #2 (" << vowelStemTest << ") " << (boost::u32regex_match(vowelStemTest, what, doesntEndInChillu) ? " doesn't end in a chillu " : " ends in a chillu") << " and " << (boost::u32regex_match(vowelStemTest, what, endsInSchwa) ? " ends in a schwa" : " doesn't end in a schwa") << std::endl;
	return 0;
}

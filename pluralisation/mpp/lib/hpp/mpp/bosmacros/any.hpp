#ifndef MPP_BOSMACROS_ANY_HPP
#define MPP_BOSMACROS_ANY_HPP

/*
* This header defines the macro ANY_CLASS that resolves to either boost::any or std::any, depending on the compile-time option USE_STD_ANY being passed.
*/

#ifdef USE_STD_ANY
#	include <any> // std::any
#	define ANY_CLASS std::any
#	define BAD_ANY_CAST std::bad_any_cast
#	define ANY_CAST std::any_cast

#else
#	include <boost/any.hpp> // boost::any
#	define ANY_CLASS boost::any
#	define BAD_ANY_CAST boost::bad_any_cast
#	define ANY_CAST boost::any_cast

#endif // USE_STD_ANY

#endif // MPP_BOSMACROS_ANY_HPP

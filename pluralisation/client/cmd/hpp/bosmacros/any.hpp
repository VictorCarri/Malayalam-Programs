#ifndef MPP_CLIENT_BOSMACROS_ANY_HPP
#define MPP_CLIENT_BOSMACROS_ANY_HPP

#ifdef USE_BOOST_ANY
#	include <boost/any.hpp>
#	define ANY_CLASS boost::any

#else
#	include <any>
#	define ANY_CLASS std::any

#endif

#endif // MPP_CLIENT_BOSMACROS_ANY_HPP

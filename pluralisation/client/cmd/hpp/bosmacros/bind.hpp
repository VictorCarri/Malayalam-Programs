#ifndef MPP_CLIENT_BIND_HPP
#define MPP_CLIENT_BIND_HPP

#ifdef USE_BOOST_BIND
#	include <boost/bind.hpp>
#	define BIND_FUNCTION boost::bind
using namespace boost::placeholders; // _1, _2, ...

#else
#	include <functional>
#	define BIND_FUNCTION std::bind
using namespace std::placeholders; // _1, _2, ...

#endif

#endif // MPP_CLIENT_BIND_HPP

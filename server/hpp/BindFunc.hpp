#ifndef BINDFUNC_HPP
#ifndef BINDFUNC_HPP

/*
* Define the macro BIND_FUNCTION as either std::bind or boost::bind, depending on whether the compile-time option USE_BOOST_BIND has been specified or not
*/
#ifdef USE_BOOST_BIND

#include <boost/bind.hpp> // boost::bind
#define BIND_FUNCTION boost::bind

#else

#include <functional> // std::bind
#define BIND_FUNCTION std::bind

#endif

#endif //BINDFUNC_HPP

#ifndef BINDFUNC_HPP
#ifndef BINDFUNC_HPP

/*
* Define the macro BIND_FUNCTION as either std::bind or boost::bind, depending on whether the compile-time option USE_STD_BIND has been specified or not.
* Defaults to boost::bind, since that was the original implementation.
*/
#ifdef USE_STD_BIND

#include <functional> // std::bind
#define BIND_FUNCTION std::bind

#else

#include <boost/bind.hpp> // boost::bind
#define BIND_FUNCTION boost::bind

#endif

#endif //BINDFUNC_HPP

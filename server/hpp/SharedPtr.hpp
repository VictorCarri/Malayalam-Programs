#ifndef SHAREDPTR_HPP
#define SHAREDPTR_HPP

/*
* This header defines a macro that resolves to either the STL or Boost implementation of shared_ptr, depending on the compile-time attribute USE_STD_SHARED_PTR.
* It defaults to std::shared_ptr
*/
#ifdef USE_STD_SHARED_PTR

#include <memory> // std::shared_ptr
#define SHARED_PTR std::shared_ptr

#else

#include <boost/shared_ptr.hpp> // boost::shared_ptr
#define SHARED_PTR boost::shared_ptr

#endif

#endif // SHAREDPTR_HPP

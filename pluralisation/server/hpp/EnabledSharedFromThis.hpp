#ifndef ENABLE_SHARED_FROM_THIS_HPP
#define ENABLE_SHARED_FROM_THIS_HPP

// Default to boost::enable_shared_from_this, but allow std::enable_shared_from_this to be used by defining a macro @ compile time

#ifdef USE_STD_ENABLE_SHARED_FROM_THIS
#include <memory> // std::enable_shared_from_this
#define ENABLE_SHARED_FROM_THIS std::enable_shared_from_this

#else
#include <boost/enable_shared_from_this.hpp>
#define ENABLE_SHARED_FROM_THIS boost::enable_shared_from_this

#endif

#endif // ENABLE_SHARED_FROM_THIS_HPP

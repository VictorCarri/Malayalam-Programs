#ifndef MPP_BOSMACROS_ARRAY_HPP
#define MPP_BOSMACROS_ARRAY_HPP

/* This header defines the macro ARRAY_CLASS, which resolves to std::array if USE_STD_ARRAY is defined, and boost::array otherwise */
#ifdef USE_STD_ARRAY
#	include <array>
#	define ARRAY_CLASS std::array

#else
#	include <boost/array.hpp>
#	define ARRAY_CLASS boost::array
#endif // USE_STD_ARRAY

#endif // MPP_BOSMACROS_ARRAY_HPP

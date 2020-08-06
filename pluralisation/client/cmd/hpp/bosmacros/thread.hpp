#ifndef MPP_CLIENT_BOSMACROS_THREAD_HPP
#define MPP_CLIENT_BOSMACROS_THREAD_HPP

/*
* Macros for the MPP client that determine whether Boost.Thread or STL threads are used.
*/
#ifdef USE_BOOST_THREAD
#	include <boost/thread/thread.hpp> // boost::thread
#	define THREAD boost::thread

#else
#	include <thread>
#	define THREAD std::thread

#endif // MPP_CLIENT_BOSMACROS_THREAD_HPP

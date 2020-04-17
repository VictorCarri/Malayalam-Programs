#ifndef THREAD_HPP
#define THREAD_HPP

/*
* This macro resolves to either std::thread or boost::thread, depending on whether the compile-time flag USE_BOOST_THREAD is specified or not.
*/
#ifdef USE_BOOST_THREAD

#include <boost/thread.hpp>
#define THREAD_CLASS boost::thread

#else

#include <thread>
#define THREAD_CLASS std::thread

#endif

#endif // THREAD_HPP

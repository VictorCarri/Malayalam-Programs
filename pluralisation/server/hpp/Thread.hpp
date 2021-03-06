#ifndef THREAD_HPP
#define THREAD_HPP

/*
* This macro resolves to either std::thread or boost::thread, depending on whether the compile-time flag USE_STD_THREAD is specified or not.
* It defaults to boost::thread.
*/
#ifdef USE_STD_THREAD

#include <thread>
#define THREAD_CLASS std::thread

#else

#include <boost/thread.hpp> // boost::thread
#define THREAD_CLASS boost::thread

#endif

#endif // THREAD_HPP

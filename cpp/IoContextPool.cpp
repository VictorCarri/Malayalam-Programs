/* C++ versions of C headers */
#include <cstddef> // std::size_t

/* STL */
#include <stdexcept> // std::runtime_error
#include <vector> // std::vector
#include <algorithm> // std::for_each
#ifdef DEBUG
#include <iostream> // std::clog
#endif

/* Boost */
#include <boost/asio.hpp> // boost::asio::io_context, boost::asio::make_work_guard
#include <boost/thread.hpp> // boost::thread
#include <boost/shared_ptr.hpp> // boost::shared_ptr
#include <boost/bind.hpp> // boost::bind

/* Our headers */
#include "IoContextPool.hpp" // Class def

/**
* @desc Constructor. Creates a pool of the specified size.
* @param poolSize The size of the pool.
**/
IoContextPool::IoContextPool(std::size_t poolSize) : nextIoCon(0)
{
	if (poolSize <= 0) // We need a positive integer
	{
		throw std::runtime_error("io_context pool size is <= 0.");
	}
	
	/*
	* Give all the io_contexts work to do so that their run() f'ns won't exit until
	* explicitly stopped.
	*/
	for (std::size_t i = 0; i < poolSize; i++)
	{
		iocPtr ioc(new boost::asio::io_context);
		ioContexts.push_back(ioc);
		work.push_back(boost::asio::make_work_guard(*ioc));
	}

	#ifdef DEBUG
	std::clog << "IoContextPool constructor: # of io_contexts = " << ioContexts.size() << std::endl
		<< "\t# of work_guard objects = " << work.size() << std::endl;
	#endif
}

/**
* @desc Runs all io_context objects in the pool.
**/
void IoContextPool::run()
{
	std::vector<boost::shared_ptr<boost::thread>> threads;
	#ifdef DEBUG
	short threadNum = 0;
	#endif

	/* Create a pool of threads to run each io_context */
	#ifdef DEBUG
	std::for_each(ioContexts.cbegin(), ioContexts.cend(), [&threads, &threadNum](iocPtr ptr)
	#else
	std::for_each(ioContexts.cbegin(), ioContexts.cend(), [&threads](iocPtr ptr)
	#endif
		{
			boost::shared_ptr<boost::thread> thread(
				new boost::thread(
					boost::bind(
						&boost::asio::io_context::run,
						ptr
					)
				)
			);
			#ifdef DEBUG
			std::clog << "IoContextPool::run: started thread #" << (threadNum+1) << std::endl;
			++threadNum;
			#endif
			threads.push_back(thread);
		}
	);

	#ifdef DEBUG
	threadNum = 0; // Reset index for next loop
	#endif

	/* Wait for all threads to exit */
	#ifdef DEBUG
	std::for_each(threads.cbegin(), threads.cend(), [&threadNum](boost::shared_ptr<boost::thread> ptr)
	#else
	std::for_each(threads.cbegin(), threads.cend(), [](boost::shared_ptr<boost::thread> ptr)
	#endif
		{
			ptr->join();
			#ifdef DEBUG
			std::clog << "IoContextPool::run: thread #" << (threadNum+1) << " has joined." << std::endl;
			++threadNum;
			#endif
		}
	);
}

/**
* @desc Stops all io_context objects in the pool.
**/
void IoContextPool::stop()
{
	#ifdef DEBUG
	short threadNum = 0;
	#endif

	// Explicitly stop all io_contexts
	#ifdef DEBUG
	std::for_each(ioContexts.cbegin(), ioContexts.cend(), [&threadNum](iocPtr ptr)
	#else
	std::for_each(ioContexts.cbegin(), ioContexts.cend(), [](iocPtr ptr)
	#endif
		{
			ptr->stop();
			#ifdef DEBUG
			std::clog << "IoContextPool::stop: stopped thread #" << (threadNum+1) << std::endl;
			++threadNum;
			#endif
		}
	);
}

/**
* @desc Fetches an io_context to use.
* @return A reference to an io_context that can be used.
**/
boost::asio::io_context& IoContextPool::getIoc()
{
	/* Use a round-robin scheme to choose the next io_context to use */
	#ifdef DEBUG
	std::clog << "IoContextPool::getIoc: current index is " << nextIoCon << std::endl;
	#endif
	boost::asio::io_context& ioc = *ioContexts[nextIoCon];
	nextIoCon = (nextIoCon + 1) % ioContexts.size(); // Increment index, but reset to 0 if it passes the size of the vector
	#ifdef DEBUG
	std::clog << "IoContextPool::getIoc: index after increment & mod is " << nextIoCon << std::endl;
	#endif
	return ioc;
}

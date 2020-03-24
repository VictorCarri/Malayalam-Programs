/* C++ versions of C headers */
#include <cstddef> // std::size_t

/* STL */
#include <stdexcept> // std::runtime_error
#include <vector> // std::vector
#include <algorithm> // std::for_each

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
		throw std::runtime_error("io_context pool size is 0.");
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
}

/**
* @desc Runs all io_context objects in the pool.
**/
void IoContextPool::run()
{
	std::vector<boost::shared_ptr<boost::thread>> threads;

	/* Create a pool of threads to run each io_context */
	std::for_each(ioContexts.cbegin(), ioContexts.cend(), [&threads](iocPtr ptr)
		{
			boost::shared_ptr<boost::thread> thread(
				new boost::thread(
					boost::bind(
						&boost::asio::io_context::run,
						ptr
					)
				)
			);
			threads.push_back(thread);
		}
	);

	/* Wait for all threads to exit */
	std::for_each(threads.cbegin(), threads.cend(), [](boost::shared_ptr<boost::thread> ptr)
		{
			ptr->join();
		}
	);
}

/**
* @desc Stops all io_context objects in the pool.
**/
void IoContextPool::stop()
{
	// Explicitly sto all io_contexts
	std::for_each(ioContexts.cbegin(), ioContexts.cend(), [](iocPtr ptr)
		{
			ptr->stop();
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
	boost::asio::io_context& ioc = *ioContexts[nextIoCon];
	nextIoCon = (nextIoCon + 1) % ioContexts.size(); // Increment index, but reset to 0 if it passes the size of the vector
	return ioc;
}

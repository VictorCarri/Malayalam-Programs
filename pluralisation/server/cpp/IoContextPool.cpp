/* C++ versions of C headers */
#include <cstddef> // std::size_t

/* STL */
#include <stdexcept> // std::runtime_error
#include <vector> // std::vector
#ifdef DEBUG
#include <iostream> // std::cout
#endif
#include <sstream> // std::stringstream

/* Boost */
#include <boost/asio.hpp> // boost::asio::io_context, boost::asio::make_work_guard

/* Our headers */
#include "SharedPtr.hpp" // SHARED_PTR macro
#include "Thread.hpp" // THREAD_CLASS macro
#include "BindFunc.hpp" // BIND_FUNCTION macro
#include "IoContextPool.hpp" // Class def

/**
* @desc Constructor. Creates a pool of the specified size.
* @param poolSize The size of the pool.
**/
IoContextPool::IoContextPool(std::size_t poolSize) : nextIoCon(0)
{
	#ifdef DEBUG
	std::cout << "IoContextPool::IoContextPool: pool size = " << poolSize << std::endl;
	#endif

	if (poolSize <= 0) // We need a positive integer
	{
		std::stringstream ess;
		ess << "IoContextPool::IoContextPool(std::size_t poolSize): pool size (" << poolSize << ") is <= 0.";
		throw std::runtime_error(ess.str());
	}
	
	/*
	* Give all the io_contexts work to do so that their run() f'ns won't exit until
	* explicitly stopped.
	*/
	for (std::size_t i = 0; i < poolSize; i++)
	{
		iocPtr ioc(new boost::asio::io_context);
		#ifdef DEBUG
		std::cout << "IoContextPool::IoContextPool: created io_context ptr #" << (i+1) << std::endl;
		#endif
		ioContexts.push_back(ioc);
		#ifdef DEBUG
		std::cout << "IoContextPool::IoContextPool: added io_context ptr #" << (i+1) << " to the list" << std::endl;
		#endif
		work.push_back(boost::asio::make_work_guard(*ioc));
		#ifdef DEBUG
		std::cout << "IoContextPool::IoContextPool: added work_guard #" << (i+1) << " to the list" << std::endl;
		#endif
	}

	#ifdef DEBUG
	std::cout << "IoContextPool constructor: # of io_contexts = " << ioContexts.size() << std::endl
		<< "\t# of work_guard objects = " << work.size() << std::endl;
	#endif
}

/**
* @desc Runs all io_context objects in the pool.
**/
void IoContextPool::run()
{
	std::vector<SHARED_PTR<THREAD_CLASS>> threads;
	#ifdef DEBUG
	int tno = 1; // Thread #
	#endif

	/* Create the threads */
	for (auto ptr : ioContexts)
	{
		SHARED_PTR<THREAD_CLASS> thread(
			new THREAD_CLASS(
				BIND_FUNCTION(
					&boost::asio::io_context::run,
					ptr
				)
			)
		);
		#ifdef DEBUG
		std::cout << "IoContextPool::run: created thread #" << tno << std::endl;
		++tno;
		#endif
		threads.push_back(thread);
	}

	#ifdef DEBUG
	tno = 1;
	#endif

	/* Wait for all threads to exit */
	for (auto ptr : threads)
	{
		#ifdef DEBUG
		std::cout << "IoContextPool::run: waiting for thread #" << tno << " to join" << std::endl;
		#endif
		ptr->join();
	}
}

/**
* @desc Stops all io_context objects in the pool.
**/
void IoContextPool::stop()
{
	#ifdef DEBUG
	int tno = 1;
	#endif

	for (auto ptr : ioContexts)
	{
		#ifdef DEBUG
		std::cout << "IoContextPool::stop: stopping io_context #" << tno << std::endl;
		#endif
		ptr->stop();
	}
}

/**
* @desc Fetches an io_context to use.
* @return A reference to an io_context that can be used.
**/
boost::asio::io_context& IoContextPool::getIoc()
{
	/* Use a round-robin scheme to choose the next io_context to use */
	#ifdef DEBUG
	std::cout << "IoContextPool::getIoc: current index is " << nextIoCon << std::endl;
	#endif
	boost::asio::io_context& ioc = *ioContexts.at(nextIoCon);
	nextIoCon = (nextIoCon + 1) % ioContexts.size(); // Increment index, but reset to 0 if it passes the size of the vector
	#ifdef DEBUG
	std::cout << "IoContextPool::getIoc: index after increment & mod is " << nextIoCon << std::endl;
	#endif
	return ioc;
}

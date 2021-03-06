#ifndef IOCONTEXTPOOL_HPP
#define IOCONTEXTPOOL_HPP

/* C++ versions of C headers */
#include <cstddef> // std::size_t

/* STL */
#include <vector> // std::vector
#include <list> // std::list

/* Boost */
#include <boost/noncopyable.hpp> // boost::noncopyable
#include <boost/asio.hpp> // boost::asio::io_context, boost::asio::executor_work_guard, boost::asio::io_context::executor_type

/* Our headers */
#include "SharedPtr.hpp" // Defines the macro SHARED_PTR that resolves to either std::shared_ptr or boost::shared_ptr

class IoContextPool : private boost::noncopyable
{
	public:
		/**
		* @desc Constructor. Creates a pool of the specified size.
		* @param poolSize The size of the pool.
		**/
		explicit IoContextPool(std::size_t poolSize);

		/**
		* @desc Runs all io_context objects in the pool.
		**/
		void run();

		/**
		* @desc Stops all io_context objects in the pool.
		**/
		void stop();

		/**
		* @desc Fetches an io_context to use.
		* @return A reference to an io_context that can be used.
		**/
		boost::asio::io_context& getIoc();

	private:
		/* Types */
		typedef SHARED_PTR<boost::asio::io_context> iocPtr;
		typedef boost::asio::executor_work_guard<boost::asio::io_context::executor_type> iocWork;

		/* Properties */
		std::size_t nextIoCon; // Index of the next io_context to use for a connection
		std::vector<iocPtr> ioContexts; // Pool of io_contexts
		std::list<iocWork> work; // The work that keeps the I/O contexts running
};

#endif // IOCONTEXTPOOL_HPP

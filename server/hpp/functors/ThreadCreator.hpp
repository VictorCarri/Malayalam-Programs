#ifndef THREADCREATOR_HPP
#define THREADCREATOR_HPP

/* C++ Standard Library */
#include <vector> // std::vector

/* Our headers */
#include "SharedPtr.hpp" // SHARED_PTR macro, to use either std::shared_ptr or boost::shared_ptr, depending on compile-time options
#include "Thread.hpp" // THREAD_CLASS macro, to use either std::thread or boost::thread, depending on compile-time options

namespace functors
{
	/*
	* This functor creates threads inside IoContextPool. It keeps track of the thread #, and prints it when the preprocessor symbol DEBUG is defined.
	*/
	class ThreadCreator
	{
		public:
			/**
			* @desc Constructor. Creates a new ThreadCreator functor that takes a reference to the list of threads to which we will push back new threads.
			* @param threads A reference to a vector of shared_ptrs to threads. We push_back new threads to this.
			**/
			ThreadCreator(std::vector<SHARED_PTR<THREAD_CLASS>>& threads);
	
			/**
			* @desc Copy constructor.
			* @param other The other functor to copy from.
			**/
			ThreadCreator(const ThreadCreator& other);
	
			/**
			* @desc Copy assignment operator.
			* @param other The other functor to move from.
			**/
			ThreadCreator& operator=(const ThreadCreator& other);
	
			/**
			* @desc Move constructor. Moves data from another ThreadConstructor instance.
			* @param other The other ThreadCreator instance to move from.
			**/
			ThreadCreator(ThreadCreator&& other);
	
			/**
			* @desc Move assignment operator. Moves data from another ThreadConstructor instance.
			* @param other The other ThreadCreator instance to move from.
			**/
			ThreadCreator& operator=(ThreadCreator&& other);
	
			/**
			* @desc Function call operator.
			**/
			void operator()(iocPtr ptr);
	
		private:
			/* Types */
			typedef SHARED_PTR<boost::asio::io_context> iocPtr;
	
			#ifdef DEBUG
			short threadNum; // For debugging
			#endif
	
			std::vector<SHARED_PTR<THREAD_CLASS>>& tvRef; // A reference to the vector to which we add
	}; // class ThreadCreator
}; // namespace functors

#endif // THREADCREATOR_HPP

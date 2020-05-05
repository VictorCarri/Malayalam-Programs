#ifndef FUNCTORS_THREADJOINER_HPP
#define FUNCTORS_THREADJOINER_HPP

/* Our headers */
#include "SharedPtr.hpp" // SHARED_PTR macro
#include "Thread.hpp" // THREAD_CLASS macro

namespace functors
{
	class ThreadJoiner
	{
		/**
		* @desc Default constructor.
		**/
		ThreadJoiner();
		
		/**
		* @desc Copy constructor.
		* @param other Other ThreadJoiner to copy from.
		**/
		ThreadJoiner(const ThreadJoiner& other);

		/**
		* @desc Copy assignment operator.
		* @desc Other ThreadJoiner to copy from.
		**/
		ThreadJoiner& operator=(const ThreadJoiner& other);

		/**
		* @desc Move constructor.
		* @param other Other ThreadJoiner to move from.
		**/
		ThreadJoiner(ThreadJoiner&& other);

		/**
		* @desc Move assignment operator.
		* @param other Other ThreadJoiner to move from.
		**/
		ThreadJoiner& operator=(ThreadJoiner&& other);

		/**
		* @desc Function call. Performs work of joining a thread.
		* @param ptr A SHARED_PTR to a thread to join.
		**/
		void operator()(SHARED_PTR<THREAD_CLASS> ptr);

		private:
			int n; // # of current thread
	};
};

#endif // FUNCTORS_THREADJOINER_HPP

/* STL */
#include <utility> // std::exchange
#ifdef DEBUG
#include <iostream> // std::clog
#endif

/* Our headers */
#include "SharedPtr.hpp" // SHARED_PTR macro
#include "Thread.hpp" // THREAD_CLASS macro
#include "ThreadJoiner.hpp" // Class def'n

/**
* @desc Default constructor.
**/
functors::ThreadJoiner::ThreadJoiner() : n(1)
{
}

/**
* @desc Copy constructor.
* @param other Other functors::ThreadJoiner to copy from.
**/
functors::ThreadJoiner::ThreadJoiner(const functors::ThreadJoiner& other) : n(other.n)
{
}

/**
* @desc Copy assignment operator.
* @desc Other functors::ThreadJoiner to copy from.
**/
functors::ThreadJoiner& functors::ThreadJoiner::operator=(const functors::ThreadJoiner& other)
{
	if (&other == this) // Avoid self-assignment
		return *this;

	n = other.n;

	return *this;
}

/**
* @desc Move constructor.
* @param other Other functors::ThreadJoiner to move from.
**/
functors::ThreadJoiner::ThreadJoiner(functors::ThreadJoiner&& other) : n(std::exchange(other.n, -1))
{
}

/**
* @desc Move assignment operator.
* @param other Other functors::ThreadJoiner to move from.
**/
functors::ThreadJoiner& functors::ThreadJoiner::operator=(functors::ThreadJoiner&& other)
{
	if (&other == this) // Avoid self-assignment
		return *this;

	n = std::exchange(other.n, -1);

	return *this;
}

/**
* @desc Function call. Performs work of joining a thread.
* @param ptr A SHARED_PTR to a thread to join.
**/
void functors::ThreadJoiner::operator()(SHARED_PTR<THREAD_CLASS> ptr)
{
	ptr->join(); // Wait for this thread to join
	#ifdef DEBUG
	std::clog << "functors::ThreadJoiner::operator(): thread #" << n << " has joined" << std::endl;
	#endif
	++n;
}

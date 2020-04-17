/* STL */
#include <utility> // std::exchange
#ifdef DEBUG
#include <iostream> // std::cout
#endif

/* Boost */
#include <boost/asio.hpp> // boost::asio::io_context::run

/* Our headers */
#include "SharedPtr.hpp" // Macro SHARED_PTR
#include "Thread.hpp" // Macro THREAD_CLASS
#include "BindFunc.hpp" // Macro BIND_FUNC: resolves to either std::bind or boost::bind
#include "functors/ThreadCreator.hpp" // class definition

/**
* @desc Constructor. Creates a new ThreadCreator functor that takes a reference to the list of threads to which we will push back new threads.
* @param threads A reference to a vector of shared_ptrs to threads. We push_back new threads to this.
**/
functors::ThreadCreator::ThreadCreator(std::vector<SHARED_PTR<THREAD_CLASS>>& threads) :
	tvRef(threads)
#ifdef DEBUG
	, threadNum(1)
#endif
{
}

/**
* @desc Copy constructor.
* @param other The other functor to copy from.
**/
functors::ThreadCreator::ThreadCreator(const functors::ThreadCreator& other) : 
	tvRef(other.tvRef)
#ifdef DEBUG
	,threadNum(other.threadNum)
#endif
{
}

/**
* @desc Copy assignment operator.
* @param other The other functor to move from.
**/
functors::ThreadCreator& functors::ThreadCreator::operator=(const functors::ThreadCreator& other)
{
	if (&other == this) // Avoid self-assignment
		return *this;

	tvRef = other.tvRef;
	#ifdef DEBUG
	threadNum = other.threadNum;
	#endif

	return *this; // Allow chaining
}

/**
* @desc Move constructor. Moves data from another ThreadConstructor instance.
* @param other The other ThreadCreator instance to move from.
**/
functors::ThreadCreator::ThreadCreator(functors::ThreadCreator&& other) :
	tvRef(other.tvRef)
#ifdef DEBUG
	,threadNum(std::exchange(other.threadNum, -1))
#endif
{
}

/**
* @desc Move assignment operator. Moves data from another ThreadConstructor instance.
* @param other The other ThreadCreator instance to move from.
**/
functors::ThreadCreator& functors::ThreadCreator::operator=(functors::ThreadCreator&& other)
{
	if (&other == this) // Avoid self-assignment
		return *this;

	tvRef = other.tvRef;
	#ifdef DEBUG
	threadNum = std::exchange(other.threadNum, -1);
	#endif

	return *this; // Allow chaining
}

/**
* @desc Function call operator.
**/
void functors::ThreadCreator::operator()(functors::ThreadCreator::iocPtr ptr)
{
	/* Create a thread that'll run boost::asio functions using a particular io_context */
	SHARED_PTR<THREAD_CLASS> thread(
		new THREAD_CLASS(
			BIND_FUNCTION(
				&boost::asio::io_context::run,
				ptr
			)
		)
	);

	#ifdef DEBUG
	std::cout << "functors::ThreadCreator::operator(): created thread #" << threadNum << std::endl;
	++threadNum;
	#endif

	tvRef.push_back(thread); // Add the thread to the given list
}

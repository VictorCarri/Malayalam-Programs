/* Standard C++ */
#include <utility> // std::exchange
#ifdef DEBUG
#include <iostream> // std::clog
#endif

/* Our headers */
#include "functors/IOCStopper.hpp" // Class def'n

#ifdef DEBUG
/**
* @desc Default constructor. Initialises the counter. Thus, it only needs to exist in debug mode.
**/
functors::IOCStopper::IOCStopper() : n(1)
{
}

/**
* @desc Copy constructor. Only needs to exist in debug mode, since we only have data (the counter) then.
* @param other The other IOCStopper to copy from.
**/
functors::IOCStopper::IOCStopper(const functors::IOCStopper& other) : n(other.n)
{
}

/**
* @desc Copy assignment operator. Only needs to exist in debug mode, since we only have data (the counter) then.
* @param other The other IOCStopper to copy from.
**/
functors::IOCStopper& functors::IOCStopper::operator=(const functors::IOCStopper& other)
{
	if (&other == this) // Self-assignment check
		return *this;

	n = other.n;

	return *this; // Allow chaining
}

/**
* @desc Move constructor. Only needs to exist in debug mode, since we only have data (the counter) then.
* @param other The other IOCStopper to move from.
**/
functors::IOCStopper::IOCStopper(functors::IOCStopper&& other) : n(std::exchange(other.n, -1))
{
}

/**
* @desc Move assignment operator. Only needs to exist in debug mode, since we only have data (the counter) then.
* @param other The other IOCStopper to move from.
**/
functors::IOCStopper& functors::IOCStopper::operator=(functors::IOCStopper&& other)
{
	if (&other == this)
		return *this;

	n = std::exchange(other.n, -1);

	return *this;
}
#endif

/**
* @desc Function call operator. Stops the io_context pointed to by iocPtr.
* @param ptr A pointer to the io_context to stop.
**/
void functors::IOCStopper::operator()(functors::IOCStopper::iocPtr ptr)
{
	ptr->stop(); // Stop the given thread
	#ifdef DEBUG
	std::clog << "functors::IOCStopper::operator(): stopped thread #" << n << std::endl;
	++n; // Increment counter for next call
	#endif
}

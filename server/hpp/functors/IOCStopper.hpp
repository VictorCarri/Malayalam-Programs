#ifndef FUNCTORS_IOCSTOPPER_HPP
#define FUNCTORS_IOCSTOPPER_HPP

/* Boost */
#include <boost/asio.hpp> // boost::asio::io_context

/* Our headers */
#include "SharedPtr.hpp" // SHARED_PTR macro

namespace functors
{
	/*
	* This functor stops each thread it is passed.
	*/
	class IOCStopper
	{
		public:
			#ifdef DEBUG
			/**
			* @desc Default constructor. Initialises the counter. Thus, it only needs to exist in debug mode.
			**/
			IOCStopper();

			/**
			* @desc Copy constructor. Only needs to exist in debug mode, since we only have data (the counter) then.
			* @param other The other IOCStopper to copy from.
			**/
			IOCStopper(const IOCStopper& other);

			/**
			* @desc Copy assignment operator. Only needs to exist in debug mode, since we only have data (the counter) then.
			* @param other The other IOCStopper to copy from.
			**/
			IOCStopper& operator=(const IOCStopper& other);

			/**
			* @desc Move constructor. Only needs to exist in debug mode, since we only have data (the counter) then.
			* @param other The other IOCStopper to move from.
			**/
			IOCStopper(IOCStopper&& other);

			/**
			* @desc Move assignment operator. Only needs to exist in debug mode, since we only have data (the counter) then.
			* @param other The other IOCStopper to move from.
			**/
			IOCStopper& operator=(IOCStopper&& other);
			#endif

			/**
			* @desc Function call operator. Stops the io_context pointed to by iocPtr.
			* @param ptr A pointer to the io_context to stop.
			**/
			void operator()(iocPtr ptr);
	
		private:
			/* Types */
			typedef SHARED_PTR<boost::asio::io_context> iocPtr;
			int n; // Counter for thread # in debug messages

	}; // class IOCStopper
}; // namespace functors

#endif // FUNCTORS_IOCSTOPPER_HPP

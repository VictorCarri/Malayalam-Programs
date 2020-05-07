#ifndef MPP_FUNCTORS_PTRRESETTER_HPP
#define MPP_FUNCTORS_PTRRESETTER_HPP

/* Standard C++ */
#include <memory> // std::unique_ptr
#include <sstream> // std::stringstream

namespace mpp
{
	namespace functors
	{
		/**
		* A functor that resets stringstream pointers with a new one.
		**/
		class PtrResetter
		{
			public:
				/**
				* @desc Resets the given pointer with a new stringstream.
				* @param ptr A reference to the unique_ptr object to reset.
				**/
				void operator()(std::unique_ptr<std::stringstream>& ptr);
		};
	};
};

#endif // MPP_FUNCTORS_PTRRESETTER_HPP

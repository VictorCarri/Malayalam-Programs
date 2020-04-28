#ifndef MPP_FUNCTORS_PTRRESETTER_HPP
#define MPP_FUNCTORS_PTRRESETTER_HPP

/* STL */
#include <memory> // std::unique_ptr
#include <sstream> // std::stringstream

namespace mpp
{
	namespace functors
	{
		class PtrResetter
		{
			public:
				/**
				* @desc Resets the given pointer (replaces the stringstream inside with a new one).
				* @param ptr The pointer to reset.
				**/
				void operator()(std::unique_ptr<std::stringstream>& ptr);
		};
	};
};

#endif // MPP_FUNCTORS_PTRRESETTER_HPP

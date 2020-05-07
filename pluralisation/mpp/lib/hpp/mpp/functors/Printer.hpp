#ifndef MPP_FUNCTORS_PRINTER_HPP
#define MPP_FUNCTORS_PRINTER_HPP

/* Standard C++ */
#include <utility> // std::swap

namespace mpp
{
	namespace functors
	{
		/**
		* A functor template that prints whatever is passed to it to the std::ostream that is given upon construction.
		**/
		template<typename T, class Stream>
		class Printer
		{
			public:
				/**
				* @desc Constructor. Stores a reference to the stream to print to.
				* @param strm A reference to the stream to print to.
				**/
				Printer(Stream& strm) : s(strm) // Save the reference
				{
				}

				/**
				* @desc Prints the given object.
				* @param obj The object to print.
				**/
				void operator()(T obj)
				{
					s << obj << ","; // Insert the object into the stream
				}

				/**
				* @desc Copy constructor. Copies the reference from another Printer object.
				* @param other The other printer object to copy from.
				**/
				Printer(const Printer& other) : s(other.s)
				{
				}

				/**
				* @desc Copy and move assignment operator. Copies the reference from another Printer object.
				* @param other The other printer object to copy from.
				**/
				Printer& operator=(Printer& other) noexcept
				{
					std::swap(s, other.s);
					return *this;
				}

				/**
				* @desc Move constructor. Copies the reference from another Printer object.
				* @param other The other printer object to copy from.
				**/
				Printer(Printer&& other) : s(other.s)
				{
				}

			private:
				Stream& s; // A reference to the stream to write to
		};
	};
};

#endif // MPP_FUNCTORS_PRINTER_HPP

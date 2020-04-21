#ifndef MPP_FUNCTORS_PRINTER_HPP
#define MPP_FUNCTORS_PRINTER_HPP

namespace mpp
{
	namespace functors
	{
		/**
		* A functor that prints whatever is passed to it to the std::ostream that is given upon construction.
		**/
		template<class T, class Stream>
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

			private:
				Stream& s; // A reference to the stream to write to
		};
	};
};

#endif // MPP_FUNCTORS_PRINTER_HPP

#ifndef MPP_FUNCTORS_HEADERFINDER_HPP
#define MPP_FUNCTORS_HEADERFINDER_HPP

/* STL */
#include <string> // std::string

namespace mpp
{
	namespace functors
	{
		/**
		* Checks if the Header given in operator() has a name that matches the one given in the constructor.
		**/
		class HeaderFinder
		{
			public:
				/**
				* @desc Constructor. Stores the name to search for.
				* @param nm The name to search for.
				**/
				HeaderFinder(std::string nm);
		
				/**
				* @desc Checks the given Header to see if its name matches the one we were constructed with.
				* @param h The header to check the name of.
				* @return True if the header's name matches $name, false otherwise.
				**/	
				bool operator()(const Header h);

				/**
				* @desc Copy constructor.
				* @param other The other functor to copy from.
				**/
				HeaderFinder(const HeaderFinder& other);

				/**
				* @desc Copy assignment operator.
				* @param other The other functor to copy from.
				* @return *this, to allow chaining.
				**/
				HeaderFinder& operator=(const HeaderFinder& other);
	
				/**
				* @desc Move constructor.
				* @param other The other functor to move from.
				**/
				HeaderFinder(HeaderFinder&& other);

				/**
				* @desc Move assignment operator.
				* @param other The other functor to move from.
				* @return *this, to allow chaining.
				**/
				HeaderFinder& operator=(HeaderFinder&& other);

			private:
				std::string name;
		};
	};
};

#endif // MPP_FUNCTORS_HEADERFINDER_HPP

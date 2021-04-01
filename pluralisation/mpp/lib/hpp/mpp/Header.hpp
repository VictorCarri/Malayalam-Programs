#ifndef MPP_HEADER_HPP
#define MPP_HEADER_HPP

/* STL */
#include <string> // std::string

/* Boost or STL? */
#include "bosmacros/any.hpp" // ANY_CLASS

namespace mpp
{
	class Header
	{
		public:
			/**
			* @name Constructor.
			* @desc Contructs a Header with the given name and value.
			**/
			Header(std::string name, ANY_CLASS value);

			/**
			* @desc Fetches this header's name.
			* @return This header's name.
			**/
			std::string getName() const;

			/**
			* @desc Fetches this header's value.
			* @return This header's value.
			**/
			ANY_CLASS getValue() const;

			/**
			* @desc Copy constructor.
			* @param other The other Header object to copy values from.
			**/
			Header(const Header& other);

			/**
			* @desc Move constructor.
			* @param other The other Header object to move values from.
			**/
			Header(Header&& other);

			/**
			* @desc Copy assignment operator.
			* @param other The other Header object to copy values from.
			**/
			Header& operator=(const Header& other);

			/**
			* @desc Move assignment operator.
			* @param other THe other Header object to move values from.
			**/
			Header& operator=(Header&& other);

			/**
			* @desc Default constructor.
			**/
			Header();

		private:
			std::string _name;
			ANY_CLASS _value;
	};
};

#endif // MPP_HEADER_HPP

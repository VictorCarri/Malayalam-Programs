#ifndef MPP_HEADER_HPP
#define MPP_HEADER_HPP

/* STL */
#include <string> // std::string

namespace mpp
{
	class Header
	{
		public:
			/**
			* @name Constructor.
			* @desc Contructs a Header with the given name and value.
			**/
			Header(std::string name, std::string value);

			/**
			* @desc Fetches this header's name.
			* @return This header's name.
			**/
			std::string getName() const;

			/**
			* @desc Fetches this header's value.
			* @return This header's value.
			**/
			std::string getValue() const;

		private:
			std::string _name;
			std::string _value;
	};
};

#endif // MPP_HEADER_HPP

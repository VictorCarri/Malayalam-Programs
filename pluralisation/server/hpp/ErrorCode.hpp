#ifndef ERRORCODE_HPP
#define ERRORCODE_HPP

/* Default to boost::system::error_code */

#ifdef USE_STD_ERROR_CODE
#include <system_error> // std::error_code
#define ERROR_CODE std::error_code

#else
#include <boost/system/error_code.hpp> // boost::system::error_code
#define ERROR_CODE boost::system::error_code

#endif

#endif // ERRORCODE_HPP

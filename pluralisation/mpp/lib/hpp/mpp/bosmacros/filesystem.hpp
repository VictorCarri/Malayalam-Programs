#ifndef MPP_BOSMACROS_FILESYSTEM_HPP
#define MPP_BOSMACROS_FILESYSTEM_HPP

/* Should we use Boost or STD? */

/* If this token was defined in the call to the compiler (-DUSE_STD_FILESYSTEM), we should use std::filesystem */
#ifdef USE_STD_FILESYSTEM
#	include <filesystem> // std::filesystem::path
#	define FILESYSTEM_PATH std::filesystem::path
#	define FILESYSTEM_EXISTS std::filesystem::exists
#	include <fstream> // std::ifstream
#	define IFSTREAM std::ifstream

/* Default to Boost if no -D... option was passed */
#else
#	include <boost/filesystem.hpp>
#	define FILESYSTEM_PATH boost::filesystem::path
#	define FILESYSTEM_EXISTS boost::filesystem::exists
#	define IFSTREAM boost::filesystem::ifstream

#endif // USE_STD_FILESYSTEM

#endif // MPP_BOSMACROS_FILESYSTEM_HPP

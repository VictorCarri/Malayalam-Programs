#ifndef MPP_DATA_DBINFO_HPP
#define MPP_DATA_DBINFO_HPP

/* Our headers */
#include "bosmacros/filesystem.hpp" // FILESYSTEM_PATH macro

namespace mpp
{
	namespace data
	{
		/**
		* @desc Loads database info from file at the given path, or throws an exception.
		*	It thereafter provides read-only access to the values.
		**/
		class DBInfo
		{
			public:
				/**
				* @desc Constructor. Attempts to parse the file @ the given path and load DB info from it.
				*	The file is assumed have lines of the format "$key=$value", one per line.
				*	The expected keys are "db" (DB name), "user" (DB user), "password" (DB password), and "host" (DB host).
				* @param cfPath The path of the file to load data from.
				**/
				DBInfo(FILESYSTEM_PATH cfPath);

				/**
				* @desc Fetches the name of the user to use when connecting to the DB.
				* @return The name of the user to use when connecting to the DB.
				**/
				std::string getUser() const;

				/**
				* @desc Fetches the password to use when connecting to the DB.
				* @return The password to use when connecting to the DB.
				**/
				std::string getPassword() const;

				/**
				* @desc Fetches the host to connect to.
				* @return The host to connect to.
				**/
				std::string getHost() const;

				/**
				* @desc Fetches the name of the DB to open on connection.
				* @return The name of the DB to open on connection.
				**/
				std::string getDBName() const;

			private:
				/* DB connection info vars */
				std::string user;
				std::string password;
				std::string host;
				std::string db;
		};
	};
};

#endif // MPP_DATA_DBINFO_HPP

#ifndef MPP_REQUEST_HPP
#define MPP_REQUEST_HPP

/* STL */
#include <forward_list> // std::forward_list
#include <string> // std::string
#include <any> // std::any

/* Because I keep switching */
#define GETCOM_FUNC getCommand
#define SETCOM_FUNC setCommand

namespace mpp
{
	class Request
	{
		public:
			enum Command
			{
				FOF, // Find opposite form (singular -> plural, plural -> singular),
				ISSING, // Determine whether or not the current form is singular
				INVALID // A Request object is initialised to use this 
			};
	
			/**
			* @desc Default constructor. Initialises the command to an invalid one.
			**/
			Request();
	
			/**
			* @desc Sets the command associated with this request.
			**/
			void SETCOM_FUNC(Command com);
	
			/**
			* @desc Fetches the command associated with this request.
			**/
			Command GETCOM_FUNC() const;

			/**
			* @desc Creates and adds a Header to this request with the given name and value.
			* @param name The header's name.
			* @param value The header's value.
			**/
			void addHeader(std::string name, std::any value);

			/**
			* @desc Attempts to find a Header by the given name.
			* @throws mpp::exceptions::UnknownHeader if a Header with the given name isn't found.
			* @return The header with the given name.
			**/
			Header findHeader(std::string name);

			/**
			* @desc Stores the given noun in the Request object to be pluralised later.
			* @param noun The noun to store.
			**/
			void setNoun(std::string noun);

			/**
			* @desc Fetches the noun associated with this request.
			* @return This request's noun.
			**/
			std::string getNoun() const;
	
		private:
			Command c; // The command which this request asks the server to perform
			std::forward_list<Header> headers; // A list of request headers
			std::string noun; // The noun given with this request
	};
};

#endif // MPP_REQUEST_HPP

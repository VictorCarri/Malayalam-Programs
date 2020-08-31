#ifndef MPP_REQUEST_HPP
#define MPP_REQUEST_HPP

/* STL */
#include <forward_list> // std::forward_list
#include <string> // std::string
#include <vector> // std::vector
#include <map> // std::map
#include <array> // std::array
#include <ostream> // std::ostream

/* Our headers */
#include "bosmacros/any.hpp" // ANY_CLASS macro
#include "mpp/Header.hpp" // Header class

/* Boost */
#include <boost/asio/buffer.hpp> // boost::asio::const_buffer

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
				INVALID = 0, // A Request object is initialised to use this 
				FOF, // Find opposite form (singular -> plural, plural -> singular),
				ISSING, // Determine whether or not the current form is singular
			};

			typedef ANY_CLASS any_type ; // To make things easier for library clients
	
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
			void addHeader(std::string name, ANY_CLASS value);

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

			/**
			* @desc Converts the Request object to a sequence of constant buffers, suitable for network transport.
			* @return A vector of constant buffers, containing text that represents this Request object.
			**/
			std::vector<boost::asio::const_buffer> toBuffers() const;

			/**
			* @desc Calculates the size of the request as a string.
			* @return The size of this request as a string.
			**/
			typename std::string::size_type size() const;

			/**
			* @desc Clears our list of headers.
			**/
			void clearHeaders();

		private:
			/*** Methods ***/

			/**
			* @desc Write ourselves to a stream.
			* @param os The stream to write to.
			**/
			void writeToStream(std::ostream& os) const;

			/*** Properties ***/
			Command c; // The command which this request asks the server to perform
			std::forward_list<mpp::Header> headers; // A list of request headers
			std::string noun; // The noun given with this request
			std::map<Command, std::string> verbNames; // Maps a verb enum to a string describing it for network transport
			const std::array<char, 2> crlf; // Used to represent the sequence "\r\n"
			const std::array<char, 2> nameValSep; // Contains the ':' and space that separate a header name from its value

			/**
			* Friend declaration to allow operator<< to access private members.
			**/
			friend std::ostream& operator<<(std::ostream& os, const mpp::Request& req);
	}; // class Request

	/**
	* @desc An overload for the insertion operator that prints an MPP request.
	* @param os The output stream to write to.
	* @param req The mpp::Request object to write.
	* @return A reference to the output stream, to allow chaining of operator<<.
	**/
	std::ostream& operator<<(std::ostream& os, const mpp::Request& req);

}; // namespace mpp
#endif // MPP_REQUEST_HPP

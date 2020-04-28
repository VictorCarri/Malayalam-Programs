#ifndef MPP_REPLY_HPP
#define MPP_REPLY_HPP

/* STL */
#include <string> // std::string
#include <vector> // std::vector
#include <forward_list> // std::forward_list
#include <array> // std::array

/* Boost */
#include <boost/asio.hpp> // boost::asio::const_buffer

/* Our header */
#include "mpp/Header.hpp" // mpp::Header, to represent response headers

namespace mpp
{
	/*
	* Represents a reply to a request.
	*/
	class Reply
	{
		public:
			enum Status // Reply status
			{
				/* OK (2xx) codes */
				singular = 200, // Positive response to an ISSING query
				plural, // Negative response to an ISSING query
				pluralForm, // Responding to a FOF query with the plural form of singular input
				singularForm, // Responding to a FOF query with the singular form of plural input

				/* Client error (4xx) codes */
				badReq = 400, // Malformed request
				badMajor, // Bad major #
				badMinor, // Bad minor #
				badPatch, // Bad patch #
				unknownVerb, // Unrecognised MPP verb
				invMalChar, // Invalid Malayalam characters in input
				invBool, // Invalid Boolean given in FOF query

				/* Other */
				invalid = -1 // Used when a Reply is default-constructed.
			};
	
			/**
			* @desc Sets a reply's status.
			**/
			void setStatus(Status s);

			/**
			* @desc Converts the Reply into a vector of buffers that Boost.Asio can send over the network.
			*	The buffers don't own the underlying memory blocks.
			*	Therefore, the Reply object must remain valid and
			*	unchanged until the write operation has completed.
			**/
			std::vector<boost::asio::const_buffer> toBuffers();

			/**
			* @name Default constructor.
			* @desc Constructs an invalid reply and sets up the status text map.
			**/
			Reply();

			/**
			* @desc Adds the given Header object to this Reply object's list of headers.
			**/
			void addHeader(mpp::Header toAdd);

			/**
			* @desc Copy constructor.
			* @param other Other Reply object to copy from.
			**/
			Reply(const Reply& other);

			/**
			* @desc Copy assignment operator.
			* @param other Other Reply object to copy from.
			* @return this
			**/
			Reply& operator=(const Reply& other);

			/**
			* @desc Move constructor.
			* @param other Other Reply object to move from.
			**/
			Reply(Reply&& other);

			/**
			* @desc Move assignment operator.
			* @param other Other Reply object to move from.
			* @return this
			**/
			Reply& operator=(Reply&& other);

			/**
			* @desc Fetches the string associated with the given status.
			* @param s THe status to fetch a string for.
			**/
			std::string getStatText(Status s);
	
		private:
			std::map<Status, std::string> statText; // Text for each status
			Status stat; // This reply's status
			std::forward_list<mpp::Header> headers; // List of headers to send with the reply
			//const char crlf[] = { '\r', '\n' };
			const std::array<char, 2> crlf;
			std::string content;
	};
};

#endif // MPP_REPLY_HPP

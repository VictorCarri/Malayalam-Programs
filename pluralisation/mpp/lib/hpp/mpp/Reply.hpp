#ifndef MPP_REPLY_HPP
#define MPP_REPLY_HPP

/* STL */
#include <string> // std::string
#include <vector> // std::vector
#include <forward_list> // std::forward_list
#include <array> // std::array
#include <map> // std::map

/* Boost */
#include <boost/asio/buffer.hpp> // boost::asio::const_buffer

/* Our headers */
#include "bosmacros/any.hpp" // ANY_CLASS
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
				noPlural, // The given noun in a FOF query that seeks the plural form has no plural form, according to the DB
				noSingular, // The given noun in a FOF query that seeks the singular form has no singular form, according to the DB

				/* Client error (4xx) codes */
				badReq = 400, // Malformed request
				badMajor, // Bad major #
				badMinor, // Bad minor #
				badPatch, // Bad patch #
				unknownVerb, // Unrecognised MPP verb
				invUTF8, // Invalid UTF-8 characters in input

				/* Other */
				invalid = -1 // Used when a Reply is default-constructed, or when an invalid code is set
			};

			/**
			* @desc Fetches the reply's status.
			* @return This reply's status.
			**/
			Status getStatus() const;

			/**
			* @desc Attempts to set the Reply's status to that of the numeric code given.
			*	RepParser ensures that the numeric code is in the valid range for the enumeration.
			* @param code The code to set.
			**/
			void setStatus(short code);
	
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
			* @desc Fetches the string associated with the given status.
			* @param s THe status to fetch a string for.
			**/
			std::string getStatText(Status s) const;

			/**
			* @desc Sets the content to send with the reply.
			* @param c The content to store in this reply.
			**/
			void setContent(std::string c);

			/**
			* @desc Uses in-place construction to add a Header to our list.
			* @param name The header's name.
			* @param val The header's value.
			**/
			void addHeader(std::string name, ANY_CLASS val);

			/**
			* @desc Fetches a stock reply for a given status.
			* @param stat The status to fetch a stock reply for.
			* @return A Reply object containing a stock string for the given status.
			**/
			static Reply stockReply(Reply::Status stat);

			/**
			* @desc Copy constructor.
			* @param other The other Reply object to copy from.
			**/
			Reply(const Reply& other);

			/**
			* @desc Copy assignment operator.
			* @param other The other Reply object to copy from.
			* @return A reference to this.
			**/
			Reply& operator=(const Reply& other);

			/**
			* @desc Clears this Reply object's list of headers.
			**/
			void clearHeaders();
	
		private:
			#ifdef DEBUG
			/**
			* @desc This method prints the reply buffers.
			**/
			void printRepBufs();

			/**
			* @desc This method prints the reply buffer contents held in the vector of strings.
			**/
			void printRepBufConts();
			#endif

			Status stat; // This reply's status
			std::forward_list<mpp::Header> headers; // List of headers to send with the reply
			std::map<Status, std::string> statText; // Text for each status
			std::string content; // The reply's content
			const std::array<char, 2> crlf; // CR/LF sequence to be used in the reply
			const std::array<char, 2> nameValSep; // Separates a header name from its value
			std::forward_list<std::string> repBufConts; // Holds the contents of the buffers so that they won't contain garbage deleted strings
			std::vector<boost::asio::const_buffer> repBufs; // Holds this reply as a vector of buffers. Made it a member so that it won't get deleted before the Reply goes out of scope.

			/**
			* Friend declaration to allow operator<< to access private members.
			**/
			friend std::ostream& operator<<(std::ostream& os, const mpp::Reply& req);
	};

	/**
	* @desc An overload for the insertion operator that prints an MPP reply.
	* @param os The output stream to write to.
	* @param req The mpp::Reply object to write.
	* @return A reference to the output stream, to allow chaining of operator<<.
	**/
	std::ostream& operator<<(std::ostream& os, const Reply& req);
};

#endif // MPP_REPLY_HPP

Requests
=========
A request will be of the form:
	
	MPP/{version}{space}{verb}\r\n
	{headerName}:{space}{string}\r\n...
	\r\n
	{arg}

{verb} refers to the action which the server should perform and {arg} refers to any arguments which the server requires.
{version} will be of the form [number].[number].[number], with the major version first, the minor version second, and the patch version third.
Each line will be separated by \r\n. The protocol/verb & header lines will be separated from the body (Malayalam noun) by 2 \r\n sequences.
The parser will read $ContentLength BYTES after the final \r\n\r\n sequence for the value.
The protocol and header lines will be in ASCII. Only the argument will be encoded in UTF-8 (the default), although I may extend the server to process other encodings later.

Headers
-------

Header Name	|	Header Value
----------------|-------------------------------------------------------------
Content-Length	|	Length of the Malayalam noun in BYTES, NOT codepoints!
------------------------------------------------------------------------------
Content-Type	|	Type of the input (text/plain;charset=utf-8)

An attempt to specify it in BNR form:

Request -> protLine headers argument
protLine -> "MPP/" integer "." integer "." integer space verb "\r\n"
space -> ' ' | '\t';
verb -> "ISSING" | "FOF";
headers -> header header\* "\r\n"
header -> name ':' space string "\r\n"
string -> [char]+
char -> [a-zA-Z0-9-] # any character except \r or \n
argument -> [byte]+
byte -> 0 | 1 | ... | 255
integer -> [0-9]+

Responses
==========
A response will be of the form:
	
	MPP/{version}{space}{code}\r\n
	{headerName}:{space}{headerVal}\r\n...
	\r\n
	{response}
,

where {code} is a numeric code which follows the same format as HTTP codes. (2xx for OK, 4xx for client error, 5xx for server error).

In BNR form:

Reply -> protLine headers argument
protLine -> "MPP/" integer "." integer "." integer space code lineTerm
code -> digit{3} space codeStr lineTerm
codeStr -> "Singular" | "Plural" | "Plural Form" | "Singular Form" | ...
headers -> header header\* lineTerm
header -> string ':' space string lineTerm
space -> ' ' | '\t'
integer -> digit+
digit -> [0-9]
string -> byte+
byte -> static_cast<char>([0-255]) # Interpreted as a character
response -> [byte]+ | NULL # The response may be empty (eg. in a response to an ISSING request)
lineTerm -> "\r\n"

Acceptable commands:
=====================
These are listed in the form {verb} {arg}...

ISSING {str noun}
-----------------
Checks whether the given noun is singular or not. Possible OK responses:

	MPP/1.0{space}200 Singular\r\n\r\n

or
	MPP/1.O{space}201 Plural\r\n\r\n
. 

If {noun} contains non-Malayalam characters, the response:
	
	MPP/1.0\r\n405\r\nNon-Malayalam Characters\r\n

will be returned.

FOF {noun: "str"}
----------------------------------------
Finds the opposite form of the given noun. If it is singular, the plural form is returned. Otherwise, the singular form is returned. Possible responses:

	MPP/1.0 202 Plural Form\r\n{plural form}\r\n\r\n

or

	MPP/1.0 203 Singular Form\r\n{singular form}\r\n\r\n

or

	MPP/1.0 204 No Plural Form\r\n\r\n
		Used when the singular Malayalam noun given in a FOF request has no plural

or

	MPP/1.0 205 No Singular Form
		Used when the plural Malayalam noun given in a FOF request has no singular

Misc Errors
------------
MPP/1.0 400 Bad Request
	- Reply used when a request is malformed in general

MPP/1.0 401 Bad Major #
	- Reply used when the server doesn't recognize the major # of the procotol in the request

MPP/1.0 402 Bad Minor #
	- Reply used when the server doesn't recognize the minor # of the procotol in the request

MPP/1.0 403 Bad Patch #
	- Reply used when the server doesn't recognize the patch # of the procotol in the request

MPP/1.0 404 Unknown Verb
	- Used when the server doesn't recognise the verb which a request included

MPP/1.0 405 Malformed UTF-8 Input
	- Used when the Malayalam noun isn't a valid UTF-8 string

MPP/1.0 500 Internal Server Error
	- Used when some sort of error occurs while handling a request

MPP/1.0 501 Not Implemented

MPP/1.0 502 Service Unavailable

Blahblah

Headers
-------
The initial version of the protocol uses only 1 header.

Content-Length: {integer}
=========================
The length of the following data in <b>BYTES</b>.

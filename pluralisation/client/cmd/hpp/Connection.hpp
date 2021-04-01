#ifndef CONNECTION_HPP
#define CONNECTION_HPP

/* Boost */
#include <boost/noncopyable.hpp> // boost::noncopyable

/* Our headers */
#include "bosmacros/enable_shared_from_this.hpp" // ENABLE_SHARED_FROM_THIS macro

/**
* This class represents an abstract connection to the server.
* It is meant to be used as a base class for more specific connection types,
* one for each type of request. It is made non-copyable to emphasize that only
**/
class Connection : public ENABLE_SHARED_FROM_THIS<Connection>, private boost::noncopyable
{
};

#endif // CONNECTION_HPP

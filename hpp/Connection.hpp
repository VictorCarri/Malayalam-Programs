#ifndef CONNECTION_HPP
#define CONNECTION_HPP

/* Boost */
#include <boost/enable_shared_from_this.hpp> // boost::enable_shared_from_this
#include <boost/noncopyable.hpp> // boost::noncopyable
#include <boost/asio.hpp> // boost::asio::io_context

class Connection : public boost::enable_shared_from_this<Connection>,
			private boost::noncopyable
{
	public:
		explicit Connection(
	private:
};
#endif // CONNECTION_HPP

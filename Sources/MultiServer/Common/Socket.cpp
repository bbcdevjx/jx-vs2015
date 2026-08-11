#include "stdafx.h"
#include "Socket.h"
#include "Macro.h"

/*
 * namespace OnlineGameLib::Win32
 */

namespace OnlineGameLib {
namespace Win32 {

static void PumpSocketWaitMessages()
{
	MSG message;
	while (::PeekMessage(&message, NULL, 0, 0, PM_REMOVE))
	{
		if (message.message == WM_QUIT)
		{
			::PostQuitMessage(static_cast<int>(message.wParam));
			continue;
		}
		if ((message.message >= WM_KEYFIRST && message.message <= WM_KEYLAST) ||
			(message.message >= WM_MOUSEFIRST && message.message <= WM_MOUSELAST) ||
			message.message == WM_CLOSE)
			continue;
		::TranslateMessage(&message);
		::DispatchMessage(&message);
	}
}

static int ConnectWithTimeout(SOCKET socketHandle, const sockaddr* address, int addressLength)
{
	u_long nonBlocking = 1;
	if (::ioctlsocket(socketHandle, FIONBIO, &nonBlocking) == SOCKET_ERROR)
		return ::WSAGetLastError();

	int result = ::connect(socketHandle, address, addressLength);
	if (result == SOCKET_ERROR)
	{
		int error = ::WSAGetLastError();
		if (error != WSAEWOULDBLOCK && error != WSAEINPROGRESS)
		{
			nonBlocking = 0;
			::ioctlsocket(socketHandle, FIONBIO, &nonBlocking);
			return error;
		}

		DWORD waitStarted = ::GetTickCount();
		do
		{
			fd_set writable;
			fd_set failed;
			FD_ZERO(&writable);
			FD_ZERO(&failed);
			FD_SET(socketHandle, &writable);
			FD_SET(socketHandle, &failed);
			timeval timeout;
			timeout.tv_sec = 0;
			timeout.tv_usec = 50000;
			result = ::select(0, NULL, &writable, &failed, &timeout);
			PumpSocketWaitMessages();
			if (result != 0)
				break;
		} while (::GetTickCount() - waitStarted < 4000);

		if (result <= 0)
			error = (result == 0) ? WSAETIMEDOUT : ::WSAGetLastError();
		else
		{
			int socketError = 0;
			int optionLength = sizeof(socketError);
			if (::getsockopt(socketHandle, SOL_SOCKET, SO_ERROR,
				reinterpret_cast<char*>(&socketError), &optionLength) == SOCKET_ERROR)
				error = ::WSAGetLastError();
			else
				error = socketError;
		}

		if (error != 0)
		{
			nonBlocking = 0;
			::ioctlsocket(socketHandle, FIONBIO, &nonBlocking);
			return error;
		}
	}

	nonBlocking = 0;
	if (::ioctlsocket(socketHandle, FIONBIO, &nonBlocking) == SOCKET_ERROR)
		return ::WSAGetLastError();
	return 0;
}

CSocket::CSocket()
	: m_socket( INVALID_SOCKET )
{
}

CSocket::CSocket( SOCKET theSocket )
	: m_socket( theSocket )
{
	if ( INVALID_SOCKET == m_socket )
	{
		throw Exception( _T("CSocket::CSocket()"),  WSAENOTSOCK );
	}
}
      
CSocket::~CSocket()
{
	if ( INVALID_SOCKET != m_socket )
	{
		try
		{
			AbortiveClose();
		}
		catch(...)
		{
			TRACE( "CSocket::~CSocket() exception!" );
		}
	}
}

void CSocket::Attach( SOCKET theSocket )
{
	AbortiveClose();
	
	m_socket = theSocket;
}

SOCKET CSocket::Detatch()
{
	SOCKET theSocket = m_socket;
	
	m_socket = INVALID_SOCKET;
	
	return theSocket;
}

void CSocket::Close()
{
	if ( 0 != ::closesocket( m_socket ) )
	{
		throw Exception( _T("CSocket::Close()"), ::WSAGetLastError() );
	}
}

void CSocket::AbortiveClose()
{
	LINGER lingerStruct;
	
	lingerStruct.l_onoff = 1;
	lingerStruct.l_linger = 0;
	
	if ( SOCKET_ERROR == ::setsockopt( m_socket, 
				SOL_SOCKET, 
				SO_LINGER, 
				( char * )&lingerStruct, 
				sizeof( lingerStruct ) ) )
	{
		throw Exception( _T("CSocket::AbortiveClose()"), ::WSAGetLastError() );
	}
	
	Close();
}

void CSocket::Shutdown( int how )
{
	if ( 0 != ::shutdown( m_socket, how ) )
	{
		throw Exception( _T(" CSocket::Shutdown()"), ::WSAGetLastError() );
	}
}

void CSocket::Listen( int backlog )
{
	if ( SOCKET_ERROR == ::listen( m_socket, backlog ) )
	{
		throw Exception( _T("CSocket::Listen()"), ::WSAGetLastError() );
	}
}

void CSocket::Bind( const SOCKADDR_IN &address )
{
	if ( SOCKET_ERROR == ::bind( m_socket, 
			reinterpret_cast< struct sockaddr * >( const_cast< SOCKADDR_IN * >( &address ) ),
			sizeof( SOCKADDR_IN ) ) )
	{
		throw Exception( _T("CSocket::Bind()"), ::WSAGetLastError() );
	}
}

void CSocket::Bind( const struct sockaddr &address, size_t addressLength )
{
	if ( SOCKET_ERROR == ::bind( m_socket, 
			const_cast< struct sockaddr * >( &address ),
			addressLength ) )
	{
		throw Exception( _T("CSocket::Bind()"), ::WSAGetLastError() );
	}
}

void CSocket::Connect( const SOCKADDR_IN &address )
{
	int error = ConnectWithTimeout(m_socket,
		reinterpret_cast<const struct sockaddr*>(&address), sizeof(SOCKADDR_IN));
	if (error)
		throw Exception(_T("CSocket::Connect()"), error);
}

void CSocket::Connect( const struct sockaddr &address, size_t addressLength )
{
	/*
	 * Loss of precision (arg. no. 3) (unsigned int to int)
	 */
	int error = ConnectWithTimeout(m_socket, &address, static_cast<int>(addressLength));
	if (error)
		throw Exception(_T("CSocket::Connect()"), error);
}

/*
 * CSocket::InternetAddress
 */

CSocket::InternetAddress::InternetAddress( unsigned long address, unsigned short port )
{
	/*
	 * member 'sockaddr_in::sin_zero not initialised
	 * ...
	 */

	sin_family = AF_INET;
	sin_port = htons( port );
	sin_addr.s_addr = htonl( address );  
}

CSocket::InternetAddress::InternetAddress(
				const _tstring &addressToConnectServer,
				unsigned short port  )
{
	sin_family = AF_INET;
	sin_port = htons( port );
	sin_addr.s_addr = inet_addr( addressToConnectServer.c_str() ); 
	
	/*
	 * member 'sockaddr_in::sin_zero not initialised
	 */
}

/*
 * CSocket::Exception
 */

CSocket::Exception::Exception( const _tstring &where, DWORD error )
			: CWin32Exception( where, error )
{

}

} // End of namespace OnlineGameLib
} // End of namespace Win32

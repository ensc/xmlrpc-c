bindir=@bindir@
prefix=@prefix@
libdir=@libdir@
includedir=@includedir@

Name:	     xmlrpc_server_cgi++
Description: XMLRPC C++ CGI-Server library
Version:     @XMLRPC_C_VERSION@

Requires.private:	xmlrpc_server++ xmlrpc++ xmlrpc
Libs:			-L${libdir} -lxmlrpc_server_cgi++
Cflags:			-I${includedir}

bindir=@bindir@
prefix=@prefix@
libdir=@libdir@
includedir=@includedir@

Name:        xmlrpc_server_cgi
Description: XMLRPC CGI-Server library
Version:     @XMLRPC_C_VERSION@

Requires.private:	xmlrpc_server xmlrpc xmlrpc_util
Libs:   		-L${libdir} -lxmlrpc_server_cgi
Cflags:			-I${includedir}

bindir=@bindir@
prefix=@prefix@
libdir=@libdir@
includedir=@includedir@

Name:        xmlrpc_cpp
Description: XMLRPC CPP library
Version:     @XMLRPC_C_VERSION@

Requires.private:	xmlrpc xmlrpc_server xmlrpc_util
Libs:   		-L${libdir} -lxmlrpc_cpp
Cflags:			-I${includedir}

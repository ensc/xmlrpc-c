bindir=@bindir@
prefix=@prefix@
libdir=@libdir@
includedir=@includedir@

Name:	     xmlrpc_server++
Description: XMLRPC C++ Server library
Version:     @XMLRPC_C_VERSION@

Requires.private:	xmlrpc++ xmlrpc_server xmlrpc xmlrpc_util
Libs:			-L${libdir} -lxmlrpc_server++
Cflags:			-I${includedir}

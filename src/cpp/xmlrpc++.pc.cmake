bindir=@bindir@
prefix=@prefix@
libdir=@libdir@
includedir=@includedir@

Name:        xmlrpc++
Description: XMLRPC C++ Base library
Version:     @XMLRPC_C_VERSION@

Requires.private:	xmlrpc xmlrpc_util
Libs:   		-L${libdir} -lxmlrpc++
Cflags:			-I${includedir}

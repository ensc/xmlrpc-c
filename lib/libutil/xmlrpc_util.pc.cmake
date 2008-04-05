prefix=@prefix@
libdir=@libdir@
includedir=@includedir@

Name:        xmlrpc_util
Description: XMLRPC utility library
Version:     @XMLRPC_C_VERSION@

Libs:   	-L${libdir} -lxmlrpc_util
Cflags:		-I${includedir}

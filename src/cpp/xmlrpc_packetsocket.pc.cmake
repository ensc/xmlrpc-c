bindir=@bindir@
prefix=@prefix@
libdir=@libdir@
includedir=@includedir@

Name:        xmlrpc_packetsocket
Description: XMLRPC C++ packsetsocket library
Version:     @XMLRPC_C_VERSION@

Requires.private:	xmlrpc++
Libs:   		-L${libdir} -lxmlrpc_packetsocket
Cflags:			-I${includedir}

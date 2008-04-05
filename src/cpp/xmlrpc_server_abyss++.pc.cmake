bindir=@bindir@
prefix=@prefix@
libdir=@libdir@
includedir=@includedir@

Name:	     xmlrpc_server_abyss++
Description: XMLRPC C++ Abyss-Server library
Version:     @XMLRPC_C_VERSION@

Requires.private:	xmlrpc_server++ xmlrpc_server_abyss xmlrpc++ xmlrpc_abyss xmlrpc_util
Libs:			-L${libdir} -lxmlrpc_server_abyss++
Cflags:			-I${includedir}

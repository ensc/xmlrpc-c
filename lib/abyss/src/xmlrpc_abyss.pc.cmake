bindir=@bindir@
prefix=@prefix@
libdir=@libdir@
includedir=@includedir@

Name:	     xmlrpc_abyss
Description: XMLRPC Abyss base library
Version:     @XMLRPC_C_VERSION@

Requires.private:	xmlrpc_util
Libs:			-L${libdir} -lxmlrpc_abyss @xmlrpc_abyss_pkgconfig_libs@
Cflags:

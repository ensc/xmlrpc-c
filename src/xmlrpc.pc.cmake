bindir=@bindir@
prefix=@prefix@
libdir=@libdir@
includedir=@includedir@

Name:        xmlrpc
Description: XMLRPC base library
Version:     @XMLRPC_C_VERSION@

Requires.private:	@xmlrpc_pkgconfig_req@ xmlrpc_util
Libs:   		-L${libdir} -lxmlrpc @xmlrpc_pkgconfig_libs@
Cflags:			-I${includedir}

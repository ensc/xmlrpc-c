bindir=@bindir@
prefix=@prefix@
libdir=@libdir@
includedir=@includedir@

Name:	     xmlrpc_client
Description: XMLRPC client library
Version:     @XMLRPC_C_VERSION@

Requires.private:	xmlrpc @xmlrpc_client_pkgconfig_req@ xmlrpc_util
Libs:			-L${libdir} -lxmlrpc_client @client_libwww_LIBS@ @client_wininet_LIBS@
Cflags:			-I${includedir}

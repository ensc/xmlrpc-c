bindir=@bindir@
prefix=@prefix@
libdir=@libdir@
includedir=@includedir@

Name:        xmlrpc_xmlparse
Description: XMLRPC xmlparse library
Version:     @XMLRPC_C_VERSION@

Requires.private:	xmlrpc_xmltok
Libs:   		-L${libdir} -lxmlrpc_xmlparse
Cflags:

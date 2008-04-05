# -*- cmake -*-

add_library(xmlrpc_xmlparse STATIC
  xmlparse.c)
target_link_libraries(xmlrpc_xmlparse xmlrpc_xmltok)

ensc_pkgconfig(xmlrpc_xmlparse)

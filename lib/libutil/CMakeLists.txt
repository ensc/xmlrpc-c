# -*- cmake -*-

add_library(xmlrpc_util SHARED
  asprintf.c
  base64.c
  error.c
  make_printable.c
  memblock.c
  select.c
  sleep.c
  time.c
  utf8.c)

set_target_properties(xmlrpc_util
  PROPERTIES
  LINK_FLAGS ${XMLRPC_LINKER_FLAGS}
  VERSION    ${XMLRPC_C_LIBVERSION}
  SOVERSION  ${XMLRPC_C_SOVERSION})

install(TARGETS xmlrpc_util
  RUNTIME DESTINATION ${_bin}
  LIBRARY DESTINATION ${_lib}
  ARCHIVE DESTINATION ${_lib})

ensc_pkgconfig(xmlrpc_util)

# -*- cmake -*-

add_executable(xmlrpc_transport xmlrpc_transport.c)
target_link_libraries(xmlrpc_transport xmlrpc_client util)

install(TARGETS xmlrpc_transport
  DESTINATION ${_bin})

ensc_set_link_exe_flags(xmlrpc_transport)

# -*- cmake -*-

add_executable(xmlrpc_parsecall
  xmlrpc_parsecall.c
  ../lib/dumpvalue.c)

target_link_libraries(xmlrpc_parsecall
  xmlrpc
  util)

install(TARGETS xmlrpc_parsecall
  DESTINATION ${_bin})

include_directories(../lib/include)

ensc_set_link_exe_flags(xmlrpc_parsecall)

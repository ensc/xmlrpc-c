# -*- cmake -*-

#set_directory_properties(PROPERTIES INCLUDE_DIRECTORIES ../lib/include)

include_directories(../lib/include)
add_executable(tool-xmlrpc
  xmlrpc.c
  ../lib/dumpvalue.c)
target_link_libraries(tool-xmlrpc xmlrpc_client util)

set_target_properties(tool-xmlrpc
  PROPERTIES OUTPUT_NAME xmlrpc)

install(TARGETS tool-xmlrpc
  DESTINATION ${_bin})

ensc_set_link_exe_flags(tool-xmlrpc)

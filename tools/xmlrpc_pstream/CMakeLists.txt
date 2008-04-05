# -*- cmake -*-

add_executable(xmlrpc_pstream
  xmlrpc_pstream.cpp
  ../lib/dumpvalue.c)

target_link_libraries(xmlrpc_pstream
  ${READLINE}
  ${NCURSES_LIBRARIES}
  xmlrpc_client++
  util)

include_directories(../lib/include)

install(TARGETS xmlrpc_pstream
  RUNTIME DESTINATION bin)

## -*- cmake -*-

set(xmlrpc_abyss_SOURCES
  abyss_info.h
  channel.c
  channel.h
  chanswitch.c
  chanswitch.h
  conf.c
  conn.c
  conn.h
  data.c
  data.h
  date.c
  date.h
  file.c
  file.h
  handler.c
  handler.h
  http.c
  http.h
  init.c
  response.c
  server.c
  server.h
  session.c
  session.h
  socket.c
  socket.h
  socket_unix.c
  socket_unix.h
  thread.h
  token.c
  token.h
  trace.c
  trace.h)

add_definitions(-D_UNIX)

if(ENABLE_ABYSS_THREADS)
  list(APPEND xmlrpc_abyss_SOURCES thread_pthread.c)
else(ENABLE_ABYSS_THREADS)
  list(APPEND xmlrpc_abyss_SOURCES thread_fork.c)
endif(ENABLE_ABYSS_THREADS)

add_library(xmlrpc_abyss SHARED ${xmlrpc_abyss_SOURCES})
target_link_libraries(xmlrpc_abyss xmlrpc_util)

if(ENABLE_ABYSS_THREADS)
  set_target_properties(xmlrpc_abyss PROPERTIES DEFINE_SYMBOL _THREAD)
  target_link_libraries(xmlrpc_abyss pthread)
  ensc_pkgconfig_lib(xmlrpc_abyss "-lpthread")
endif(ENABLE_ABYSS_THREADS)

install(TARGETS xmlrpc_abyss
  RUNTIME DESTINATION ${_bin}
  LIBRARY DESTINATION ${_lib}
  ARCHIVE DESTINATION ${_lib})

set_target_properties(xmlrpc_abyss
  PROPERTIES
  LINK_FLAGS ${XMLRPC_LINKER_FLAGS}
  VERSION    ${XMLRPC_C_LIBVERSION}
  SOVERSION  ${XMLRPC_C_SOVERSION})

ensc_pkgconfig(xmlrpc_abyss)

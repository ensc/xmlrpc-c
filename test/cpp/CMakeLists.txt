# -*- cmake -*-

set(testcpp_SOURCES
  test.cpp
  base64.cpp
  registry.cpp
  server_abyss.cpp
  server_pstream.cpp
  tools.cpp
  value.cpp
  xml.cpp)

if(MUST_BUILD_CLIENT)
  list(APPEND testcpp_SOURCES testclient.cpp)
  list(APPEND testcpp_LIBS xmlrpc_client++)
else(MUST_BUILD_CLIENT)
  list(APPEND testcpp_SOURCES testclient_dummy.c)
endif(MUST_BUILD_CLIENT)

if(DEFINED MSVCRT)
  list(APPEND testcpp_SOURCES ${CMAKE_SOURCE_DIR}/Windows/socketpair.cpp)
endif(DEFINED MSVCRT)

add_executable(src-testcpp ${testcpp_SOURCES})
target_link_libraries(src-testcpp
  xmlrpc++
  xmlrpc_server++
  xmlrpc_server_abyss++
  xmlrpc_server_pstream++
  xmlrpc_cpp
  util ${testcpp_LIBS})

enable_testing()
add_test(runtests src-testcpp)

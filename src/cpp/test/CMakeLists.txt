# -*- cmake -*-

set(test_SOURCES
  test.cpp base64.cpp registry.cpp server_abyss.cpp
  server_pstream.cpp tools.cpp value.cpp xml.cpp )

if(MUST_BUILD_CLIENT)
  list(APPEND test_SOURCES testclient.cpp)
  list(APPEND test_LIBS    xmlrpc_client++)
else(MUST_BUILD_CLIENT)
  list(APPEND test_SOURCES testclient_dummy.c)
endif(MUST_BUILD_CLIENT)

add_executable(src-test ${test_SOURCES})
target_link_libraries(src-test xmlrpc_server_abyss++ util ${test_LIBS})

enable_testing()
add_test(runtests src-test)

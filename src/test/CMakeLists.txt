# -*- cmake -*-

set(test_SOURCES
  abyss.c
  abyss.h
  test.c
  cgi.c
  method_registry.c
  parse_xml.c
  serialize.c
  serialize_value.c
  server_abyss.c
  testtool.c
  testtool.h
  value.c
  value_datetime.c
  xml_data.c)

if(MUST_BUILD_CLIENT)
  list(APPEND test_SOURCES client.c)
  list(APPEND test_LIBS xmlrpc_client)
else(MUST_BUILD_CLIENT)
  list(APPEND test_SOURCES client_dummy.c)
endif(MUST_BUILD_CLIENT)


add_executable(src-test ${test_SOURCES})
target_link_libraries(src-test xmlrpc_server_abyss util ${test_LIBS})

add_executable(src-cgitest1 cgitest1.c testtool.c testtool.h)
target_link_libraries(src-cgitest1 xmlrpc_server_cgi)

add_custom_command(TARGET src-test
  POST_BUILD
  COMMAND rm -f ${CMAKE_CURRENT_BINARY_DIR}/data
  COMMAND ln -s ${CMAKE_CURRENT_SOURCE_DIR}/data ${CMAKE_CURRENT_BINARY_DIR})

enable_testing()
add_test(runtests src-test)

# -*- cmake -*-

include_directories(${CMAKE_CURRENT_BINARY_DIR})

macro(ensc_add_example name ext class)
  # HACK: avoid name collision of c and c++ program
  if("${ext}" STREQUAL "cpp")
    set(_target ${name}++)
  else("${ext}" STREQUAL "cpp")
    set(_target ${name})
  endif("${ext}" STREQUAL "cpp")

  add_executable(${_target} ${name}.${ext})
  target_link_libraries(${_target} ${${class}_LIBS})
  list(APPEND ${class}_TARGETS ${_target})
  list(APPEND example_TARGETS ${_target})
endmacro(ensc_add_example)

if(ENABLE_CPLUSPLUS)
  add_subdirectory(cpp)
endif(ENABLE_CPLUSPLUS)


set(base_LIBS xmlrpc)
ensc_add_example(json               c base)
ensc_add_example(gen_sample_add_xml c base)
ensc_add_example(parse_xml          c base)

if(MUST_BUILD_CLIENT)
  set(client_LIBS xmlrpc_client)

  ensc_add_example(auth_client              c client)
  ensc_add_example(compound_value_client    c client)
  ensc_add_example(synch_client             c client)
  ensc_add_example(xmlrpc_sample_add_client c client)
  ensc_add_example(xmlrpc_asynch_client     c client)
endif(MUST_BUILD_CLIENT)

if(MUST_BUILD_CURL_CLIENT)
  set(client_LIBS xmlrpc_client)

  ensc_add_example(interrupted_client       c client)
endif(MUST_BUILD_CURL_CLIENT)

if(ENABLE_CGI_SERVER)
  set(cgi_server_LIBS xmlrpc_server_cgi)

  ensc_add_example(xmlrpc_sample_add_server_cgi c cgi_server)
endif(ENABLE_CGI_SERVER)

if(ENABLE_ABYSS_SERVER)
  set(abyss_server_LIBS xmlrpc_server_abyss)

  ensc_add_example(compound_value_server    c abyss_server)
  ensc_add_example(interrupted_server       c abyss_server)
  ensc_add_example(xmlrpc_inetd_server      c abyss_server)
  ensc_add_example(xmlrpc_socket_server     c abyss_server)
  ensc_add_example(xmlrpc_loop_server       c abyss_server)
  ensc_add_example(xmlrpc_sample_add_server c abyss_server)
  ensc_add_example(xmlrpc_server_validatee  c abyss_server)
endif(ENABLE_ABYSS_SERVER)

ensc_set_link_exe_flags(${example_TARGETS})

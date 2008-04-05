# -*- cmake -*-

####### libxmlrpc++.so
add_library(xmlrpc++ SHARED
  base64.cpp env_wrap.cpp fault.cpp girerr.cpp girmem.cpp
  outcome.cpp param_list.cpp value.cpp xml.cpp)
target_link_libraries(xmlrpc++ xmlrpc pthread)
list(APPEND lib_TARGETS xmlrpc++)
ensc_pkgconfig(xmlrpc++)

####### libxmlrpc_cpp.so
add_library(xmlrpc_cpp            SHARED XmlRpcCpp)
target_link_libraries(xmlrpc_cpp xmlrpc xmlrpc_server xmlrpc_client)
list(APPEND lib_TARGETS xmlrpc_cpp)
ensc_pkgconfig(xmlrpc_cpp)

####### libxmlrpc_server++.so
add_library(xmlrpc_server++       SHARED registry.cpp)
target_link_libraries(xmlrpc_server++ xmlrpc++ xmlrpc_server)
list(APPEND lib_TARGETS xmlrpc_server++)
ensc_pkgconfig(xmlrpc_server++)

####### libxmlrpc_server_abyss++.so
if(ENABLE_ABYSS_SERVER)
  add_library(xmlrpc_server_abyss++ SHARED server_abyss.cpp)
  target_link_libraries(xmlrpc_server_abyss++ xmlrpc_server++ xmlrpc_server_abyss)
  list(APPEND lib_TARGETS xmlrpc_server_abyss++)
  ensc_pkgconfig(xmlrpc_server_abyss++)
endif(ENABLE_ABYSS_SERVER)

####### libxmlrpc_server_cgi++.so
if(ENABLE_CGI_SERVER)
  add_library(xmlrpc_server_cgi++ SHARED server_cgi.cpp)
  target_link_libraries(xmlrpc_server_cgi++ xmlrpc_server++)
  list(APPEND lib_TARGETS xmlrpc_server_cgi++)
  ensc_pkgconfig(xmlrpc_server_cgi++)
endif(ENABLE_CGI_SERVER)

####### libxmlrpc_server_pstream++.so
add_library(xmlrpc_server_pstream++ SHARED server_pstream.cpp server_pstream_conn)
target_link_libraries(xmlrpc_server_pstream++ xmlrpc_server++ xmlrpc_packetsocket)
list(APPEND lib_TARGETS xmlrpc_server_pstream++)
ensc_pkgconfig(xmlrpc_server_pstream++)

####### libxmlrpc_packetsocket.so
add_library(xmlrpc_packetsocket SHARED packetsocket.cpp)
target_link_libraries(xmlrpc_packetsocket xmlrpc++)
list(APPEND lib_TARGETS xmlrpc_packetsocket)
ensc_pkgconfig(xmlrpc_packetsocket)

####### libxmlrpc_client++.so
add_library(xmlrpc_client++       SHARED
  client.cpp client_simple.cpp curl.cpp libwww.cpp wininet.cpp pstream.cpp)
set_target_properties(xmlrpc_client++
  PROPERTIES
  COMPILE_FLAGS "-I${wininet_srcdir} -I${libwww_srcdir} -I${curl_srcdir}")
target_link_libraries(xmlrpc_client++ xmlrpc++ xmlrpc_client xmlrpc_packetsocket)
list(APPEND lib_TARGETS xmlrpc_client++)
ensc_pkgconfig(xmlrpc_client++)


install(TARGETS ${lib_TARGETS}
  RUNTIME DESTINATION ${_bin}
  LIBRARY DESTINATION ${_lib})

set_target_properties(${lib_TARGETS}
  PROPERTIES
  LINK_FLAGS ${XMLRPC_LINKER_FLAGS}
  VERSION    ${XMLRPC_CXX_LIBVERSION}
  SOVERSION  ${XMLRPC_CXX_SOVERSION})

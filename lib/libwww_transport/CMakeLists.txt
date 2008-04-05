# -*- cmake -*-

if(MUST_BUILD_LIBWWW_CLIENT)
  list(APPEND transport_SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/xmlrpc_libwww_transport.c
    ${CMAKE_CURRENT_SOURCE_DIR}/xmlrpc_libwww_transport.h)
endif(MUST_BUILD_LIBWWW_CLIENT)

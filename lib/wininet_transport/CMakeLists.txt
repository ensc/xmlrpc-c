# -*- cmake -*-

if(MUST_BUILD_WININET_CLIENT)
  list(APPEND transport_SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/xmlrpc_wininet_transport.c
    ${CMAKE_CURRENT_SOURCE_DIR}/xmlrpc_wininet_transport.h)
endif(MUST_BUILD_WININET_CLIENT)

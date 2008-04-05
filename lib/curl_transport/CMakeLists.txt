# -*- cmake -*-

if(MUST_BUILD_CURL_CLIENT)
  list(APPEND transport_SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/xmlrpc_curl_transport.c

    ${CMAKE_CURRENT_SOURCE_DIR}/curltransaction.c
    ${CMAKE_CURRENT_SOURCE_DIR}/curltransaction.h

    ${CMAKE_CURRENT_SOURCE_DIR}/curlmulti.c
    ${CMAKE_CURRENT_SOURCE_DIR}/curlmulti.h

    ${CMAKE_CURRENT_SOURCE_DIR}/lock.h

    ${CMAKE_CURRENT_SOURCE_DIR}/lock_pthread.c
    ${CMAKE_CURRENT_SOURCE_DIR}/lock_pthread.h

    ${CMAKE_CURRENT_SOURCE_DIR}/curlversion.h
    )
endif(MUST_BUILD_CURL_CLIENT)

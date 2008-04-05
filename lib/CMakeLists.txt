## -*- cmake -*-

add_subdirectory(abyss)
add_subdirectory(libutil)
add_subdirectory(util)
add_subdirectory(curl_transport)
add_subdirectory(libwww_transport)
add_subdirectory(wininet_transport)

if(NOT ENABLE_LIBXML2_BACKEND)
  add_subdirectory(expat)
endif(NOT ENABLE_LIBXML2_BACKEND)

# -*- cmake -*-

add_subdirectory(lib)
add_subdirectory(binmode-rpc-kit)
add_subdirectory(turbocharger)
add_subdirectory(xml)

if (MUST_BUILD_CLIENT)
  add_subdirectory(xmlrpc)
  add_subdirectory(xmlrpc_transport)


  if (ENABLE_CPLUSPLUS)
    add_subdirectory(xml-rpc-api2cpp)
    add_subdirectory(xml-rpc-api2txt)
    add_subdirectory(xmlrpc_cpp_proxy)

    if (BUILD_XMLRPC_PSTREAM AND ENABLE_CGI_SERVER)
      add_subdirectory(xmlrpc_pstream)
    endif()
  endif()
endif()

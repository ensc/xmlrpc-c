# -*- cmake -*-

macro(ensc_install_symlink src dst)
  install(CODE "EXECUTE_PROCESS(COMMAND ln -s xmlrpc-c/${src} \$ENV{DESTDIR}${includedir}/${dst})")
endmacro(ensc_install_symlink)

list(APPEND headers
  ${CMAKE_CURRENT_BINARY_DIR}/config.h
  inttypes.h
  c_util.h
  util.h
  base.h
  json.h
  abyss.h
  abyss_unixsock.h
  abyss_winsock.h
  server.h
  server_abyss.h
  server_w32httpsys.h
  oldxmlrpc.h)

list(APPEND compat_links "oldxmlrpc.h         xmlrpc.h")
list(APPEND compat_links "server.h            xmlrpc_server.h")
list(APPEND compat_links "server_abyss.h      xmlrpc_abyss.h")
list(APPEND compat_links "server_w32httpsys.h xmlrpc_server_w32httpsys.h")


if(ENABLE_CPLUSPLUS)
  list(APPEND headers
    oldcppwrapper.hpp
    girerr.hpp
    girmem.hpp
    base.hpp
    timeout.hpp
    xml.hpp
    registry.hpp
    server_abyss.hpp
    packetsocket.hpp
    server_pstream.hpp)

  list(APPEND compat_links "oldcppwrapper.hpp XmlRpcCpp.h")
endif(ENABLE_CPLUSPLUS)

if(MUST_BUILD_CLIENT)
  list(APPEND headers
    client.h
    transport.h
    client_global.h)

  list(APPEND compat_links "client.h xmlrpc_client.h")

  if(ENABLE_CPLUSPLUS)
    list(APPEND headers
      client.hpp
      client_transport.hpp
      client_simple.hpp)
  endif(ENABLE_CPLUSPLUS)
endif(MUST_BUILD_CLIENT)

if(ENABLE_CGI_SERVER)
  list(APPEND headers
    server_cgi.h)

  list(APPEND compat_links "server_cgi.h xmlrpc_cgi.h")
endif(ENABLE_CGI_SERVER)

install(FILES
  ${headers}
  DESTINATION ${includedir}/xmlrpc-c)

foreach (ln ${compat_links})
  separate_arguments(ln)
  ensc_install_symlink(${ln})
endforeach(ln)

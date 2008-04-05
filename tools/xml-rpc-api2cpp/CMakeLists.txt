# -*- cmake -*-

add_executable(xml-rpc-api2cpp
  xml-rpc-api2cpp.cpp
  DataType.cpp
  XmlRpcFunction.cpp
  XmlRpcClass.cpp
  SystemProxy.cpp)
target_link_libraries(xml-rpc-api2cpp xmlrpc_cpp xmlrpc_client)

install(TARGETS xml-rpc-api2cpp
  RUNTIME DESTINATION bin)

install(FILES xml-rpc-api2cpp.1
  DESTINATION ${mandir}/man1)

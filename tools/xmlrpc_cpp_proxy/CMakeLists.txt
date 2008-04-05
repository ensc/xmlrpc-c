# -*- cmake -*-

add_executable(xmlrpc_cpp_proxy
  proxyClass.cpp
  proxyClass.hpp
  systemProxy.cpp
  systemProxy.hpp
  xmlrpcMethod.cpp
  xmlrpcMethod.hpp
  xmlrpcType.cpp
  xmlrpcType.hpp
  xmlrpc_cpp_proxy.cpp
)
target_link_libraries(xmlrpc_cpp_proxy xmlrpc_client++)

install(TARGETS xmlrpc_cpp_proxy
  RUNTIME DESTINATION bin)

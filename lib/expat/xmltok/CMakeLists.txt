# -*- cmake -*-

include_directories(${CMAKE_CURRENT_BINARY_DIR})

add_definitions(-DXML_BYTE_ORDER=0)

add_library(xmlrpc_xmltok STATIC
  xmltok.c xmlrole.c xmltok_impl.c
  ${CMAKE_CURRENT_BINARY_DIR}/nametab.h)

set_source_files_properties(${CMAKE_CURRENT_BINARY_DIR}/nametab.h
  PROPERTIES
  OBJECT_DEPENDS gennmtab
  GENERATED true)


get_target_property(GENNMTAB_EXECUTABLE gennmtab LOCATION)
add_custom_command(
  OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/nametab.h
  COMMAND ${GENNMTAB_EXECUTABLE} >nametab.h || { rm -f nametab.h\; false\; }
  DEPENDS gennmtab)

ensc_pkgconfig(xmlrpc_xmltok)

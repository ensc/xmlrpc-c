# -*- cmake -*-


INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR}/xmltok)

add_subdirectory(gennmtab)
add_subdirectory(xmlparse)
add_subdirectory(xmltok)
add_subdirectory(xmlwf)

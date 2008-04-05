## -*- cmake -*-

set(util_SOURCES
  casprintf.c
  cmdline_parser.c
  cmdline_parser_cpp.cpp
  getoptx.c
  getoptx.h
  stripcaseeq.c
  string_parser.c
)

if(WIN32)
  list(APPEND util_SOURCES pthreadx_win32.c)
endif(WIN32)

add_library(util STATIC ${util_SOURCES})

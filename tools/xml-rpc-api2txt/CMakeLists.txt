# -*- cmake -*-

install(PROGRAMS xml-rpc-api2txt
  DESTINATION ${bindir})

install(FILES xml-rpc-api2txt.1
  DESTINATION ${mandir}/man1)

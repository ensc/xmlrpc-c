# -*- cmake -*-

if(ENABLE_ABYSS_SERVER)
  set(abyss_serverxx_LIBS xmlrpc_server_abyss++)

  ensc_add_example(xmlrpc_inetd_server cpp abyss_serverxx)
  ensc_add_example(xmlrpc_loop_server  cpp abyss_serverxx)
  ensc_add_example(xmlrpc_sample_add_server cpp abyss_serverxx)
  ensc_add_example(callinfo_abyss_server    cpp abyss_serverxx)
endif(ENABLE_ABYSS_SERVER)

if (ENABLE_CGI_SERVER)
  set(cgi_serverxx_LIBS xmlrpc_server_cgi++)

  ensc_add_example(xmlrpc_sample_add_server_cgi cpp cgi_serverxx)
endif(ENABLE_CGI_SERVER)

if(MUST_BUILD_CLIENT)
  set(abyss_clientxx_LIBS        xmlrpc_client++)

  ensc_add_example(xmlrpc_sample_add_client  cpp abyss_clientxx)
  ensc_add_example(sample_add_client_complex cpp abyss_clientxx)
  ensc_add_example(asynch_client             cpp abyss_clientxx)

  ensc_add_example(pstream_client            cpp abyss_clientxx)
endif(MUST_BUILD_CLIENT)

set(pstream_serverxx_LIBS	xmlrpc_server_pstream++)
ensc_add_example(pstream_inetd_server  cpp pstream_serverxx)
ensc_add_example(pstream_serial_server cpp pstream_serverxx)



ensc_set_link_exe_flags(${example_TARGETS})

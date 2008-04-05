/* -*- c -*- */
#define MUST_BUILD_WININET_CLIENT	@_MUST_BUILD_WININET_CLIENT@
#define MUST_BUILD_LIBWWW_CLIENT	@_MUST_BUILD_LIBWWW_CLIENT@
#define MUST_BUILD_CURL_CLIENT		@_MUST_BUILD_CURL_CLIENT@

static char const * const XMLRPC_DEFAULT_TRANSPORT =
#if MUST_BUILD_LIBWWW_CLIENT
  "libwww"
#elif MUST_BUILD_CURL_CLIENT
  "curl"
#elif MUST_BUILD_WININET_CLIENT
  "wininet"
#else
#  error "no client XML transport configured"
#endif
  ;

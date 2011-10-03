/* -*- c -*- */

#ifndef H_XMLRPC_C_CONFIG_H

#define HAVE_SYS_IOCTL_H		0@HAVE_SYS_IOCTL_H@
#define HAVE_SYS_SELECT_H_DEFINE	0@HAVE_SYS_IOCTL_H@

#define VA_LIST_IS_ARRAY	@VA_LIST_IS_ARRAY@
#define XMLRPC_HAVE_WCHAR	@XMLRPC_HAVE_WCHAR@
#define ATTR_UNUSED		@ATTR_UNUSED@
#define DIRECTORY_SEPARATOR	"@DIRECTORY_SEPARATOR@"

#cmakedefine HAVE_SYS_SELECT_H	1
#cmakedefine HAVE_WCHAR_H	1
#cmakedefine HAVE_SETENV	1
#cmakedefine HAVE_STRCASECMP	1
#cmakedefine HAVE__STRICMP	1
#cmakedefine HAVE_STRICMP	1
#cmakedefine HAVE_GETTIMEOFDAY	1
#cmakedefine HAVE_SETGROUPS	1
#cmakedefine HAVE_ASPRINTF	1
#cmakedefine HAVE_PSELECT	1
#cmakedefine HAVE_WCSNCMP	1
#cmakedefine HAVE_LOCALTIME_R	1
#cmakedefine HAVE_GMTIME_R	1
#cmakedefine HAVE_STRTOLL	1
#cmakedefine HAVE___STRTOLL	1
#cmakedefine HAVE_STRTOULL	1
#cmakedefine HAVE___STRTOULL	1
#cmakedefine HAVE_STRTOQ	1
#cmakedefine HAVE_STRTOUQ	1

#define HAVE_UNICODE_WCHAR	HAVE_WCHAR_H

/*  Xmlrpc-c code uses __inline__ to declare functions that should
    be compiled as inline code.  GNU C recognizes the __inline__ keyword.
    Others recognize 'inline' or '__inline' or nothing at all to say
    a function should be inlined.

    We could make 'configure' simply do a trial compile to figure out
    which one, but for now, this approximation is easier:
*/
#if (!defined(__GNUC__))
  #if (!defined(__inline__))
    #if (defined(__sgi) || defined(_AIX) || defined(_MSC_VER))
      #define __inline__ __inline
    #else
      #define __inline__
    #endif
  #endif
#endif

/* MSVCRT means we're using the Microsoft Visual C++ runtime library */

#if defined(_MSC_VER)
  /* The compiler is Microsoft Visual C++ */
  #define MSVCRT _MSC_VER
#elif defined(__MINGW32__)
  /* The compiler is Mingw, which is the Windows version of the GNU
     compiler. Programs built with this normally use the Microsoft Visual
     C++ runtime library.
  */
  #define MSVCRT 1
#else
  #define MSVCRT 0
#endif

#if MSVCRT
  /* The MSVC runtime library _does_ have a 'struct timeval', but it is
     part of the Winsock interface (along with select(), which is probably
     its intended use), so isn't intended for use for general timekeeping.
  */
  #define HAVE_TIMEVAL 0
  #define HAVE_TIMESPEC 0
#else
  #define HAVE_TIMEVAL 1
  /* timespec is Posix.1b.  If we need to work on a non-Posix.1b non-Windows
     system, we'll have to figure out how to make Configure determine this.
  */
  #define HAVE_TIMESPEC 1
#endif

#if MSVCRT
  #define HAVE_WINDOWS_THREAD 1
#else
  #define HAVE_WINDOWS_THREAD 0
#endif

#define HAVE_PTHREAD 1

/* Note that the return value of XMLRPC_VSNPRINTF is int on Windows,
   ssize_t on POSIX.
*/
#if MSVCRT
  #define XMLRPC_VSNPRINTF _vsnprintf
#else
  #define XMLRPC_VSNPRINTF vsnprintf
#endif

#if MSVCRT
  #define HAVE_REGEX 0
#else
  #define HAVE_REGEX 1
#endif

#if MSVCRT
  #define XMLRPC_SOCKETPAIR xmlrpc_win32_socketpair
  #define XMLRPC_CLOSESOCKET closesocket
#else
  #define XMLRPC_SOCKETPAIR socketpair
  #define XMLRPC_CLOSESOCKET close
#endif

#if defined(_MSC_VER) && (_MSC_VER >= 1400)
/* Starting with MSVC 8, the runtime library defines various POSIX functions
   such as strdup() whose names violate the ISO C standard (the standard
   says the strXXX names are reserved for the standard), but warns you of
   the standards violation.  That warning is 4996, along with other warnings
   that tell you you're using a function that Microsoft thinks you
   shouldn't.

   Well, POSIX is more important than that element of ISO C, so we disable
   that warning.

   FYI, msvcrt also defines _strdup(), etc, which doesn't violate the
   naming standard.  But since other environments don't define _strdup(),
   we can't use it in portable code.
*/
#pragma warning(disable:4996)
#endif

#if HAVE_STRTOLL
  # define XMLRPC_STRTOLL strtoll
#elif HAVE_STRTOQ
  # define XMLRPC_STRTOLL strtoq /* Interix */
#elif HAVE___STRTOLL
  # define XMLRPC_STRTOLL __strtoll /* HP-UX <= 11.11 */
#elif HAVE__STRTOUI64
  #define XMLRPC_STRTOLL _strtoui64  /* Windows MSVC */
#endif

#if HAVE_STRTOULL
  # define XMLRPC_STRTOULL strtoull
#elif HAVE_STRTOUQ
  # define XMLRPC_STRTOULL strtouq /* Interix */
#elif HAVE___STRTOULL
  # define XMLRPC_STRTOULL __strtoull /* HP-UX <= 11.11 */
#elif HAVE__STRTOUI64
  #define XMLRPC_STRTOULL _strtoui64  /* Windows MSVC */
#endif

#define XMLRPC_INT64  int64_t
#define XMLRPC_PRId64 PRId64

/* S_IRUSR is POSIX, defined in <sys/stat.h> Some old BSD systems and Windows
   systems have S_IREAD instead.  Most Unix today (2011) has both.  In 2011,
   Android has S_IRUSR and not S_IREAD.

   We're ignoring S_IREAD now to see if anyone misses it.  If there are still
   users that need it, we can handle it here.
*/
#define XMLRPC_S_IWUSR S_IWUSR
#define XMLRPC_S_IRUSR S_IRUSR

#endif

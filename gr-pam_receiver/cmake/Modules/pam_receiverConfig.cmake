INCLUDE(FindPkgConfig)
PKG_CHECK_MODULES(PC_PAM_RECEIVER pam_receiver)

FIND_PATH(
    PAM_RECEIVER_INCLUDE_DIRS
    NAMES pam_receiver/api.h
    HINTS $ENV{PAM_RECEIVER_DIR}/include
        ${PC_PAM_RECEIVER_INCLUDEDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/include
          /usr/local/include
          /usr/include
)

FIND_LIBRARY(
    PAM_RECEIVER_LIBRARIES
    NAMES gnuradio-pam_receiver
    HINTS $ENV{PAM_RECEIVER_DIR}/lib
        ${PC_PAM_RECEIVER_LIBDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/lib
          ${CMAKE_INSTALL_PREFIX}/lib64
          /usr/local/lib
          /usr/local/lib64
          /usr/lib
          /usr/lib64
)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(PAM_RECEIVER DEFAULT_MSG PAM_RECEIVER_LIBRARIES PAM_RECEIVER_INCLUDE_DIRS)
MARK_AS_ADVANCED(PAM_RECEIVER_LIBRARIES PAM_RECEIVER_INCLUDE_DIRS)


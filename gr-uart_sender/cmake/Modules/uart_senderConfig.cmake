INCLUDE(FindPkgConfig)
PKG_CHECK_MODULES(PC_UART_SENDER uart_sender)

FIND_PATH(
    UART_SENDER_INCLUDE_DIRS
    NAMES uart_sender/api.h
    HINTS $ENV{UART_SENDER_DIR}/include
        ${PC_UART_SENDER_INCLUDEDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/include
          /usr/local/include
          /usr/include
)

FIND_LIBRARY(
    UART_SENDER_LIBRARIES
    NAMES gnuradio-uart_sender
    HINTS $ENV{UART_SENDER_DIR}/lib
        ${PC_UART_SENDER_LIBDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/lib
          ${CMAKE_INSTALL_PREFIX}/lib64
          /usr/local/lib
          /usr/local/lib64
          /usr/lib
          /usr/lib64
)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(UART_SENDER DEFAULT_MSG UART_SENDER_LIBRARIES UART_SENDER_INCLUDE_DIRS)
MARK_AS_ADVANCED(UART_SENDER_LIBRARIES UART_SENDER_INCLUDE_DIRS)


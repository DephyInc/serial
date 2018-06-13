cmake_minimum_required(VERSION 2.8.3)
project(serial)

## Sources
set(serial_SRCS
    src/serial.cc
    include/serial/serial.h
    include/serial/v8stdint.h
)

# If windows
list(APPEND serial_SRCS src/impl/win.cc)
list(APPEND serial_SRCS src/impl/list_ports/list_ports_win.cc)

add_library(serialc STATIC ${serial_SRCS})
target_link_libraries(serialc setupapi)
set_target_properties(serialc PROPERTIES PUBLIC_HEADER include/serial/serial.h)
include_directories(include)

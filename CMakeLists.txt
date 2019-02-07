cmake_minimum_required(VERSION 2.8.3)
project(serial)

## Sources
set(serial_SRCS
    src/serial.cc
	src/revision.cpp
    include/serial/serial.h
    include/serial/v8stdint.h
	include/revision.h
	include/git_rev_data.h
)

# If windows
IF(WIN32)
	list(APPEND serial_SRCS src/impl/win.cc)
	list(APPEND serial_SRCS src/impl/list_ports/list_ports_win.cc)
ELSE()
	list(APPEND serial_SRCS src/impl/unix.cc)
	list(APPEND serial_SRCS src/impl/list_ports/list_ports_linux.cc)
ENDIF()
	
add_library(serialc STATIC ${serial_SRCS})

IF(WIN32)
	target_link_libraries(serialc setupapi)
ELSE()
	target_link_libraries(serialc)
ENDIF()

## Update the git revision data file
add_custom_command( TARGET serialc
		PRE_BUILD
		COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/update_revs.bat ${CMAKE_CURRENT_SOURCE_DIR}/include/git_rev_data.h
		COMMENT "Updating revision information"
		)

set_target_properties(serialc PROPERTIES PUBLIC_HEADER include/serial/serial.h)
include_directories(include)

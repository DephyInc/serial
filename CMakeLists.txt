file(GLOB_RECURSE SERIAL_SRCS 
	${CMAKE_CURRENT_SOURCE_DIR}/src/*.c
	${CMAKE_CURRENT_SOURCE_DIR}/src/*.cc
	${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp
)

# Add the source to the parent project to create a overall library/DLL
set(SERIAL_SRCS
	${SERIAL_SRCS}
	PARENT_SCOPE
)
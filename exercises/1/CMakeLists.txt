cmake_minimum_required(VERSION 3.20)
project(gluehwein)

include(my_add_library.cmake)
set(GLUEHWEIN_INSTALL_DIR gluehwein)

if (${CMAKE_C_COMPILER_ID} STREQUAL GNU)
  string(APPEND CMAKE_C_FLAGS " -Wall -Werror")
  string(APPEND CMAKE_CXX_FLAGS " -Wall -Werror")
endif()

cmake_policy(SET CMP0139 NEW)   # for example

find_package(SQLite3)

add_subdirectory(firmware)
add_subdirectory(toolcase)

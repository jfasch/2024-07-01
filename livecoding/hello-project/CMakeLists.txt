cmake_minimum_required(VERSION 3.20)
project(Demo)

if (${CMAKE_C_COMPILER_ID} STREQUAL GNU)
  string(APPEND CMAKE_C_FLAGS " -Wall -Werror")
  string(APPEND CMAKE_CXX_FLAGS " -Wall -Werror")
endif()

add_subdirectory(bin)
add_subdirectory(libhello)

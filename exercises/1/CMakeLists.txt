cmake_minimum_required(VERSION 3.20)
project(gluehwein VERSION 42.666)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)
include(my_add_library)
include(settings)
include(external-dependencies)

configure_file(project-config.h.in ${CMAKE_BINARY_DIR}/project-config.h)
include_directories(${CMAKE_BINARY_DIR})

add_subdirectory(firmware)
add_subdirectory(toolcase)

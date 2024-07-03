set(GLUEHWEIN_INSTALL_DIR gluehwein)

if (${CMAKE_C_COMPILER_ID} STREQUAL GNU)
  string(APPEND CMAKE_C_FLAGS " -Wall -Werror")
  string(APPEND CMAKE_CXX_FLAGS " -Wall -Werror")
endif()

cmake_policy(SET CMP0139 NEW)   # for example

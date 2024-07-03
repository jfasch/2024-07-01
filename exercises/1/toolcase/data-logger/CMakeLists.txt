if (SQLite3_FOUND)
  set(_sqlite3_h sink-sqlite3.h)
  set(_sqlite3_cpp sink-sqlite3.cpp)
endif()

my_add_library(
  NAME data-logger-lib
  VERSION 666

  PUBLIC_HEADERS

    data-logger.h
    measurements.h
    sensor-config.h
    sink-file.h
    sink.h
    sink-terminal.h
    ${_sqlite3_h}

  PUBLIC_HEADERS_DESTINATION

    ${GLUEHWEIN_INSTALL_DIR}

  SOURCES

    data-logger.cpp
    measurements.cpp
    sensor-config.cpp
    sink-file.cpp
    sink-terminal.cpp
    ${_sqlite3_cpp}
)

target_link_libraries(data-logger-lib base-lib)

if (SQLite3_FOUND)
  target_link_libraries(data-logger-lib SQLite::SQLite3)
  target_compile_definitions(data-logger-lib INTERFACE HAVE_SQLITE3)
endif()

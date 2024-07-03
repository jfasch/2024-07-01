if (SQLite3_FOUND)
  set(_sqlite3_h sink-sqlite3.h)
  set(_sqlite3_cpp sink-sqlite3.cpp)
endif()

if (Mosquitto_FOUND)
  set(_mqtt_h sink-mqtt.h)
  set(_mqtt_cpp sink-mqtt.cpp)
endif()

my_add_library(
  NAME data-logger-lib
  VERSION 666

  PUBLIC_HEADERS

    data-logger.h
    measurements.h
    sensor-config.h
    sink.h
    sink-composite.h
    sink-file.h
    sink-terminal.h
    ${_sqlite3_h}
    ${_mqtt_h}

  PUBLIC_HEADERS_DESTINATION

    ${GLUEHWEIN_INSTALL_DIR}

  SOURCES

    data-logger.cpp
    measurements.cpp
    sensor-config.cpp
    sink-composite.cpp
    sink-file.cpp
    sink-terminal.cpp
    ${_sqlite3_cpp}
    ${_mqtt_cpp}
)

target_link_libraries(data-logger-lib base-lib)

if (SQLite3_FOUND)
  target_link_libraries(data-logger-lib SQLite::SQLite3)
endif()
if (Mosquitto_FOUND)
  target_link_libraries(data-logger-lib Mosquitto::Mosquitto)
endif()

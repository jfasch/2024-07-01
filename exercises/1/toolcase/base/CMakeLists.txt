my_add_library(
  NAME base-lib
  VERSION 42
  PUBLIC_HEADERS

    hysteresis.h
    sensor-avg.h
    sensor-const.h
    sensor.h
    sensor-random.h
    sensor-w1.h
    switch.h
    sysfs-switch.h

  PUBLIC_HEADERS_DESTINATION

    ${GLUEHWEIN_INSTALL_DIR}

  PRIVATE_HEADERS

    file-util.h 

  SOURCES

    hysteresis.cpp
    sensor-avg.cpp
    sensor-const.cpp
    sensor-random.cpp
    sensor-w1.cpp
    sysfs-switch.cpp
    file-util.cpp
)

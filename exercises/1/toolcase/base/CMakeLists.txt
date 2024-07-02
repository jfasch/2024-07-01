add_library(
  base-lib

  # public headers
  include/public/hysteresis.h
  include/public/sensor-avg.h
  include/public/sensor-const.h
  include/public/sensor.h
  include/public/sensor-random.h
  include/public/sensor-w1.h
  include/public/switch.h
  include/public/sysfs-switch.h

  # private
  include/private/file-util.h

  # sources
  src/hysteresis.cpp
  src/sensor-avg.cpp
  src/sensor-const.cpp
  src/sensor-random.cpp
  src/sensor-w1.cpp
  src/sysfs-switch.cpp
  src/file-util.cpp
)
target_include_directories(base-lib PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include/public)
target_include_directories(base-lib PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/include/private)


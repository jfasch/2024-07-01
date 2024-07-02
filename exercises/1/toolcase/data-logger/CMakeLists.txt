add_library(
  data-logger-lib

  data-logger.cpp
  data-logger.h
  measurements.cpp
  measurements.h
  sensor-config.cpp
  sensor-config.h
  sink-file.cpp
  sink-file.h
  sink.h
  sink-terminal.cpp
  sink-terminal.h
)
target_link_libraries(data-logger-lib base-lib)

target_include_directories(data-logger-lib INTERFACE ${CMAKE_CURRENT_SOURCE_DIR})

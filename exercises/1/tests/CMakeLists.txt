add_executable(
  test-suite

  sensor-const-suite.cpp
  sensor-random-suite.cpp
)

target_link_libraries(
  test-suite

  base-lib
  gtest_main 
)

add_test(
  NAME test-suite
  COMMAND test-suite --gtest_output=xml
)

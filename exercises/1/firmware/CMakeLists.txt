add_executable(
  boiling-pot

  boiling-pot.cpp
)

target_link_libraries(boiling-pot boiling-pot-lib base-lib)
install(TARGETS boiling-pot DESTINATION bin)



add_executable(
  data-logger

  data-logger.cpp
)

target_link_libraries(data-logger data-logger-lib base-lib)
install(TARGETS data-logger DESTINATION bin)

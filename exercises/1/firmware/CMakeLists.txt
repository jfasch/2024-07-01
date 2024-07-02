add_executable(
  boiling-pot

  boiling-pot.cpp
)

target_link_libraries(boiling-pot boiling-pot-lib base-lib)



add_executable(
  data-logger

  data-logger.cpp
)

target_link_libraries(data-logger data-logger-lib base-lib)

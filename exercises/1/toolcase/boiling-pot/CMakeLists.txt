add_library(
  boiling-pot-lib

  boiling-pot.cpp
  boiling-pot.h
)
target_link_libraries(boiling-pot-lib base-lib)

target_include_directories(boiling-pot-lib INTERFACE ${CMAKE_CURRENT_SOURCE_DIR})

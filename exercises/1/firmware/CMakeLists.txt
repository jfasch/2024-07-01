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








add_executable(
  data-logger-deeply-embedded-2024-06-20-manual

  data-logger-deeply-embedded.cpp
  2024-06-20-manual.cpp     # link time polymorphism
)
target_link_libraries(data-logger-deeply-embedded-2024-06-20-manual data-logger-lib base-lib)
install(TARGETS data-logger-deeply-embedded-2024-06-20-manual DESTINATION bin)


add_executable(
  data-logger-deeply-embedded-2024-06-20

  data-logger-deeply-embedded.cpp
  ${CMAKE_CURRENT_BINARY_DIR}/2024-06-20.cpp     # link time polymorphism
)
target_include_directories(data-logger-deeply-embedded-2024-06-20 PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(data-logger-deeply-embedded-2024-06-20 data-logger-lib base-lib)
install(TARGETS data-logger-deeply-embedded-2024-06-20 DESTINATION bin)

add_custom_command(
  OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/2024-06-20.cpp
  
  COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/config-generator.py
          ${CMAKE_CURRENT_SOURCE_DIR}/2024-06-20.conf
	  ${CMAKE_CURRENT_BINARY_DIR}/2024-06-20.cpp

  DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/2024-06-20.conf
	  ${CMAKE_CURRENT_SOURCE_DIR}/config-generator.py
)  





add_executable(
  data-logger-deeply-embedded-2024-07-03

  data-logger-deeply-embedded.cpp
  ${CMAKE_CURRENT_BINARY_DIR}/2024-07-03.cpp     # link time polymorphism
)
target_include_directories(data-logger-deeply-embedded-2024-07-03 PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(data-logger-deeply-embedded-2024-07-03 data-logger-lib base-lib)
install(TARGETS data-logger-deeply-embedded-2024-07-03 DESTINATION bin)

add_custom_command(
  OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/2024-07-03.cpp
  
  COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/config-generator.py
          ${CMAKE_CURRENT_SOURCE_DIR}/2024-07-03.conf
	  ${CMAKE_CURRENT_BINARY_DIR}/2024-07-03.cpp

  DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/2024-07-03.conf
	  ${CMAKE_CURRENT_SOURCE_DIR}/config-generator.py
)




# sollte man nicht machen
# execute_process(
#   COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/config-generator.py
#           ${CMAKE_CURRENT_SOURCE_DIR}/2024-07-03.conf
# 	  ${CMAKE_CURRENT_BINARY_DIR}/2024-07-03-do-not-use.cpp
# )
# 
# add_executable(
#   data-logger-deeply-embedded-2024-07-03-do-not-use
# 
#   data-logger-deeply-embedded.cpp
#   ${CMAKE_CURRENT_BINARY_DIR}/2024-07-03-do-not-use.cpp
# )
# target_include_directories(data-logger-deeply-embedded-2024-07-03-do-not-use PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
# target_link_libraries(data-logger-deeply-embedded-2024-07-03-do-not-use data-logger-lib base-lib)

function(my_add_library)
  cmake_parse_arguments(P
    "STATIC;SHARED;VERBOSE"                    # boolean flags
    "NAME;PUBLIC_HEADERS_DESTINATION;VERSION"  # single arg
    "PUBLIC_HEADERS;PRIVATE_HEADERS;SOURCES"   # multi arg

    ${ARGV}
  )

  if (P_VERBOSE)
    message("STATIC: ${P_STATIC}")
    message("SHARED: ${P_SHARED}")
    message("VERSION: ${P_VERSION}")
    message("NAME: ${P_NAME}")
    message("PUBLIC_HEADERS: ${P_PUBLIC_HEADERS}")
    message("PUBLIC_HEADERS_DESTINATION: ${P_PUBLIC_HEADERS_DESTINATION}")
    message("PRIVATE_HEADERS: ${P_PRIVATE_HEADERS}")
    message("SOURCES: ${P_SOURCES}")
  endif()

  if (NOT DEFINED P_PUBLIC_HEADERS_DESTINATION)
    message(FATAL_ERROR "PUBLIC_HEADERS_DESTINATION not specified")
  endif()

  if (P_STATIC AND P_SHARED)
    message(FATAL_ERROR "STATIC *and* SHARED not possible")
  elseif(P_STATIC)
    set(how "STATIC")
  elseif(P_SHARED)
    set(how "SHARED")
  endif()

  foreach (h ${P_PUBLIC_HEADERS})
    list(APPEND public_headers "include/public/${h}")
  endforeach()
  foreach (h ${P_PRIVATE_HEADERS})
    list(APPEND private_headers "include/private/${h}")
  endforeach()
  foreach (s ${P_SOURCES})
    list(APPEND sources "src/${s}")
  endforeach()

  add_library(
    ${P_NAME}
    ${how}
    ${public_headers} ${private_headers} ${sources}
  )
  set_property(TARGET ${P_NAME} PROPERTY VERSION ${P_VERSION})

  target_include_directories(${P_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include/public)
  target_include_directories(${P_NAME} PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/include/private)

  install(TARGETS ${P_NAME} DESTINATION lib)
  install(FILES ${public_headers} DESTINATION include/${P_PUBLIC_HEADERS_DESTINATION})

endfunction()

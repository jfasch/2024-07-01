function(foo)
  cmake_parse_arguments(MYPARAMS
    "VERBOSE;COOL"    # flags
    "DESTINATION"     # single arg
    "HEADERS;SOURCES" # multi arg

    ${ARGV})

  if (MYPARAMS_VERBOSE)
    message("being verbose")
  endif()
  if (MYPARAMS_COOL)
    message("being cool")
  endif()
  
  message("DESTINATION: ${MYPARAMS_DESTINATION}")
  message("HEADERS: ${MYPARAMS_HEADERS}")
  message("SOURCES: ${MYPARAMS_SOURCES}")

  foreach (source ${MYPARAMS_SOURCES})
    message(${source})
  endforeach()

endfunction()

foo(
  HEADERS

    a.h
    b.h

  SOURCES

    a.cpp
    b.cpp

  VERBOSE
  COOL

  DESTINATION gluehwein
)

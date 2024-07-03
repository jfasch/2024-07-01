my_add_library(
  NAME boiling-pot-lib
  VERSION 7

  PUBLIC_HEADERS

    boiling-pot.h

  PUBLIC_HEADERS_DESTINATION

    ${GLUEHWEIN_INSTALL_DIR}

  SOURCES

    boiling-pot.cpp  
)

target_link_libraries(boiling-pot-lib base-lib)

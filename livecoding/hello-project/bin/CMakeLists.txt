add_executable(
  hello-first           # <--- node (target)

  hello-first.c
)
target_link_libraries(  # <--- edge (dependency)
  hello-first           # <--- source node

  PUBLIC
  
  hello                 # <--- destination node
)    
install(TARGETS hello-first DESTINATION bin)

add_executable(
  hello-second          # <--- node (target)

  hello-second.c
)
target_link_libraries(
  hello-second          # <--- source node

  PUBLIC

  hello                 # <--- destination node
) 
install(TARGETS hello-second DESTINATION bin)

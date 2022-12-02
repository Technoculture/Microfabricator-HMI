# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\Micro-fabricator_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\Micro-fabricator_autogen.dir\\ParseCache.txt"
  "Micro-fabricator_autogen"
  )
endif()

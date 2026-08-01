# This file is part of Noggit3, licensed under GNU General Public License (version 3).

# Dependency: nlohmann/json
FetchContent_Declare(
  json
  GIT_REPOSITORY https://github.com/nlohmann/json.git
  GIT_TAG v3.12.0
  GIT_SHALLOW TRUE
)

FetchContent_GetProperties(json)

IF(NOT json_POPULATED)
  MESSAGE(STATUS "Installing json.hpp...")
  FetchContent_PopulateFast(json)
ENDIF()

SET(JSON_BuildTests OFF CACHE INTERNAL "")
ADD_SUBDIRECTORY(
  ${json_SOURCE_DIR}
  ${json_BINARY_DIR}
  EXCLUDE_FROM_ALL
)

# This file is part of Noggit3, licensed under GNU General Public License (version 3).

# Dependency: lua
FetchContent_Declare(lua
  GIT_REPOSITORY https://gitlab.com/prophecy-rp/dependencies.git
  GIT_TAG        dep-lua
)

FetchContent_GetProperties(lua)
IF(NOT lua_POPULATED)
  MESSAGE(STATUS "---------------------------------------------")
  MESSAGE(STATUS "Installing Lua...")
  FetchContent_Populate (lua)
  SET(LUA_LIBRARY_INCLUDE_DIR "${lua_SOURCE_DIR}/includes")
  SET(LUA_LIBRARY_DEBUG_DIR "${lua_SOURCE_DIR}/lib/debug/x64")
  SET(LUA_LIBRARY_RELEASE_DIR "${lua_SOURCE_DIR}/lib/release/x64")
ENDIF()

FIND_LIBRARY(_lua_debug_lib NAMES Lua54 PATHS ${LUA_LIBRARY_DEBUG_DIR})
FIND_LIBRARY(_lua_release_lib NAMES Lua54 PATHS ${LUA_LIBRARY_RELEASE_DIR})

SET(LUA_LIBRARY_LIBRARIES)
IF(_lua_debug_lib AND _lua_release_lib)
    LIST(APPEND LUA_LIBRARY_LIBRARIES debug ${_lua_debug_lib} optimized ${_lua_release_lib})
    ADD_LIBRARY(Lua-Lua INTERFACE)
    ADD_LIBRARY(Lua::Lua ALIAS Lua-Lua)
    TARGET_LINK_LIBRARIES(Lua-Lua INTERFACE ${LUA_LIBRARY_LIBRARIES})
    TARGET_INCLUDE_DIRECTORIES(Lua-Lua INTERFACE ${LUA_LIBRARY_INCLUDE_DIR})
ELSE()
    ADD_LIBRARY(Lua-Lua INTERFACE)
    ADD_LIBRARY(Lua::Lua ALIAS Lua-Lua)
    TARGET_LINK_LIBRARIES(Lua-Lua INTERFACE ${LUA_LIBRARY})
    TARGET_INCLUDE_DIRECTORIES(Lua-Lua INTERFACE ${LUA_INCLUDE_DIR})
ENDIF()


MESSAGE(STATUS "Lua Include         : ${LUA_LIBRARY_INCLUDE_DIR}")
MESSAGE(STATUS "Lua Debug Lib       : ${_lua_debug_lib}")
MESSAGE(STATUS "Lua Optimized Lib   : ${_lua_release_lib}")
MESSAGE(STATUS "---------------------------------------------")
MESSAGE(STATUS "Lua System Include  : ${LUA_INCLUDE_DIR}")
MESSAGE(STATUS "Lua System Lib      : ${LUA_LIBRARY}")
MESSAGE(STATUS "Lua Installed!")
MESSAGE(STATUS "---------------------------------------------")
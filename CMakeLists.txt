cmake_minimum_required(VERSION 3.15)

find_package(Git REQUIRED)

set(EXTERNAL_DIR ${CMAKE_CURRENT_SOURCE_DIR}/external)

# clone vcpkg
set(VCPKG_SOURCE_DIR ${EXTERNAL_DIR}/vcpkg)
execute_process(COMMAND ${GIT_EXECUTABLE} submodule update --init ${VCPKG_SOURCE_DIR})

# init vcpkg
include(vcpkg.cmake)
vcpkg_configure()

project(vcpkg-test CXX)

find_package(sqlite3 REQUIRED)

add_executable(main main.cpp)
target_include_directories(main PRIVATE ${SQLite3_INCLUDE_DIRS})
target_link_libraries(main PRIVATE ${SQLite3_LIBRARIES})
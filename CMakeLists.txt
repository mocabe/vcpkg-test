cmake_minimum_required(VERSION 3.15)

find_package(Git REQUIRED)

set(EXTERNAL_DIR ${CMAKE_CURRENT_SOURCE_DIR}/external)

# init vcpkg
set(VCPKG_SOURCE_DIR ${EXTERNAL_DIR}/vcpkg)
execute_process(COMMAND ${GIT_EXECUTABLE} submodule update --init ${VCPKG_SOURCE_DIR})
include(vcpkg.cmake)
vcpkg_configure()

# install dependency
vcpkg_install(sqlite3)

project(vcpkg-test CXX)

find_package(sqlite3 CONFIG REQUIRED)

add_executable(main main.cpp)

target_link_libraries(main PRIVATE sqlite3)
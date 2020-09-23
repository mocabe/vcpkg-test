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

# some libraries provide unofficial targets.
find_package(unofficial-sqlite3 CONFIG REQUIRED)
# otherwise normal package
find_package(fmt CONFIG REQUIRED)

add_executable(main main.cpp)
target_link_libraries(main PRIVATE unofficial::sqlite3::sqlite3)
target_link_libraries(main PRIVATE fmt::fmt)
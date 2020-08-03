# bootstrap vcpkg (internal)
function(_bootstrap_vcpkg)
  execute_process(COMMAND ${VCPKG_SOURCE_DIR}/bootstrap-vcpkg.sh)
endfunction()

# configure vcpkg
function(vcpkg_configure)
  find_program(VCPKG_EXECUTABLE vcpkg PATHS ${VCPKG_SOURCE_DIR})
  if(NOT VCPKG_EXECUTABLE)
    _bootstrap_vcpkg()
  endif()
  set(CMAKE_TOOLCHAIN_FILE ${VCPKG_SOURCE_DIR}/scripts/buildsystems/vcpkg.cmake CACHE STRING "")
endfunction()

# install vcpkg package
function(vcpkg_install NAME) 
  execute_process(COMMAND ${VCPKG_EXECUTABLE} install ${NAME})
endfunction()
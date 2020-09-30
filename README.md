# self-bootstrapping Vcpkg + CMake example 
[![Build Status](https://dev.azure.com/hisamocabe/vcpkg-test/_apis/build/status/mocabe.vcpkg-test?branchName=master)](https://dev.azure.com/hisamocabe/vcpkg-test/_build/latest?definitionId=1&branchName=master)

Example of CMake script to build vcpkg itself and installing dependencies automatically.

## How to build

- make build dir and `cd` into it
- `cmake ..` (or set whatever generator you want)
- `cmake --build .`

## How it works

Pretty simple: `git submodule` to clone `vcpkg`'s repo, then build it and install dependencies via manifest mode (i.e. `vcpkg.json`).
# self-bootstrapping Vcpkg + CMake example 

Example of CMake script to build vcpkg itself and installing dependencies automatically.

## How to build

- make build dir and `cd` into it
- `cmake ..` (or set whatever generator you want)
- `cmake --build .`

## How it works

Pretty simple: `git submodule` to clone `vcpkg`'s repo, then build it and install dependencies via manifest mode (i.e. `vcpkg.json`).
# Cmake

## Initialising

+ CMakeLists.txt
+ Makefile

## Building

```bash
# Build configuration setup
cmake -S <source path> -B <build path>
```

Build directory structure:
![example build structure](./image.png)

```bash
# In build folder, 
$ make  # This command runs the makefile
```

## Run Project

## CMakeLists.txt

```cmake
cmake_minimum_required(VERSION 3.20) # Defining the minimum version of CMake required
project(tutorial) # Set project name

set(CMAKE_CXX_STANDARD 11) # Specify the C++ standard (or C standard)

find_package(package_name REQUIRED) # To include a dependency

add_library(library_name source_file) # Adding a user-defined libraries/dependecies

target_include_directories(library_name PUBLIC include_folder) # Including header folders

add_executable(name executing_file_name) # Adding a executable files

target_link_libraries(name library_name) # Linking the dependencies

# Installation
install(TARGETS library_name name
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib/static) # Installing targets/executables

install(FILES include_folder DESTINATION include) # Installing header files
install(DIRECTORY data/ DESTINATION share/myapp/data) # Install entire directories

install(SCRIPT myscript.cmake) # Custom Scripts
install(CODE "message(\"Installing...\")") # Custom Scripts

```

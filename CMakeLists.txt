cmake_minimum_required(VERSION 3.16)

# Project name and version
project(HelloWorld VERSION 1.0 LANGUAGES CXX)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Find SDL2
find_package(SDL2 REQUIRED)

# Add executables
add_executable(hello src/hello.cpp)
add_executable(sdl_rectangle src/sdl_rectangle.cpp)

# Link SDL2 to the SDL rectangle program
target_include_directories(sdl_rectangle PRIVATE ${SDL2_INCLUDE_DIRS})
target_link_libraries(sdl_rectangle PRIVATE ${SDL2_LIBRARIES})

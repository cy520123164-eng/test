cmake_minimum_required(VERSION 3.16)

# Project name and version
project(HelloWorld VERSION 1.0 LANGUAGES CXX)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Add executable
add_executable(hello src/hello.cpp)

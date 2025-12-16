# C++ Projects with CMake

This repository contains C++ programs managed with CMake.

## Programs

### 1. Hello World (`hello`)
A simple Hello World program that prints to the console.

### 2. SDL2 Rectangle (`sdl_rectangle`)
A graphical program that uses SDL2 to create a window and draw a blue rectangle.

## Build Instructions

### Prerequisites
- CMake 3.16 or higher
- C++17 compatible compiler
- SDL2 development libraries (for the rectangle program)

On Ubuntu/Debian:
```bash
sudo apt-get install cmake g++ libsdl2-dev
```

### Build
```bash
mkdir build && cd build
cmake ..
make
```

### Run

**Hello World:**
```bash
./hello
# Output: Hello, World!
```

**SDL2 Rectangle:**
```bash
./sdl_rectangle
```
This will open a window displaying a blue rectangle. Close the window to exit.

## Project Structure
```
.
├── CMakeLists.txt          # CMake configuration
├── src/
│   ├── hello.cpp           # Hello World source
│   └── sdl_rectangle.cpp   # SDL2 rectangle source
└── build/                  # Build directory (generated)
```

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

#### Linux (Ubuntu/Debian)
```bash
sudo apt-get install cmake g++ libsdl2-dev
```

#### Windows (Visual Studio 2022)
1. Download SDL2 development libraries from [SDL2 Releases](https://github.com/libsdl-org/SDL/releases)
   - Get `SDL2-devel-2.x.x-VC.zip` (Visual C++ development libraries)
2. Extract to a location (e.g., `C:\SDL2`)
3. Set environment variable or pass to CMake:
   ```cmd
   set SDL2_DIR=C:\SDL2
   ```

### Build

#### Linux/macOS
```bash
mkdir build && cd build
cmake ..
make
```

#### Windows (Visual Studio 2022)
Using CMake GUI:
1. Open CMake GUI
2. Set source directory to the repository root
3. Set build directory to `build`
4. Click "Configure"
5. If SDL2 is not found, set `SDL2_DIR` to your SDL2 installation path (e.g., `C:\SDL2`)
6. Click "Generate"
7. Click "Open Project" to open in Visual Studio
8. Build the solution in Visual Studio

Or using command line:
```cmd
mkdir build
cd build
cmake .. -DSDL2_DIR=C:\SDL2
cmake --build . --config Release
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

**Note for Windows:** Copy `SDL2.dll` from `SDL2_DIR\lib\x64` to the same directory as the executable.

## Project Structure
```
.
├── CMakeLists.txt          # CMake configuration
├── cmake/
│   └── FindSDL2.cmake      # Custom SDL2 finder module
├── src/
│   ├── hello.cpp           # Hello World source
│   └── sdl_rectangle.cpp   # SDL2 rectangle source
└── build/                  # Build directory (generated)
```

## Troubleshooting

### Windows: "Could not find SDL2"
- Make sure you downloaded the correct SDL2 development libraries (VC version)
- Set `SDL2_DIR` environment variable or pass it to CMake: `-DSDL2_DIR=C:\path\to\SDL2`
- Verify the path contains `include/SDL2` and `lib` directories

### Windows: Missing SDL2.dll when running
- Copy `SDL2.dll` from `SDL2_DIR\lib\x64` (or `x86` for 32-bit) to your executable directory
- Or add the SDL2 lib directory to your system PATH

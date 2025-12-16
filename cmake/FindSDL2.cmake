# FindSDL2.cmake
# Locate SDL2 library
# This module defines:
# SDL2_FOUND - if false, do not try to link to SDL2
# SDL2_INCLUDE_DIRS - where to find SDL.h
# SDL2_LIBRARIES - the libraries to link against
# SDL2_VERSION_STRING - human-readable string containing the version of SDL2

# For Windows, you can set SDL2_DIR to the SDL2 root directory

if(WIN32)
    # On Windows, search in common locations and SDL2_DIR
    find_path(SDL2_INCLUDE_DIR SDL.h
        HINTS
            ${SDL2_DIR}
            $ENV{SDL2_DIR}
        PATH_SUFFIXES include/SDL2 include SDL2
        PATHS
            ~/Library/Frameworks
            /Library/Frameworks
            /usr/local
            /usr
            /sw
            /opt/local
            /opt/csw
            /opt
    )

    # Find SDL2 library
    if(CMAKE_SIZEOF_VOID_P EQUAL 8)
        set(SDL2_ARCH "x64")
    else()
        set(SDL2_ARCH "x86")
    endif()

    find_library(SDL2_LIBRARY
        NAMES SDL2
        HINTS
            ${SDL2_DIR}
            $ENV{SDL2_DIR}
        PATH_SUFFIXES lib/x64 lib/${SDL2_ARCH} lib
        PATHS
            ~/Library/Frameworks
            /Library/Frameworks
            /usr/local
            /usr
            /sw
            /opt/local
            /opt/csw
            /opt
    )

    # Find SDL2main library (needed on Windows)
    find_library(SDL2_MAIN_LIBRARY
        NAMES SDL2main
        HINTS
            ${SDL2_DIR}
            $ENV{SDL2_DIR}
        PATH_SUFFIXES lib/x64 lib/${SDL2_ARCH} lib
        PATHS
            ~/Library/Frameworks
            /Library/Frameworks
            /usr/local
            /usr
            /sw
            /opt/local
            /opt/csw
            /opt
    )

    if(SDL2_LIBRARY AND SDL2_MAIN_LIBRARY)
        set(SDL2_LIBRARIES ${SDL2_MAIN_LIBRARY} ${SDL2_LIBRARY})
    elseif(SDL2_LIBRARY)
        set(SDL2_LIBRARIES ${SDL2_LIBRARY})
    endif()

    if(SDL2_INCLUDE_DIR)
        set(SDL2_INCLUDE_DIRS ${SDL2_INCLUDE_DIR})
    endif()

else()
    # On Unix/Linux, use pkg-config
    find_package(PkgConfig QUIET)
    if(PKG_CONFIG_FOUND)
        pkg_check_modules(SDL2 QUIET sdl2)
    endif()

    if(SDL2_FOUND)
        # pkg-config found it, variables are already set correctly
    else()
        # Fallback to manual search
        find_path(SDL2_INCLUDE_DIR SDL.h
            PATH_SUFFIXES include/SDL2 include SDL2
            PATHS
                ~/Library/Frameworks
                /Library/Frameworks
                /usr/local/include
                /usr/include
                /sw
                /opt/local
                /opt/csw
                /opt
        )

        find_library(SDL2_LIBRARY
            NAMES SDL2
            PATH_SUFFIXES lib64 lib
            PATHS
                ~/Library/Frameworks
                /Library/Frameworks
                /usr/local
                /usr
                /sw
                /opt/local
                /opt/csw
                /opt
        )

        if(SDL2_INCLUDE_DIR)
            set(SDL2_INCLUDE_DIRS ${SDL2_INCLUDE_DIR})
        endif()
        
        if(SDL2_LIBRARY)
            set(SDL2_LIBRARIES ${SDL2_LIBRARY})
        endif()
    endif()
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(SDL2
    REQUIRED_VARS SDL2_LIBRARIES SDL2_INCLUDE_DIRS
)

mark_as_advanced(SDL2_INCLUDE_DIR SDL2_LIBRARY SDL2_MAIN_LIBRARY)

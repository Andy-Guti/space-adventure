# Conan automatically generated toolchain file
# DO NOT EDIT MANUALLY, it will be overwritten

# Avoid including toolchain file several times (bad if appending to variables like
#   CMAKE_CXX_FLAGS. See https://github.com/android/ndk/issues/323
include_guard()
message(STATUS "Using Conan toolchain: ${CMAKE_CURRENT_LIST_FILE}")
if(${CMAKE_VERSION} VERSION_LESS "3.15")
    message(FATAL_ERROR "The 'CMakeToolchain' generator only works with CMake >= 3.15")
endif()

########## 'user_toolchain' block #############
# Include one or more CMake user toolchain from tools.cmake.cmaketoolchain:user_toolchain



########## 'generic_system' block #############
# Definition of system, platform and toolset





########## 'compilers' block #############



########## 'apple_system' block #############
# Define Apple architectures, sysroot, deployment target, bitcode, etc

# Set the architectures for which to build.
set(CMAKE_OSX_ARCHITECTURES arm64 CACHE STRING "" FORCE)
# Setting CMAKE_OSX_SYSROOT SDK, when using Xcode generator the name is enough
# but full path is necessary for others
set(CMAKE_OSX_SYSROOT macosx CACHE STRING "" FORCE)
set(BITCODE "")
set(FOBJC_ARC "")
set(VISIBILITY "")
#Check if Xcode generator is used, since that will handle these flags automagically
if(CMAKE_GENERATOR MATCHES "Xcode")
  message(DEBUG "Not setting any manual command-line buildflags, since Xcode is selected as generator.")
else()
    string(APPEND CONAN_C_FLAGS " ${BITCODE} ${VISIBILITY} ${FOBJC_ARC}")
    string(APPEND CONAN_CXX_FLAGS " ${BITCODE} ${VISIBILITY} ${FOBJC_ARC}")
endif()


########## 'libcxx' block #############
# Definition of libcxx from 'compiler.libcxx' setting, defining the
# right CXX_FLAGS for that libcxx

message(STATUS "Conan toolchain: Defining libcxx as C++ flags: -stdlib=libc++")
string(APPEND CONAN_CXX_FLAGS " -stdlib=libc++")


########## 'cppstd' block #############
# Define the C++ and C standards from 'compiler.cppstd' and 'compiler.cstd'

function(conan_modify_std_watch variable access value current_list_file stack)
    set(conan_watched_std_variable "17")
    if (${variable} STREQUAL "CMAKE_C_STANDARD")
        set(conan_watched_std_variable "")
    endif()
    if ("${access}" STREQUAL "MODIFIED_ACCESS" AND NOT "${value}" STREQUAL "${conan_watched_std_variable}")
        message(STATUS "Warning: Standard ${variable} value defined in conan_toolchain.cmake to ${conan_watched_std_variable} has been modified to ${value} by ${current_list_file}")
    endif()
    unset(conan_watched_std_variable)
endfunction()

message(STATUS "Conan toolchain: C++ Standard 17 with extensions ON")
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_EXTENSIONS ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
variable_watch(CMAKE_CXX_STANDARD conan_modify_std_watch)


########## 'extra_flags' block #############
# Include extra C++, C and linker flags from configuration tools.build:<type>flags
# and from CMakeToolchain.extra_<type>_flags

# Conan conf flags start: 
# Conan conf flags end


########## 'cmake_flags_init' block #############
# Define CMAKE_<XXX>_FLAGS from CONAN_<XXX>_FLAGS

foreach(config IN LISTS CMAKE_CONFIGURATION_TYPES)
    string(TOUPPER ${config} config)
    if(DEFINED CONAN_CXX_FLAGS_${config})
      string(APPEND CMAKE_CXX_FLAGS_${config}_INIT " ${CONAN_CXX_FLAGS_${config}}")
    endif()
    if(DEFINED CONAN_C_FLAGS_${config})
      string(APPEND CMAKE_C_FLAGS_${config}_INIT " ${CONAN_C_FLAGS_${config}}")
    endif()
    if(DEFINED CONAN_SHARED_LINKER_FLAGS_${config})
      string(APPEND CMAKE_SHARED_LINKER_FLAGS_${config}_INIT " ${CONAN_SHARED_LINKER_FLAGS_${config}}")
    endif()
    if(DEFINED CONAN_EXE_LINKER_FLAGS_${config})
      string(APPEND CMAKE_EXE_LINKER_FLAGS_${config}_INIT " ${CONAN_EXE_LINKER_FLAGS_${config}}")
    endif()
endforeach()

if(DEFINED CONAN_CXX_FLAGS)
  string(APPEND CMAKE_CXX_FLAGS_INIT " ${CONAN_CXX_FLAGS}")
endif()
if(DEFINED CONAN_C_FLAGS)
  string(APPEND CMAKE_C_FLAGS_INIT " ${CONAN_C_FLAGS}")
endif()
if(DEFINED CONAN_SHARED_LINKER_FLAGS)
  string(APPEND CMAKE_SHARED_LINKER_FLAGS_INIT " ${CONAN_SHARED_LINKER_FLAGS}")
endif()
if(DEFINED CONAN_EXE_LINKER_FLAGS)
  string(APPEND CMAKE_EXE_LINKER_FLAGS_INIT " ${CONAN_EXE_LINKER_FLAGS}")
endif()


########## 'extra_variables' block #############
# Definition of extra CMake variables from tools.cmake.cmaketoolchain:extra_variables



########## 'try_compile' block #############
# Blocks after this one will not be added when running CMake try/checks

get_property( _CMAKE_IN_TRY_COMPILE GLOBAL PROPERTY IN_TRY_COMPILE )
if(_CMAKE_IN_TRY_COMPILE)
    message(STATUS "Running toolchain IN_TRY_COMPILE")
    return()
endif()


########## 'find_paths' block #############
# Define paths to find packages, programs, libraries, etc.
if(EXISTS "${CMAKE_CURRENT_LIST_DIR}/conan_cmakedeps_paths.cmake")
  message(STATUS "Conan toolchain: Including CMakeDeps generated conan_find_paths.cmake")
  include("${CMAKE_CURRENT_LIST_DIR}/conan_cmakedeps_paths.cmake")
else()

set(CMAKE_FIND_PACKAGE_PREFER_CONFIG ON)

# Definition of CMAKE_MODULE_PATH
# the generators folder (where conan generates files, like this toolchain)
list(PREPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR})

# Definition of CMAKE_PREFIX_PATH, CMAKE_XXXXX_PATH
# The Conan local "generators" folder, where this toolchain is saved.
list(PREPEND CMAKE_PREFIX_PATH ${CMAKE_CURRENT_LIST_DIR} )
list(PREPEND CMAKE_LIBRARY_PATH "/Users/akutlay/.conan2/p/b/sdl_i80a8c3934d6ee/p/lib" "/Users/akutlay/.conan2/p/b/libtib419f25bf2cee/p/lib" "/Users/akutlay/.conan2/p/b/libde8095c766ffe14/p/lib" "/Users/akutlay/.conan2/p/b/xz_ut58b63cae3c1bc/p/lib" "/Users/akutlay/.conan2/p/b/jbigbdce929880d69/p/lib" "/Users/akutlay/.conan2/p/b/zstd8ea8852e583b3/p/lib" "/Users/akutlay/.conan2/p/b/libjp083456221a996/p/lib" "/Users/akutlay/.conan2/p/b/libwe8f19ba986685b/p/lib" "/Users/akutlay/.conan2/p/b/sdl_tb01c2d89e2ae1/p/lib" "/Users/akutlay/.conan2/p/b/freet1dec157ff0c32/p/lib" "/Users/akutlay/.conan2/p/b/libpn5906516b26181/p/lib" "/Users/akutlay/.conan2/p/b/zlibc6f492e113f21/p/lib" "/Users/akutlay/.conan2/p/b/bzip2c2c1e20a5549b/p/lib" "/Users/akutlay/.conan2/p/b/brotl5b0aa9f9a1d49/p/lib" "/Users/akutlay/.conan2/p/b/sdle30ee8c4818fc/p/lib")
list(PREPEND CMAKE_INCLUDE_PATH "/Users/akutlay/.conan2/p/b/sdl_i80a8c3934d6ee/p/include" "/Users/akutlay/.conan2/p/b/sdl_i80a8c3934d6ee/p/include/SDL2" "/Users/akutlay/.conan2/p/b/libtib419f25bf2cee/p/include" "/Users/akutlay/.conan2/p/b/libde8095c766ffe14/p/include" "/Users/akutlay/.conan2/p/b/xz_ut58b63cae3c1bc/p/include" "/Users/akutlay/.conan2/p/b/jbigbdce929880d69/p/include" "/Users/akutlay/.conan2/p/b/zstd8ea8852e583b3/p/include" "/Users/akutlay/.conan2/p/b/libjp083456221a996/p/include" "/Users/akutlay/.conan2/p/b/libwe8f19ba986685b/p/include" "/Users/akutlay/.conan2/p/b/sdl_tb01c2d89e2ae1/p/include" "/Users/akutlay/.conan2/p/b/sdl_tb01c2d89e2ae1/p/include/SDL2" "/Users/akutlay/.conan2/p/b/freet1dec157ff0c32/p/include" "/Users/akutlay/.conan2/p/b/freet1dec157ff0c32/p/include/freetype2" "/Users/akutlay/.conan2/p/b/libpn5906516b26181/p/include" "/Users/akutlay/.conan2/p/b/zlibc6f492e113f21/p/include" "/Users/akutlay/.conan2/p/b/bzip2c2c1e20a5549b/p/include" "/Users/akutlay/.conan2/p/b/brotl5b0aa9f9a1d49/p/include" "/Users/akutlay/.conan2/p/b/brotl5b0aa9f9a1d49/p/include/brotli" "/Users/akutlay/.conan2/p/b/sdle30ee8c4818fc/p/include" "/Users/akutlay/.conan2/p/b/sdle30ee8c4818fc/p/include/SDL2")
set(CONAN_RUNTIME_LIB_DIRS "/Users/akutlay/.conan2/p/b/sdl_i80a8c3934d6ee/p/lib" "/Users/akutlay/.conan2/p/b/libtib419f25bf2cee/p/lib" "/Users/akutlay/.conan2/p/b/libde8095c766ffe14/p/lib" "/Users/akutlay/.conan2/p/b/xz_ut58b63cae3c1bc/p/lib" "/Users/akutlay/.conan2/p/b/jbigbdce929880d69/p/lib" "/Users/akutlay/.conan2/p/b/zstd8ea8852e583b3/p/lib" "/Users/akutlay/.conan2/p/b/libjp083456221a996/p/lib" "/Users/akutlay/.conan2/p/b/libwe8f19ba986685b/p/lib" "/Users/akutlay/.conan2/p/b/sdl_tb01c2d89e2ae1/p/lib" "/Users/akutlay/.conan2/p/b/freet1dec157ff0c32/p/lib" "/Users/akutlay/.conan2/p/b/libpn5906516b26181/p/lib" "/Users/akutlay/.conan2/p/b/zlibc6f492e113f21/p/lib" "/Users/akutlay/.conan2/p/b/bzip2c2c1e20a5549b/p/lib" "/Users/akutlay/.conan2/p/b/brotl5b0aa9f9a1d49/p/lib" "/Users/akutlay/.conan2/p/b/sdle30ee8c4818fc/p/lib" )

endif()


########## 'pkg_config' block #############
# Define pkg-config from 'tools.gnu:pkg_config' executable and paths

if (DEFINED ENV{PKG_CONFIG_PATH})
set(ENV{PKG_CONFIG_PATH} "${CMAKE_CURRENT_LIST_DIR}:$ENV{PKG_CONFIG_PATH}")
else()
set(ENV{PKG_CONFIG_PATH} "${CMAKE_CURRENT_LIST_DIR}:")
endif()


########## 'rpath' block #############
# Defining CMAKE_SKIP_RPATH



########## 'output_dirs' block #############
# Definition of CMAKE_INSTALL_XXX folders

set(CMAKE_INSTALL_BINDIR "bin")
set(CMAKE_INSTALL_SBINDIR "bin")
set(CMAKE_INSTALL_LIBEXECDIR "bin")
set(CMAKE_INSTALL_LIBDIR "lib")
set(CMAKE_INSTALL_INCLUDEDIR "include")
set(CMAKE_INSTALL_OLDINCLUDEDIR "include")


########## 'variables' block #############
# Definition of CMake variables from CMakeToolchain.variables values

# Variables
# Variables  per configuration



########## 'preprocessor' block #############
# Preprocessor definitions from CMakeToolchain.preprocessor_definitions values

# Preprocessor definitions per configuration



if(CMAKE_POLICY_DEFAULT_CMP0091)  # Avoid unused and not-initialized warnings
endif()

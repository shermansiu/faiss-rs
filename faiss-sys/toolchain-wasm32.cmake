set(CMAKE_SYSTEM_NAME Generic) # Use "Generic" for embedded/bare-metal targets without an OS
set(CMAKE_SYSTEM_PROCESSOR wasm32)

# Specify the cross compilers
# Adjust paths if your wasm compilers are in a different location
find_program(CMAKE_C_COMPILER NAMES wasm32-unknown-unknown-clang wasm32-wasi-clang clang)
find_program(CMAKE_CXX_COMPILER NAMES wasm32-unknown-unknown-clang++ wasm32-wasi-clang++ clang++)
find_program(CMAKE_AR NAMES wasm-ar llvm-ar)
find_program(CMAKE_RANLIB NAMES wasm-ranlib llvm-ranlib)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} --target=wasm32-unknown-unknown -nostdlib" CACHE STRING "" FORCE)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} --target=wasm32-unknown-unknown -nostdlib" CACHE STRING "" FORCE)

# Prevent CMake from trying to find host system libraries
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

# Ensure the compiler check passes by explicitly setting that it works (a common requirement for bare-metal/generic targets)
set(CMAKE_C_COMPILER_WORKS 1 CACHE INTERNAL "")
set(CMAKE_CXX_COMPILER_WORKS 1 CACHE INTERNAL "")

# CMakeLists.txt in VcpkgXercesTest dir
cmake_minimum_required(VERSION 3.11)
project(VcpkgXercesTest VERSION 1.0.0 LANGUAGES CXX)
set(CMAKE_VERBOSE_MAKEFILE ON)

set(CMAKE_EXPORT_COMPILE_COMMANDS 1)
# set(CMAKE_TOOLCHAIN_FILE ${PROJECT_SOURCE_DIR}/vcpkg/scripts/buildsystems/vcpkg.cmake)

find_package(XercesC CONFIG REQUIRED)

SET(SRCS
    ./main.cpp
    )

ADD_EXECUTABLE(VcpkgXercesTest
    main.cpp)

target_include_directories(VcpkgXercesTest
    PUBLIC
    PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/
    )

# target_link_libraries(example gtest_main)
target_link_libraries(VcpkgXercesTest
     PRIVATE xerces_xerces-c XercesC::XercesC
    )

set_target_properties(VcpkgXercesTest PROPERTIES
    CXX_STANDARD 17
    )

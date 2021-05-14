# cmake-format: off
# sv_add_lib()
#
# CMake function to imitate Bazel's cc_library rule.
#
# Parameters:
# NAME: name of target (see Note)
# HDRS: List of public header files for the library
# SRCS: List of source files for the library
# DEPS: List of other libraries to be linked in to the binary targets
# COPTS: List of private compile options
# DEFINES: List of public defines
# LINKOPTS: List of link options
#
# Note:
# By default, sv_add_lib will always create a library named sv_${NAME},
# and alias target sv::${NAME}.  The sv:: form should always be used.
# This is to reduce namespace pollution.
#
# sv_add_lib(
#   NAME
#     awesome
#   HDRS
#     "a.h"
#   SRCS
#     "a.cc"
# )
# sv_add_lib(
#   NAME
#     fantastic_lib
#   SRCS
#     "b.cc"
#   DEPS
#     sv::awesome # not "awesome" !
# )
#
# sv_add_lib(
#   NAME
#     main_lib
#   ...
#   DEPS
#     sv::fantastic_lib
# )
# cmake-format: on
function(sv_add_lib)
  cmake_parse_arguments(
    SV_LIB
    "INTERFACE"
    "NAME"
    "HDRS;SRCS;COPTS;DEFINES;LINKOPTS;DEPS;INCDIRS"
    ${ARGN})

  set(_NAME "sv_${SV_LIB_NAME}")

  # Check if this is a header-only library Note that as of February 2019, many
  # popular OS's (for example, Ubuntu 16.04 LTS) only come with cmake 3.5 by
  # default.  For this reason, we can't use list(FILTER...)
  set(SV_SRCS "${SV_LIB_SRCS}")
  foreach(src_file IN LISTS SV_SRCS)
    if(${src_file} MATCHES ".*\\.(h|hpp|inc)")
      list(REMOVE_ITEM SV_SRCS "${src_file}")
    endif()
  endforeach()

  if(SV_LIB_INTERFACE)
    set(SV_LIB_IS_INTERFACE 1)
  else()
    set(SV_LIB_IS_INTERFACE 0)
  endif()

  if(NOT SV_LIB_IS_INTERFACE)
    add_library(${_NAME} "")
    target_sources(${_NAME} PRIVATE ${SV_LIB_SRCS} ${SV_LIB_HDRS})
    target_link_libraries(
      ${_NAME}
      PUBLIC ${SV_LIB_DEPS}
      PRIVATE ${SV_LIB_LINKOPTS})

    # Linker language can be inferred from sources, but in the case of DLLs we
    # don't have any .cc files so it would be ambiguous. We could set it
    # explicitly only in the case of DLLs but, because "CXX" is always the
    # correct linker language for static or for shared libraries, we set it
    # unconditionally.
    set_property(TARGET ${_NAME} PROPERTY LINKER_LANGUAGE "CXX")

    target_include_directories(${_NAME} PUBLIC ${SV_LIB_INCDIRS})
    target_compile_options(${_NAME} PRIVATE ${SV_LIB_COPTS})
    target_compile_definitions(${_NAME} PUBLIC ${SV_LIB_DEFINES})

    # INTERFACE libraries can't have the CXX_STANDARD property set
    set_property(TARGET ${_NAME} PROPERTY CXX_STANDARD 17)
    set_property(TARGET ${_NAME} PROPERTY CXX_STANDARD_REQUIRED ON)
  else()
    # Generating header-only library
    add_library(${_NAME} INTERFACE)
    target_include_directories(${_NAME} INTERFACE ${SV_LIB_INCDIRS})

    target_link_libraries(${_NAME} INTERFACE ${SV_LIB_DEPS} ${SV_LIB_LINKOPTS})
    target_compile_definitions(${_NAME} INTERFACE ${SV_LIB_DEFINES})
  endif()

  add_library(sv::${SV_LIB_NAME} ALIAS ${_NAME})
endfunction()

# cmake-format: off
# sv_add_exe()
# adapted from absl_cc_test()
#
# Parameters:
# NAME: name of target (see Usage below)
# SRCS: List of source files for the binary
# DEPS: List of other libraries to be linked in to the binary targets
# COPTS: List of private compile options
# DEFINES: List of public defines
# LINKOPTS: List of link options
#
# Note:
# By default, sv_add_exe will always create a binary named sv_${NAME}.
#
# Usage:
# sv_cc_library(
#   NAME
#     awesome
#   HDRS
#     "a.h"
#   SRCS
#     "a.cc"
#   PUBLIC
# )
#
# sv_add_exe(
#   NAME
#     awesome_test
#   SRCS
#     "awesome_test.cc"
#   DEPS
#     sv::awesome
#     gmock
#     gtest_main
# )
# cmake-format: on
function(sv_add_exe)
  cmake_parse_arguments(
    SV_EXE
    ""
    "NAME"
    "SRCS;COPTS;DEFINES;LINKOPTS;DEPS"
    ${ARGN})

  set(_NAME "sv_${SV_EXE_NAME}")

  add_executable(${_NAME} "")
  target_sources(${_NAME} PRIVATE ${SV_EXE_SRCS})

  target_compile_definitions(${_NAME} PUBLIC ${SV_EXE_DEFINES})
  target_compile_options(${_NAME} PRIVATE ${SV_EXE_COPTS})

  target_link_libraries(
    ${_NAME}
    PUBLIC ${SV_EXE_DEPS}
    PRIVATE ${SV_EXE_LINKOPTS})

  set_property(TARGET ${_NAME} PROPERTY CXX_STANDARD 17)
  set_property(TARGET ${_NAME} PROPERTY CXX_STANDARD_REQUIRED ON)

  add_test(NAME ${_NAME} COMMAND ${_NAME})
endfunction()

# cmake-format: off
# sv_add_test() 
# adapted from absl_cc_test()
#
# Parameters:
# NAME: name of target (see Usage below)
# SRCS: List of source files for the binary
# DEPS: List of other libraries to be linked in to the binary targets
# COPTS: List of private compile options
# DEFINES: List of public defines
# LINKOPTS: List of link options
#
# Note:
# By default, sv_add_test will always create a binary named sv_${NAME}.
# This will also add it to ctest list as sv_${NAME}.
#
# Usage:
# sv_cc_library(
#   NAME
#     awesome
#   HDRS
#     "a.h"
#   SRCS
#     "a.cc"
#   PUBLIC
# )
#
# sv_add_test(
#   NAME
#     awesome_test
#   SRCS
#     "awesome_test.cc"
#   DEPS
#     sv::awesome
#     gmock
#     gtest_main
# )
# cmake-format: on
function(sv_add_test)
  if(NOT BUILD_TESTING)
    return()
  endif()

  cmake_parse_arguments(
    SV_TEST
    ""
    "NAME"
    "SRCS;COPTS;DEFINES;LINKOPTS;DEPS"
    ${ARGN})

  set(_NAME "sv_${SV_TEST_NAME}")

  add_executable(${_NAME} "")
  target_sources(${_NAME} PRIVATE ${SV_TEST_SRCS})

  target_compile_definitions(${_NAME} PUBLIC ${SV_TEST_DEFINES})
  target_compile_options(${_NAME} PRIVATE ${SV_TEST_COPTS})

  target_link_libraries(
    ${_NAME}
    PUBLIC ${SV_TEST_DEPS}
    PRIVATE ${SV_TEST_LINKOPTS}
            fmt::fmt
            glog::glog
            GTest::GTest
            GTest::Main)

  set_property(TARGET ${_NAME} PROPERTY CXX_STANDARD 17)
  set_property(TARGET ${_NAME} PROPERTY CXX_STANDARD_REQUIRED ON)

  add_test(NAME ${_NAME} COMMAND ${_NAME})
  set_tests_properties(${_NAME} PROPERTIES FAIL_REGULAR_EXPRESSION ".*FAILED.*")
endfunction()

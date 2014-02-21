cmake_minimum_required( VERSION 2.8 )
project( display_image )

message( STATUS "Project: " ${PROJECT_NAME} )
message( STATUS "Source: " ${PROJECT_SOURCE_DIR} )
message( STATUS "Binary: " ${PROJECT_BINARY_DIR} )

#set( CMAKE_BUILD_TYPE "Release")

find_package( OpenCV REQUIRED )
include_directories( ${OpenCV_INCLUDE_DIRS} )
message( STATUS "OpenCV: " ${OpenCV_INCLUDE_DIRS} )

#set the default path for built executables to the "bin" directory
set( EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin )
#set the default path for built libraries to the "lib" directory
set( LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib )

#add_executable( sample ${PROJECT_SOURCE_DIR}/src/sample.cpp )
#target_link_libraries( sample ${OpenCV_LIBS} )

#file( GLOB CPP_SOURCES ${PROJECT_SOURCE_DIR}/src/*.cpp )
file( GLOB CPP_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp )
foreach( CPP_SOURCE ${CPP_SOURCES} )
  message( STATUS "File: " ${CPP_SOURCE} )
  get_filename_component( EXECUTABLE ${CPP_SOURCE} NAME_WE )
  message( STATUS "Exec: " ${EXECUTABLE} )
  add_executable( ${EXECUTABLE} ${CPP_SOURCE} )
  target_link_libraries( ${EXECUTABLE} ${OpenCV_LIBS} )
endforeach( CPP_SOURCE ${CPP_SOURCES} )

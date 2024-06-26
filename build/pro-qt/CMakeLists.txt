cmake_minimum_required(VERSION 3.5)
project(polaris-engine VERSION 0.1 LANGUAGES CXX C)

# We use .ui file translation.
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

# We use C++17 because Qt6 supports it.
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# We use Qt6.
find_package(QT NAMES Qt6 REQUIRED COMPONENTS Widgets)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Widgets OpenGL OpenGLWidgets Gui Multimedia)

# For *BSD.
set(CMAKE_LIBRARY_PATH /usr/local/lib)
find_library(png jpeg webp freetype2 brotlidec brotlicommon asound)
link_directories(/usr/local/lib)

# We use the following preprocessor macros.
add_compile_definitions(
  USE_EDITOR
  USE_QT

  # Qt's audio classes are totally uselss on Linux adn *BSD.
  #USE_QT_AUDIO
)

# The following source files.
set(PROJECT_SOURCES
  main.cpp
  mainwindow.cpp
  mainwindow.h
  openglwidget.cpp
  openglwidget.h
  glwrapper.cpp
  mainwindow.ui
)

# Add the main engine.
add_subdirectory(deps)
include_directories(deps .)

# The following is our output executable.
qt_add_executable(
  polaris-engine
  MANUAL_FINALIZATION
  ${PROJECT_SOURCES}
)

# Dynamic linking for a self compilation on Linux:
target_link_libraries(
  polaris-engine
  PRIVATE
  polaris
  png
  jpeg
  webp
  freetype
  vorbisfile
  vorbis
  ogg
  brotlidec
  brotlicommon
  bz2
  z

  # Comment out if not for Linux.
  asound

  Qt${QT_VERSION_MAJOR}::Widgets
  Qt${QT_VERSION_MAJOR}::OpenGLWidgets
  Qt${QT_VERSION_MAJOR}::Multimedia
)

# Finish.
qt_finalize_executable(polaris)

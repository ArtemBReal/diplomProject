# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

project(flutter_nfc_kit_aurora_library VERSION 0.0.1 LANGUAGES C)

add_library(flutter_nfc_kit_aurora SHARED
  "flutter_nfc_kit_aurora.c"
)

set_target_properties(flutter_nfc_kit_aurora PROPERTIES
  PUBLIC_HEADER flutter_nfc_kit_aurora.h
  OUTPUT_NAME "flutter_nfc_kit_aurora"
)

target_compile_definitions(flutter_nfc_kit_aurora PUBLIC DART_SHARED_LIB)

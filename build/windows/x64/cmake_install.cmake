# Install script for directory: C:/kinobox_payment/windows

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "$<TARGET_FILE_DIR:kinobox_payment>")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/kinobox_payment/build/windows/x64/flutter/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/kinobox_payment/build/windows/x64/runner/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/kinobox_payment/build/windows/x64/plugins/desktop_multi_window/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/kinobox_payment/build/windows/x64/plugins/desktop_webview_window/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/kinobox_payment/build/windows/x64/plugins/fvp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/kinobox_payment/build/windows/x64/plugins/rive_native/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/kinobox_payment/build/windows/x64/plugins/screen_retriever_windows/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/kinobox_payment/build/windows/x64/plugins/window_manager/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/kinobox_payment/build/windows/x64/plugins/mixin_logger/cmake_install.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/kinobox_payment/build/windows/x64/runner/Debug/kinobox_payment.exe")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/kinobox_payment/build/windows/x64/runner/Debug" TYPE EXECUTABLE FILES "C:/kinobox_payment/build/windows/x64/runner/Debug/kinobox_payment.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/kinobox_payment/build/windows/x64/runner/Profile/kinobox_payment.exe")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/kinobox_payment/build/windows/x64/runner/Profile" TYPE EXECUTABLE FILES "C:/kinobox_payment/build/windows/x64/runner/Profile/kinobox_payment.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/kinobox_payment/build/windows/x64/runner/Release/kinobox_payment.exe")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/kinobox_payment/build/windows/x64/runner/Release" TYPE EXECUTABLE FILES "C:/kinobox_payment/build/windows/x64/runner/Release/kinobox_payment.exe")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/kinobox_payment/build/windows/x64/runner/Debug/data/icudtl.dat")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/kinobox_payment/build/windows/x64/runner/Debug/data" TYPE FILE FILES "C:/kinobox_payment/windows/flutter/ephemeral/icudtl.dat")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/kinobox_payment/build/windows/x64/runner/Profile/data/icudtl.dat")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/kinobox_payment/build/windows/x64/runner/Profile/data" TYPE FILE FILES "C:/kinobox_payment/windows/flutter/ephemeral/icudtl.dat")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/kinobox_payment/build/windows/x64/runner/Release/data/icudtl.dat")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/kinobox_payment/build/windows/x64/runner/Release/data" TYPE FILE FILES "C:/kinobox_payment/windows/flutter/ephemeral/icudtl.dat")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/kinobox_payment/build/windows/x64/runner/Debug/flutter_windows.dll")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/kinobox_payment/build/windows/x64/runner/Debug" TYPE FILE FILES "C:/kinobox_payment/windows/flutter/ephemeral/flutter_windows.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/kinobox_payment/build/windows/x64/runner/Profile/flutter_windows.dll")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/kinobox_payment/build/windows/x64/runner/Profile" TYPE FILE FILES "C:/kinobox_payment/windows/flutter/ephemeral/flutter_windows.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/kinobox_payment/build/windows/x64/runner/Release/flutter_windows.dll")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/kinobox_payment/build/windows/x64/runner/Release" TYPE FILE FILES "C:/kinobox_payment/windows/flutter/ephemeral/flutter_windows.dll")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/kinobox_payment/build/windows/x64/runner/Debug/desktop_multi_window_plugin.dll;C:/kinobox_payment/build/windows/x64/runner/Debug/desktop_webview_window_plugin.dll;C:/kinobox_payment/build/windows/x64/runner/Debug/Webview2Loader.dll;C:/kinobox_payment/build/windows/x64/runner/Debug/fvp_plugin.dll;C:/kinobox_payment/build/windows/x64/runner/Debug/mdk.dll;C:/kinobox_payment/build/windows/x64/runner/Debug/mdk-braw.dll;C:/kinobox_payment/build/windows/x64/runner/Debug/mdk-nvjp2k.dll;C:/kinobox_payment/build/windows/x64/runner/Debug/mdk-r3d.dll;C:/kinobox_payment/build/windows/x64/runner/Debug/ffmpeg-8.dll;C:/kinobox_payment/build/windows/x64/runner/Debug/libass.dll;C:/kinobox_payment/build/windows/x64/runner/Debug/rive_native_plugin.dll;C:/kinobox_payment/build/windows/x64/runner/Debug/rive_native.dll;C:/kinobox_payment/build/windows/x64/runner/Debug/screen_retriever_windows_plugin.dll;C:/kinobox_payment/build/windows/x64/runner/Debug/window_manager_plugin.dll;C:/kinobox_payment/build/windows/x64/runner/Debug/mixin_logger.dll")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/kinobox_payment/build/windows/x64/runner/Debug" TYPE FILE FILES
      "C:/kinobox_payment/build/windows/x64/plugins/desktop_multi_window/Debug/desktop_multi_window_plugin.dll"
      "C:/kinobox_payment/build/windows/x64/plugins/desktop_webview_window/Debug/desktop_webview_window_plugin.dll"
      "C:/kinobox_payment/windows/flutter/ephemeral/.plugin_symlinks/desktop_webview_window/windows/libs/x64/Webview2Loader.dll"
      "C:/kinobox_payment/build/windows/x64/plugins/fvp/Debug/fvp_plugin.dll"
      "C:/kinobox_payment/windows/flutter/ephemeral/.plugin_symlinks/fvp/windows/mdk-sdk/bin/x64/mdk.dll"
      "C:/kinobox_payment/windows/flutter/ephemeral/.plugin_symlinks/fvp/windows/mdk-sdk/bin/x64/mdk-braw.dll"
      "C:/kinobox_payment/windows/flutter/ephemeral/.plugin_symlinks/fvp/windows/mdk-sdk/bin/x64/mdk-nvjp2k.dll"
      "C:/kinobox_payment/windows/flutter/ephemeral/.plugin_symlinks/fvp/windows/mdk-sdk/bin/x64/mdk-r3d.dll"
      "C:/kinobox_payment/windows/flutter/ephemeral/.plugin_symlinks/fvp/windows/mdk-sdk/bin/x64/ffmpeg-8.dll"
      "C:/kinobox_payment/windows/flutter/ephemeral/.plugin_symlinks/fvp/windows/mdk-sdk/bin/x64/libass.dll"
      "C:/kinobox_payment/build/windows/x64/plugins/rive_native/Debug/rive_native_plugin.dll"
      "C:/kinobox_payment/windows/flutter/ephemeral/.plugin_symlinks/rive_native/windows/bin/lib/debug/rive_native.dll"
      "C:/kinobox_payment/build/windows/x64/plugins/screen_retriever_windows/Debug/screen_retriever_windows_plugin.dll"
      "C:/kinobox_payment/build/windows/x64/plugins/window_manager/Debug/window_manager_plugin.dll"
      "C:/kinobox_payment/build/windows/x64/plugins/mixin_logger/shared/Debug/mixin_logger.dll"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/kinobox_payment/build/windows/x64/runner/Profile/desktop_multi_window_plugin.dll;C:/kinobox_payment/build/windows/x64/runner/Profile/desktop_webview_window_plugin.dll;C:/kinobox_payment/build/windows/x64/runner/Profile/Webview2Loader.dll;C:/kinobox_payment/build/windows/x64/runner/Profile/fvp_plugin.dll;C:/kinobox_payment/build/windows/x64/runner/Profile/mdk.dll;C:/kinobox_payment/build/windows/x64/runner/Profile/mdk-braw.dll;C:/kinobox_payment/build/windows/x64/runner/Profile/mdk-nvjp2k.dll;C:/kinobox_payment/build/windows/x64/runner/Profile/mdk-r3d.dll;C:/kinobox_payment/build/windows/x64/runner/Profile/ffmpeg-8.dll;C:/kinobox_payment/build/windows/x64/runner/Profile/libass.dll;C:/kinobox_payment/build/windows/x64/runner/Profile/rive_native_plugin.dll;C:/kinobox_payment/build/windows/x64/runner/Profile/rive_native.dll;C:/kinobox_payment/build/windows/x64/runner/Profile/screen_retriever_windows_plugin.dll;C:/kinobox_payment/build/windows/x64/runner/Profile/window_manager_plugin.dll;C:/kinobox_payment/build/windows/x64/runner/Profile/mixin_logger.dll")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/kinobox_payment/build/windows/x64/runner/Profile" TYPE FILE FILES
      "C:/kinobox_payment/build/windows/x64/plugins/desktop_multi_window/Profile/desktop_multi_window_plugin.dll"
      "C:/kinobox_payment/build/windows/x64/plugins/desktop_webview_window/Profile/desktop_webview_window_plugin.dll"
      "C:/kinobox_payment/windows/flutter/ephemeral/.plugin_symlinks/desktop_webview_window/windows/libs/x64/Webview2Loader.dll"
      "C:/kinobox_payment/build/windows/x64/plugins/fvp/Profile/fvp_plugin.dll"
      "C:/kinobox_payment/windows/flutter/ephemeral/.plugin_symlinks/fvp/windows/mdk-sdk/bin/x64/mdk.dll"
      "C:/kinobox_payment/windows/flutter/ephemeral/.plugin_symlinks/fvp/windows/mdk-sdk/bin/x64/mdk-braw.dll"
      "C:/kinobox_payment/windows/flutter/ephemeral/.plugin_symlinks/fvp/windows/mdk-sdk/bin/x64/mdk-nvjp2k.dll"
      "C:/kinobox_payment/windows/flutter/ephemeral/.plugin_symlinks/fvp/windows/mdk-sdk/bin/x64/mdk-r3d.dll"
      "C:/kinobox_payment/windows/flutter/ephemeral/.plugin_symlinks/fvp/windows/mdk-sdk/bin/x64/ffmpeg-8.dll"
      "C:/kinobox_payment/windows/flutter/ephemeral/.plugin_symlinks/fvp/windows/mdk-sdk/bin/x64/libass.dll"
      "C:/kinobox_payment/build/windows/x64/plugins/rive_native/Profile/rive_native_plugin.dll"
      "C:/kinobox_payment/windows/flutter/ephemeral/.plugin_symlinks/rive_native/windows/bin/lib/release/rive_native.dll"
      "C:/kinobox_payment/build/windows/x64/plugins/screen_retriever_windows/Profile/screen_retriever_windows_plugin.dll"
      "C:/kinobox_payment/build/windows/x64/plugins/window_manager/Profile/window_manager_plugin.dll"
      "C:/kinobox_payment/build/windows/x64/plugins/mixin_logger/shared/Profile/mixin_logger.dll"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/kinobox_payment/build/windows/x64/runner/Release/desktop_multi_window_plugin.dll;C:/kinobox_payment/build/windows/x64/runner/Release/desktop_webview_window_plugin.dll;C:/kinobox_payment/build/windows/x64/runner/Release/Webview2Loader.dll;C:/kinobox_payment/build/windows/x64/runner/Release/fvp_plugin.dll;C:/kinobox_payment/build/windows/x64/runner/Release/mdk.dll;C:/kinobox_payment/build/windows/x64/runner/Release/mdk-braw.dll;C:/kinobox_payment/build/windows/x64/runner/Release/mdk-nvjp2k.dll;C:/kinobox_payment/build/windows/x64/runner/Release/mdk-r3d.dll;C:/kinobox_payment/build/windows/x64/runner/Release/ffmpeg-8.dll;C:/kinobox_payment/build/windows/x64/runner/Release/libass.dll;C:/kinobox_payment/build/windows/x64/runner/Release/rive_native_plugin.dll;C:/kinobox_payment/build/windows/x64/runner/Release/rive_native.dll;C:/kinobox_payment/build/windows/x64/runner/Release/screen_retriever_windows_plugin.dll;C:/kinobox_payment/build/windows/x64/runner/Release/window_manager_plugin.dll;C:/kinobox_payment/build/windows/x64/runner/Release/mixin_logger.dll")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/kinobox_payment/build/windows/x64/runner/Release" TYPE FILE FILES
      "C:/kinobox_payment/build/windows/x64/plugins/desktop_multi_window/Release/desktop_multi_window_plugin.dll"
      "C:/kinobox_payment/build/windows/x64/plugins/desktop_webview_window/Release/desktop_webview_window_plugin.dll"
      "C:/kinobox_payment/windows/flutter/ephemeral/.plugin_symlinks/desktop_webview_window/windows/libs/x64/Webview2Loader.dll"
      "C:/kinobox_payment/build/windows/x64/plugins/fvp/Release/fvp_plugin.dll"
      "C:/kinobox_payment/windows/flutter/ephemeral/.plugin_symlinks/fvp/windows/mdk-sdk/bin/x64/mdk.dll"
      "C:/kinobox_payment/windows/flutter/ephemeral/.plugin_symlinks/fvp/windows/mdk-sdk/bin/x64/mdk-braw.dll"
      "C:/kinobox_payment/windows/flutter/ephemeral/.plugin_symlinks/fvp/windows/mdk-sdk/bin/x64/mdk-nvjp2k.dll"
      "C:/kinobox_payment/windows/flutter/ephemeral/.plugin_symlinks/fvp/windows/mdk-sdk/bin/x64/mdk-r3d.dll"
      "C:/kinobox_payment/windows/flutter/ephemeral/.plugin_symlinks/fvp/windows/mdk-sdk/bin/x64/ffmpeg-8.dll"
      "C:/kinobox_payment/windows/flutter/ephemeral/.plugin_symlinks/fvp/windows/mdk-sdk/bin/x64/libass.dll"
      "C:/kinobox_payment/build/windows/x64/plugins/rive_native/Release/rive_native_plugin.dll"
      "C:/kinobox_payment/windows/flutter/ephemeral/.plugin_symlinks/rive_native/windows/bin/lib/release/rive_native.dll"
      "C:/kinobox_payment/build/windows/x64/plugins/screen_retriever_windows/Release/screen_retriever_windows_plugin.dll"
      "C:/kinobox_payment/build/windows/x64/plugins/window_manager/Release/window_manager_plugin.dll"
      "C:/kinobox_payment/build/windows/x64/plugins/mixin_logger/shared/Release/mixin_logger.dll"
      )
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/kinobox_payment/build/windows/x64/runner/Debug/")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/kinobox_payment/build/windows/x64/runner/Debug" TYPE DIRECTORY FILES "C:/kinobox_payment/build/native_assets/windows/")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/kinobox_payment/build/windows/x64/runner/Profile/")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/kinobox_payment/build/windows/x64/runner/Profile" TYPE DIRECTORY FILES "C:/kinobox_payment/build/native_assets/windows/")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/kinobox_payment/build/windows/x64/runner/Release/")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/kinobox_payment/build/windows/x64/runner/Release" TYPE DIRECTORY FILES "C:/kinobox_payment/build/native_assets/windows/")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    
  file(REMOVE_RECURSE "C:/kinobox_payment/build/windows/x64/runner/Debug/data/flutter_assets")
  
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    
  file(REMOVE_RECURSE "C:/kinobox_payment/build/windows/x64/runner/Profile/data/flutter_assets")
  
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    
  file(REMOVE_RECURSE "C:/kinobox_payment/build/windows/x64/runner/Release/data/flutter_assets")
  
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/kinobox_payment/build/windows/x64/runner/Debug/data/flutter_assets")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/kinobox_payment/build/windows/x64/runner/Debug/data" TYPE DIRECTORY FILES "C:/kinobox_payment/build//flutter_assets")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/kinobox_payment/build/windows/x64/runner/Profile/data/flutter_assets")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/kinobox_payment/build/windows/x64/runner/Profile/data" TYPE DIRECTORY FILES "C:/kinobox_payment/build//flutter_assets")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/kinobox_payment/build/windows/x64/runner/Release/data/flutter_assets")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/kinobox_payment/build/windows/x64/runner/Release/data" TYPE DIRECTORY FILES "C:/kinobox_payment/build//flutter_assets")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/kinobox_payment/build/windows/x64/runner/Profile/data/app.so")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/kinobox_payment/build/windows/x64/runner/Profile/data" TYPE FILE FILES "C:/kinobox_payment/build/windows/app.so")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "C:/kinobox_payment/build/windows/x64/runner/Release/data/app.so")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "C:/kinobox_payment/build/windows/x64/runner/Release/data" TYPE FILE FILES "C:/kinobox_payment/build/windows/app.so")
  endif()
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "C:/kinobox_payment/build/windows/x64/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
if(CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_COMPONENT MATCHES "^[a-zA-Z0-9_.+-]+$")
    set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
  else()
    string(MD5 CMAKE_INST_COMP_HASH "${CMAKE_INSTALL_COMPONENT}")
    set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INST_COMP_HASH}.txt")
    unset(CMAKE_INST_COMP_HASH)
  endif()
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "C:/kinobox_payment/build/windows/x64/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()

# Install script for directory: /home/usappz/bricks-project/platforms/microzed/mz_petalinux/sw/openamp_freertos_bsp/ps7_cortexa9_1/libsrc/libmetal_v1_2/src/libmetal/lib

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
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

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/atomic.h" FILES "/home/usappz/bricks-project/platforms/microzed/mz_petalinux/sw/openamp_freertos_bsp/ps7_cortexa9_1/libsrc/libmetal_v1_2/build_libmetal/lib/include/metal/atomic.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/compiler.h" FILES "/home/usappz/bricks-project/platforms/microzed/mz_petalinux/sw/openamp_freertos_bsp/ps7_cortexa9_1/libsrc/libmetal_v1_2/build_libmetal/lib/include/metal/compiler.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/config.h" FILES "/home/usappz/bricks-project/platforms/microzed/mz_petalinux/sw/openamp_freertos_bsp/ps7_cortexa9_1/libsrc/libmetal_v1_2/build_libmetal/lib/include/metal/config.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/device.h" FILES "/home/usappz/bricks-project/platforms/microzed/mz_petalinux/sw/openamp_freertos_bsp/ps7_cortexa9_1/libsrc/libmetal_v1_2/build_libmetal/lib/include/metal/device.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/io.h" FILES "/home/usappz/bricks-project/platforms/microzed/mz_petalinux/sw/openamp_freertos_bsp/ps7_cortexa9_1/libsrc/libmetal_v1_2/build_libmetal/lib/include/metal/io.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/list.h" FILES "/home/usappz/bricks-project/platforms/microzed/mz_petalinux/sw/openamp_freertos_bsp/ps7_cortexa9_1/libsrc/libmetal_v1_2/build_libmetal/lib/include/metal/list.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/log.h" FILES "/home/usappz/bricks-project/platforms/microzed/mz_petalinux/sw/openamp_freertos_bsp/ps7_cortexa9_1/libsrc/libmetal_v1_2/build_libmetal/lib/include/metal/log.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/mutex.h" FILES "/home/usappz/bricks-project/platforms/microzed/mz_petalinux/sw/openamp_freertos_bsp/ps7_cortexa9_1/libsrc/libmetal_v1_2/build_libmetal/lib/include/metal/mutex.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/condition.h" FILES "/home/usappz/bricks-project/platforms/microzed/mz_petalinux/sw/openamp_freertos_bsp/ps7_cortexa9_1/libsrc/libmetal_v1_2/build_libmetal/lib/include/metal/condition.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/shmem.h" FILES "/home/usappz/bricks-project/platforms/microzed/mz_petalinux/sw/openamp_freertos_bsp/ps7_cortexa9_1/libsrc/libmetal_v1_2/build_libmetal/lib/include/metal/shmem.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/sys.h" FILES "/home/usappz/bricks-project/platforms/microzed/mz_petalinux/sw/openamp_freertos_bsp/ps7_cortexa9_1/libsrc/libmetal_v1_2/build_libmetal/lib/include/metal/sys.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/utilities.h" FILES "/home/usappz/bricks-project/platforms/microzed/mz_petalinux/sw/openamp_freertos_bsp/ps7_cortexa9_1/libsrc/libmetal_v1_2/build_libmetal/lib/include/metal/utilities.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/version.h" FILES "/home/usappz/bricks-project/platforms/microzed/mz_petalinux/sw/openamp_freertos_bsp/ps7_cortexa9_1/libsrc/libmetal_v1_2/build_libmetal/lib/include/metal/version.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/cpu.h" FILES "/home/usappz/bricks-project/platforms/microzed/mz_petalinux/sw/openamp_freertos_bsp/ps7_cortexa9_1/libsrc/libmetal_v1_2/build_libmetal/lib/include/metal/cpu.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/spinlock.h" FILES "/home/usappz/bricks-project/platforms/microzed/mz_petalinux/sw/openamp_freertos_bsp/ps7_cortexa9_1/libsrc/libmetal_v1_2/build_libmetal/lib/include/metal/spinlock.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/irq.h" FILES "/home/usappz/bricks-project/platforms/microzed/mz_petalinux/sw/openamp_freertos_bsp/ps7_cortexa9_1/libsrc/libmetal_v1_2/build_libmetal/lib/include/metal/irq.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/alloc.h" FILES "/home/usappz/bricks-project/platforms/microzed/mz_petalinux/sw/openamp_freertos_bsp/ps7_cortexa9_1/libsrc/libmetal_v1_2/build_libmetal/lib/include/metal/alloc.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/cache.h" FILES "/home/usappz/bricks-project/platforms/microzed/mz_petalinux/sw/openamp_freertos_bsp/ps7_cortexa9_1/libsrc/libmetal_v1_2/build_libmetal/lib/include/metal/cache.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/dma.h" FILES "/home/usappz/bricks-project/platforms/microzed/mz_petalinux/sw/openamp_freertos_bsp/ps7_cortexa9_1/libsrc/libmetal_v1_2/build_libmetal/lib/include/metal/dma.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/time.h" FILES "/home/usappz/bricks-project/platforms/microzed/mz_petalinux/sw/openamp_freertos_bsp/ps7_cortexa9_1/libsrc/libmetal_v1_2/build_libmetal/lib/include/metal/time.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/sleep.h" FILES "/home/usappz/bricks-project/platforms/microzed/mz_petalinux/sw/openamp_freertos_bsp/ps7_cortexa9_1/libsrc/libmetal_v1_2/build_libmetal/lib/include/metal/sleep.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/compiler/gcc/atomic.h" FILES "/home/usappz/bricks-project/platforms/microzed/mz_petalinux/sw/openamp_freertos_bsp/ps7_cortexa9_1/libsrc/libmetal_v1_2/build_libmetal/lib/include/metal/compiler/gcc/atomic.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/compiler/gcc/compiler.h" FILES "/home/usappz/bricks-project/platforms/microzed/mz_petalinux/sw/openamp_freertos_bsp/ps7_cortexa9_1/libsrc/libmetal_v1_2/build_libmetal/lib/include/metal/compiler/gcc/compiler.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/processor/arm/atomic.h" FILES "/home/usappz/bricks-project/platforms/microzed/mz_petalinux/sw/openamp_freertos_bsp/ps7_cortexa9_1/libsrc/libmetal_v1_2/build_libmetal/lib/include/metal/processor/arm/atomic.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/processor/arm/cpu.h" FILES "/home/usappz/bricks-project/platforms/microzed/mz_petalinux/sw/openamp_freertos_bsp/ps7_cortexa9_1/libsrc/libmetal_v1_2/build_libmetal/lib/include/metal/processor/arm/cpu.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/system/freertos/sys.h" FILES "/home/usappz/bricks-project/platforms/microzed/mz_petalinux/sw/openamp_freertos_bsp/ps7_cortexa9_1/libsrc/libmetal_v1_2/build_libmetal/lib/include/metal/system/freertos/sys.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/system/freertos/alloc.h" FILES "/home/usappz/bricks-project/platforms/microzed/mz_petalinux/sw/openamp_freertos_bsp/ps7_cortexa9_1/libsrc/libmetal_v1_2/build_libmetal/lib/include/metal/system/freertos/alloc.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/system/freertos/irq.h" FILES "/home/usappz/bricks-project/platforms/microzed/mz_petalinux/sw/openamp_freertos_bsp/ps7_cortexa9_1/libsrc/libmetal_v1_2/build_libmetal/lib/include/metal/system/freertos/irq.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/system/freertos/mutex.h" FILES "/home/usappz/bricks-project/platforms/microzed/mz_petalinux/sw/openamp_freertos_bsp/ps7_cortexa9_1/libsrc/libmetal_v1_2/build_libmetal/lib/include/metal/system/freertos/mutex.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/system/freertos/condition.h" FILES "/home/usappz/bricks-project/platforms/microzed/mz_petalinux/sw/openamp_freertos_bsp/ps7_cortexa9_1/libsrc/libmetal_v1_2/build_libmetal/lib/include/metal/system/freertos/condition.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/system/freertos/zynq7/sys.h" FILES "/home/usappz/bricks-project/platforms/microzed/mz_petalinux/sw/openamp_freertos_bsp/ps7_cortexa9_1/libsrc/libmetal_v1_2/build_libmetal/lib/include/metal/system/freertos/zynq7/sys.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/usappz/bricks-project/platforms/microzed/mz_petalinux/sw/openamp_freertos_bsp/ps7_cortexa9_1/libsrc/libmetal_v1_2/build_libmetal/lib/libmetal.a")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/usappz/bricks-project/platforms/microzed/mz_petalinux/sw/openamp_freertos_bsp/ps7_cortexa9_1/libsrc/libmetal_v1_2/build_libmetal/lib/compiler/cmake_install.cmake")
  include("/home/usappz/bricks-project/platforms/microzed/mz_petalinux/sw/openamp_freertos_bsp/ps7_cortexa9_1/libsrc/libmetal_v1_2/build_libmetal/lib/processor/cmake_install.cmake")
  include("/home/usappz/bricks-project/platforms/microzed/mz_petalinux/sw/openamp_freertos_bsp/ps7_cortexa9_1/libsrc/libmetal_v1_2/build_libmetal/lib/system/cmake_install.cmake")

endif()


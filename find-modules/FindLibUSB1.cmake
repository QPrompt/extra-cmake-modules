# - Try to find the libusb-1.0 library
# Once done this defines
#
#  LIBUSB1_FOUND - system has libusb-1.0
#  LIBUSB1_INCLUDE_DIRS - the libusb-1.0 include directory
#  LIBUSB1_LIBRARIES - Link these to use libusb-1.0

# Copyright (c) 2011 Yury Kudryashov, <urkud@ya.ru>
# Based on FindUSB.cmake which is:
#   Copyright (c) 2006, 2008  Laurent Montel, <montel@kde.org>
#
# Redistribution and use is allowed according to the terms of the BSD license.
# For details see the accompanying COPYING-CMAKE-SCRIPTS file.

# use pkg-config to get the directories and then use these values
# in the FIND_PATH() and FIND_LIBRARY() calls
find_package(PkgConfig)
pkg_check_modules(PC_LIBUSB1 QUIET libusb-1.0)

find_path(LIBUSB1_TOP_INCLUDE_DIR libusb-1.0/libusb.h
  HINTS ${PC_LIBUSB1_INCLUDEDIR})

set(LIBUSB1_INCLUDE_DIRS ${LIBUSB1_TOP_INCLUDE_DIR}/libusb-1.0)

find_library(LIBUSB1_LIBRARY NAMES usb-1.0
  HINTS ${PC_LIBUSB1_LIBDIR} ${PC_LIBUSB1_LIBRARY_DIRS})

set(LIBUSB1_LIBRARIES ${LIBUSB1_LIBRARY})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(LIBUSB1 DEFAULT_MSG LIBUSB1_LIBRARIES LIBUSB1_INCLUDE_DIRS)

include(FeatureSummary)
set_package_properties(USB1 PROPERTIES URL http://www.libusb.org/
  DESCRIPTION "A library that provides uniform API to access USB devices on many OSes")

mark_as_advanced(LIBUSB1_TOP_INCLUDE_DIR LIBUSB1_LIBRARY)
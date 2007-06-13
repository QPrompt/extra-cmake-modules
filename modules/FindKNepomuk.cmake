# Once done this will define
#
#  KNEPOMUK_FOUND - system has the Nepomuk-KDE backbone lib KNep
#  KNEPOMUK_INCLUDES - the libKNep include directory
#  KNEPOMUK_LIBRARIES - Link these to use libKNep
#

if(KNEPOMUK_INCLUDES AND KNEPOMUK_LIBRARIES)
	set(KNepomuk_FIND_QUIETLY TRUE)
endif(KNEPOMUK_INCLUDES AND KNEPOMUK_LIBRARIES)

FIND_PATH(KNEPOMUK_INCLUDES 
  NAMES
  knepomuk/knepomuk.h
  PATHS
  /usr/include
  /usr/local/include
  ${KDE4_INCLUDE_DIR}
  ${INCLUDE_INSTALL_DIR}
)

FIND_LIBRARY(KNEPOMUK_LIBRARIES 
  NAMES 
  knepomuk
  PATHS
  /usr/lib
  /usr/local/lib
  ${KDE4_LIB_DIR}
  ${LIB_INSTALL_DIR}
)

if(KNEPOMUK_INCLUDES AND KNEPOMUK_LIBRARIES)
   set(KNEPOMUK_FOUND TRUE)
endif(KNEPOMUK_INCLUDES AND KNEPOMUK_LIBRARIES)

if(KNEPOMUK_FOUND)
   if(NOT KNepomuk_FIND_QUIETLY)
   	message(STATUS "Found KNepomuk: ${KNEPOMUK_LIBRARIES}")
   endif(NOT KNepomuk_FIND_QUIETLY)
else(KNEPOMUK_FOUND)
  if(KNepomuk_FIND_REQUIRED)
    message(FATAL_ERROR "Could not find KNepomuk library.")
  endif(KNepomuk_FIND_REQUIRED)
endif(KNEPOMUK_FOUND)

MARK_AS_ADVANCED(KNEPOMUK_INCLUDES KNEPOMUK_LIBRARIES)


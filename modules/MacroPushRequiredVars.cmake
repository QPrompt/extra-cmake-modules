# this module defines two macros:
# MACRO_PUSH_REQUIRED_VARS()
# and
# MACRO_POP_REQUIRED_VARS()
# use these if you call cmake macros which use
# any of the CMAKE_REQUIRED_XXX variables
#
# Usage:
# MACRO_PUSH_REQUIRED_VARS()
# SET(CMAKE_REQUIRED_DEFINITIONS ${CMAKE_REQUIRED_DEFINITIONS} -DSOME_MORE_DEF)
# CHECK_FUNCTION_EXISTS(...)
# MACRO_POP_REQUIRED_VARS()
#

MACRO(MACRO_PUSH_REQUIRED_VARS)
   SET(_CMAKE_REQUIRED_INCLUDES_SAVE    ${CMAKE_REQUIRED_INCLUDES})
   SET(_CMAKE_REQUIRED_DEFINITIONS_SAVE ${CMAKE_REQUIRED_DEFINITIONS})
   SET(_CMAKE_REQUIRED_LIBRARIES_SAVE   ${CMAKE_REQUIRED_LIBRARIES})
   SET(_CMAKE_REQUIRED_FLAGS_SAVE       ${CMAKE_REQUIRED_FLAGS})
ENDMACRO(MACRO_PUSH_REQUIRED_VARS)

MACRO(MACRO_POP_REQUIRED_VARS)
   SET(CMAKE_REQUIRED_INCLUDES    ${_CMAKE_REQUIRED_INCLUDES_SAVE})
   SET(CMAKE_REQUIRED_DEFINITIONS ${_CMAKE_REQUIRED_DEFINITIONS_SAVE})
   SET(CMAKE_REQUIRED_LIBRARIES   ${_CMAKE_REQUIRED_LIBRARIES_SAVE})
   SET(CMAKE_REQUIRED_FLAGS       ${_CMAKE_REQUIRED_FLAGS_SAVE})
ENDMACRO(MACRO_POP_REQUIRED_VARS)


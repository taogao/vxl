# - Test for Python
# Once loaded this will define
#   PYTHON_FOUND           - system has Python
#   PYTHON_INCLUDE_DIR     - path to where Python.h is found
#   PYTHON_INCLUDE_DIRS    - combined include path
#   PYTHON_PC_INCLUDE_PATH - PC directory for Win
#   PYTHON_LIBRARY         - libraries you need to link to
#   PYTHON_DEBUG_LIBRARY   - path to the debug library

# Flag that determines if we were able to successfully build Python.
# Initialize to NO. Change below if yes.
SET(PYTHON_FOUND "NO" CACHE INTERNAL "Was Python successfully built?" )
if(BUILD_BRL_PYTHON)
set(Python_ADDITIONAL_VERSIONS 2.7)
find_package(PythonLibs)

IF(PYTHON_INCLUDE_DIR)
 IF(PYTHON_LIBRARY OR PYTHON_DEBUG_LIBRARY)
  # everything found
  SET(PYTHON_FOUND "YES" CACHE INTERNAL "Was Python successfully built?")

  IF( WIN32 )
    FIND_PATH(PYTHON_PC_INCLUDE_PATH
      NAMES pyconfig.h

      PATHS
      ${PYTHON_INCLUDE_DIRS}
      ${PYTHON_FRAMEWORK_INCLUDES}
      [HKEY_LOCAL_MACHINE\\SOFTWARE\\Python\\PythonCore\\2.7\\InstallPath]/PC

      PATH_SUFFIXES
       python2.7
    )

    SET(PYTHON_INCLUDE_DIRS
      ${PYTHON_INCLUDE_DIR}
      ${PYTHON_PC_INCLUDE_PATH}
    )
    #MESSAGE(${PYTHON_INCLUDE_DIRS})

    MARK_AS_ADVANCED(
     PYTHON_PC_INCLUDE_PATH
    )

  ENDIF(WIN32)

 ENDIF(PYTHON_LIBRARY OR PYTHON_DEBUG_LIBRARY)
ENDIF(PYTHON_INCLUDE_DIR)
endif()

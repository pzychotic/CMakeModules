# ----------------------------------------------------------------------------
# Some general project defaults and options.
# Set variables like PZY_PROJECT_NAME and PZY_PROJECT_VERSION before including
# this file to override the defaults if needed.
#
# Dependencies:
#  - Platform.cmake
# ----------------------------------------------------------------------------

if( NOT PZY_PROJECT_NAME )
    set( PZY_PROJECT_NAME ${PROJECT_NAME} )
endif()

if( NOT PZY_PROJECT_VERSION )
    if( PROJECT_VERSION )
        set( PZY_PROJECT_VERSION ${PROJECT_VERSION} )
    else()
        set( PZY_PROJECT_VERSION "0.0.0" )
        message( "No project version specified!" )
    endif()
endif()

option( PZY_PROJECT_RELEASE "Creates versioned install path for every project release" OFF )

set( PZY_INSTALL_PREFIX "" CACHE PATH "Repository for project installs" )

if( PZY_PROJECT_RELEASE )
    set( CMAKE_INSTALL_PREFIX "${PZY_INSTALL_PREFIX}/${PZY_PROJECT_NAME}/${PZY_PROJECT_VERSION}/${PZY_COMPILER_NAME}/${PZY_COMPILER_ARCH}" CACHE PATH "Repository for project installs" FORCE )
else()
    set( CMAKE_INSTALL_PREFIX "${PZY_INSTALL_PREFIX}/${PZY_COMPILER_NAME}/${PZY_COMPILER_ARCH}" CACHE PATH "Repository for project installs" FORCE )
endif()

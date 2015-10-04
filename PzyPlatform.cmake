# ----------------------------------------------------------------------------
# Some general platform / compiler detection stuff
# ----------------------------------------------------------------------------

set( PZY_COMPILER           "Unknown" )
set( PZY_COMPILER_ARCH      "Unknown" )
set( PZY_COMPILER_NAME      "Unknown" )
set( PZY_COMPILER_VERSION   "Unknown" )

# for convenience not having to use STREQUAL on PZY_COMPILER_ARCH all the time
set( PZY_ARCH               0 )


# find the activated programming language, don't care for fortran
if( DEFINED CMAKE_CXX_COMPILER_ID )
    set( LANGUAGE "CXX" )
elseif( DEFINED CMAKE_C_COMPILER_ID )
    set( LANGUAGE "C" )
endif()

# STREQUAL doesn't work here because MSVC is a variable that gets dereferenced
if( DEFINED CMAKE_${LANGUAGE}_COMPILER_ID AND CMAKE_${LANGUAGE}_COMPILER_ID MATCHES "MSVC" )

    set( PZY_COMPILER "mscv" )
    set( PZY_COMPILER_VERSION ${CMAKE_${LANGUAGE}_COMPILER_VERSION} )

    if( MSVC_${LANGUAGE}_ARCHITECTURE_ID STREQUAL "X86" )
        set( PZY_ARCH 32 )
        set( PZY_COMPILER_ARCH "x86" )
    elseif( MSVC_${LANGUAGE}_ARCHITECTURE_ID STREQUAL "x64" )
        set( PZY_ARCH 64 )
        set( PZY_COMPILER_ARCH "x64" )
    endif()

    if( MSVC_VERSION EQUAL 1400 )
        set( PZY_COMPILER_NAME "vs2005" )
    elseif( MSVC_VERSION EQUAL 1500 )
        set( PZY_COMPILER_NAME "vs2008" )
    elseif( MSVC_VERSION EQUAL 1600 )
        set( PZY_COMPILER_NAME "vs2010" )
    elseif( MSVC_VERSION EQUAL 1700 )
        set( PZY_COMPILER_NAME "vs2012" )
    elseif( MSVC_VERSION EQUAL 1800 )
        set( PZY_COMPILER_NAME "vs2013" )
    elseif( MSVC_VERSION EQUAL 1900 )
        set( PZY_COMPILER_NAME "vs2015" )
    endif()

else()

    if( CMAKE_SIZEOF_VOID_P EQUAL 4 )
        set( PZY_ARCH 32 )
    elseif( CMAKE_SIZEOF_VOID_P EQUAL 8 )
        set( PZY_ARCH 64 )
    endif()

endif()

message( STATUS "${PZY_COMPILER_NAME}-${PZY_COMPILER}-${PZY_COMPILER_ARCH}-${PZY_COMPILER_VERSION}" )

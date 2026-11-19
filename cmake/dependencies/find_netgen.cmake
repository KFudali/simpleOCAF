find_package(Netgen REQUIRED)
if (NETGEN_VERSION)
    MESSAGE(STATUS "Netgen found version: ${NETGEN_VERSION_MAJOR}.${NETGEN_VERSION_MINOR}.${NETGEN_VERSION_PATCH}")
    set(Netgen_LIBRARIES nglib ngcore)
endif()

# Netgen built with GCC exports GCC-only flags (e.g. -fabi-version=17) on ngcore.
# Clang uses the same Itanium ABI / libstdc++, so these can be dropped safely.
if (CMAKE_CXX_COMPILER_ID MATCHES "Clang" AND TARGET ngcore)
    get_target_property(_ngcore_opts ngcore INTERFACE_COMPILE_OPTIONS)
    if (_ngcore_opts)
        list(FILTER _ngcore_opts EXCLUDE REGEX "^-fabi-version=")
        set_target_properties(ngcore PROPERTIES INTERFACE_COMPILE_OPTIONS "${_ngcore_opts}")
    endif()
    unset(_ngcore_opts)
endif()

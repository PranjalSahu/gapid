set(SOURCES
    GlslangToSpv.cpp
    InReadableOrder.cpp
    Logger.cpp
    SpvBuilder.cpp
    doc.cpp
    disassemble.cpp)

set(SPVREMAP_SOURCES
    SPVRemapper.cpp
    doc.cpp)

set(HEADERS
    spirv.hpp
    GLSL.std.450.h
    GlslangToSpv.h
    Logger.h
    SpvBuilder.h
    spvIR.h
    doc.h
    disassemble.h)

set(SPVREMAP_HEADERS
    SPVRemapper.h
    doc.h)

if(ENABLE_AMD_EXTENSIONS)
    set(HEADERS
        GLSL.ext.AMD.h)
endif(ENABLE_AMD_EXTENSIONS)

add_library(SPIRV STATIC ${SOURCES} ${HEADERS})
set_property(TARGET SPIRV PROPERTY FOLDER glslang)

add_library(SPVRemapper STATIC ${SPVREMAP_SOURCES} ${SPVREMAP_HEADERS})
set_property(TARGET SPVRemapper PROPERTY FOLDER glslang)

if(WIN32)
    source_group("Source" FILES ${SOURCES} ${HEADERS})
    source_group("Source" FILES ${SPVREMAP_SOURCES} ${SPVREMAP_HEADERS})
endif(WIN32)

install(TARGETS SPIRV SPVRemapper
        ARCHIVE DESTINATION lib)

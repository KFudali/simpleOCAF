add_subdirectory(Fixtures)

add_subdirectory(GeometryCore)
add_subdirectory(MeshCore)

add_executable(itAll
    RunTest.cpp
)

target_link_libraries(itAll PRIVATE
    itGeometryCore
    itMeshCore
)

include(GoogleTest)
gtest_discover_tests(itAll)
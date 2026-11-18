# Test files are named <Unit>Test.cpp, mirroring the source file they cover.
# neotest-gtest does not detect this pattern by default; override its
# is_test_file to match a stem ending in "Test".
function(collect_unit_test_sources base_dir out_var)
    file(GLOB_RECURSE collected_files CONFIGURE_DEPENDS
        "${base_dir}/*Test.cpp"
    )
    set(${out_var} ${collected_files} PARENT_SCOPE)
endfunction()

function(collect_integration_test_sources base_dir out_var)
    file(GLOB_RECURSE collected_files CONFIGURE_DEPENDS
        "${base_dir}/*Test.cpp"
    )
    set(${out_var} ${collected_files} PARENT_SCOPE)
endfunction()
function(collect_test_sources base_dir out_var)
    file(GLOB_RECURSE collected_files CONFIGURE_DEPENDS
        "${base_dir}/*Test.cpp"
    )
    set(${out_var} ${collected_files} PARENT_SCOPE)
endfunction()

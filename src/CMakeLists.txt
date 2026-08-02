if (${HELLO_KITTY})
    # add_executable(main main.cpp)

    add_executable(jsonDemo jsonDemo.cpp)
    target_include_directories(jsonDemo
        PUBLIC ../dependence/json/include
    )
endif()

if (${LEETCODE})
    add_subdirectory(leetcode)
endif()

# FIXME

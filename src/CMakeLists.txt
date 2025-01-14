if (${HELLO_KITTY})
    add_executable(main main.cpp)
endif()

if (${LEETCODE})
    add_subdirectory(leetcode)
endif()

if (${HELLO_KITTY})
    add_executable(main main.c)
endif()

if (${LEETCODE})
    add_subdirectory(leetcode)
endif()

project(TEST CXX)

set(CMAKE_CXX_STANDARD 23)

if (${LEETCODE})
    add_executable(
        test
        leetcode_ut.cpp
    )
    target_include_directories(
        test
        PUBLIC ../dependence/GoogleTest/include
        PUBLIC ../include
    )
    target_link_directories(
        test
        PUBLIC ../dependence/GoogleTest/lib
    )
    target_link_libraries(
        test
        leetcode
        gtest
        gtest_main
    )
endif()

# FIXME include(GoogleTest)

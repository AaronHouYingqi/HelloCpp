project(TEST CXX)

set(CMAKE_CXX_STANDARD 23)

if (${LEETCODE})
    add_executable(
        leetcode_test
        leetcode_ut.cpp
    )
    target_include_directories(
        leetcode_test
        PUBLIC ../dependence/GoogleTest/include
        PUBLIC ../include
    )
    target_link_directories(
        leetcode_test
        PUBLIC ../dependence/GoogleTest/lib
    )
    target_link_libraries(
        leetcode_test
        leetcode
        gtest
        gtest_main
    )

    install(TARGETS leetcode_test
        RUNTIME DESTINATION bin
        # CONFIGURATIONS Debug  # 可选：指定构建类型
    )



endif()

# FIXME include(GoogleTest)

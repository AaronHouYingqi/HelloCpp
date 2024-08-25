cmake_minimum_required(VERSION 3.22)
project(HelloCpp C)

set(CMAKE_C_STANDARD 23)

# Boolean OFF is the default value.
option(HELLO_KITTY "HELLO_KITTY")
option(LEETCODE "LEETCODE")

add_subdirectory(src)
add_subdirectory(test)

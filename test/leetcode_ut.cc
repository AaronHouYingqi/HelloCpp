/*
 * 
 */

#include "gtest/gtest.h"
// #include "gmock/gmock.h"

extern "C" {
#include "solution.h"
}

// TODO GoogleTest class

TEST(leetcode, case_0)
{
    int ret = foo();
    EXPECT_EQ(0, ret);
}

/*
 * 
 */

 // TODO #include <gmock/gmock.h>
#include <gtest/gtest.h>  // FIXME installed?
#include <unordered_set>

#include "solution.h"

TEST(Demo, UniqueSolution)
{
    int ret = foo();
    EXPECT_EQ(ret, 0);
}

TEST(Demo, MultipleSolutions) {
    int ret = foo();
    unordered_set<int> ret_set = {0, 1};
    EXPECT_TRUE(ret_set.contains(ret));
}

class LeetCodeTest : public testing::Test {
    protected:
    LeetCodeTest() { }
    ~LeetCodeTest() override { }
    void SetUp() override { }
    void TearDown() override { }
    Solution solution;
};

TEST_F(LeetCodeTest, Testcase1) {
    int ret = foo();
    EXPECT_EQ(ret, 0);
}

TEST_F(LeetCodeTest, Testcase2) {
    int ret = foo();
    EXPECT_EQ(ret, 0);
}

TEST_F(LeetCodeTest, Testcase3) {
    int ret = foo();
    EXPECT_EQ(ret, 0);
}

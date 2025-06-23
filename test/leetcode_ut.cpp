/**
 * 
 */

#if false  // demo
#include <unordered_set>
#endif  // demo

#include "gtest/gtest.h"

#include "solution.h"

using namespace std;

#if false  // demo
int foo() {
    return 0;
}

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
#endif  // demo

class LeetCodeTest : public testing::Test {
    protected:
    LeetCodeTest() { }
    ~LeetCodeTest() override { }
    void SetUp() override { }
    void TearDown() override { }
    Solution solution;
};

TEST_F(LeetCodeTest, Testcase1) {
    vector<int> v;
    int ret = solution.foo(v);
    EXPECT_EQ(ret, 0);
}

TEST_F(LeetCodeTest, Testcase2) {
    vector<int> v;
    int ret = solution.foo(v);
    EXPECT_EQ(ret, 0);
}

TEST_F(LeetCodeTest, Testcase3) {
    vector<int> v;
    int ret = solution.foo(v);
    EXPECT_EQ(ret, 0);
}

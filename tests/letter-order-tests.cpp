/* Must include the test harness in every test file. */
#include "CppUTest/TestHarness.h"

extern "C" {
    #include "letter-order.h" 
}

/* Test files > Test groups > Tests */
TEST_GROUP(Happy_Path_Tests) {
    /* Test variables can be scoped to the file, group, test */
    const char* out_of_order_str = "ababab";

    void setup() {
        /* Setup code to run before each TEST */
    }

    void teardown() {
        /* Teardown code to run after each TEST */
    }
};

TEST(Happy_Path_Tests, in_order) {
    const char* in_order_str = "aaabbbccc";

    int ans = letters_in_order(in_order_str);

    CHECK_EQUAL(1, ans);
}

TEST(Happy_Path_Tests, out_of_order) {
    CHECK_EQUAL(0, letters_in_order(out_of_order_str));
}



TEST_GROUP(Edge_Cases) {
    void setup() {
        printf("-----Running a test-----\n");
    }

    void teardown() {
        printf("-----Finished a test-----\n");
    }
};

TEST(Edge_Cases, one_letter) {
    CHECK_EQUAL(1, letters_in_order("b"));
}

TEST(Edge_Cases, no_letters) {
    CHECK_EQUAL(1, letters_in_order(""));
}

TEST(Edge_Cases, null) {
    CHECK_EQUAL(1, letters_in_order(NULL));
}
# Generate some paths
MAKEFILE_DIR=$(dir $(realpath $(firstword $(MAKEFILE_LIST))))
PROJECT_DIR=$(realpath $(MAKEFILE_DIR)..)
TEST_DIR=$(PROJECT_DIR)/tests


# CPPUTEST_HOME=$(TEST_DIR)/cpputest
# I set this globally

# project source files path
SRC_DIRS=$(PROJECT_DIR)/src

# project header files path
INCLUDE_DIRS=$(PROJECT_DIR)/include

# add this to avoid problems when including cpputest headers on test files
INCLUDE_DIRS+=$(CPPUTEST_HOME)/include

## specify where the test code is located
TEST_SRC_DIRS=$(TEST_DIR)

## what to call the test binary
TEST_TARGET=test_runner

include $(CPPUTEST_HOME)/build/MakefileWorker.mk

.PHONY: check_paths
check_paths:
	@echo "\nRepository dir\t" $(REPOSITORY_DIR)
	@echo "\nTest dir\t" $(TEST_DIR)
	@echo "\nMakefile dir\t" $(MAKEFILE_DIR)
	@echo "\nProject dir\t" $(PROJECT_DIR)
	@echo "\nSrc dir  \t" $(SRC_DIR)
	@echo "\nSrc dirs  \t" $(SRC_DIRS)
	@echo "\nInclude dirs  \t" $(INCLUDE_DIRS)
	@echo "\nCpputest home  \t" $(CPPUTEST_HOME)

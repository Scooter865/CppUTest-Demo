SRC_DIR = ./src
INC_DIR = ./src/include
TEST_DIR = ./tests
BUILD_DIR = ./build
NAME = app.elf

CC ?= gcc
CFLAGS += -I$(INC_DIR)
CFLAGS += -Wall

SOURCES += $(wildcard $(SRC_DIR)/*.c)
OBJECTS = $(patsubst $(SRC_DIR)/%.c, $(BUILD_DIR)/%.o, $(SOURCES))

# Default rule: build application
.PHONY: all
all: $(NAME)

# Build the target application
.PHONY: $(NAME)
$(NAME): $(OBJECTS)
	$(CC) $^ -o $@

# Build components
$(OBJECTS) : $(BUILD_DIR)/%.o : $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

# Remove compiled object files
.PHONY: clean
clean:
	rm -f $(OBJECTS)
	rm -f $(NAME)


# Run tests
.PHONY: test
test:
	make -C $(TEST_DIR)
	
# Clean tests
.PHONY: test_clean
test_clean:
	make -C $(TEST_DIR) clean
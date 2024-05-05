SRC_DIR = ./src
INC_DIR = ./include
TEST_DIR = ./tests
BUILD_DIR = ./build
NAME = app.elf

CC ?= gcc
CFLAGS += -I$(INC_DIR)
CFLAGS += -Wall

MAIN_SRC += ./main.c
SOURCES += $(wildcard $(SRC_DIR)/*.c)
OBJECTS = $(patsubst $(SRC_DIR)/%.c, $(BUILD_DIR)/%.o, $(SOURCES))

# Default rule: build application
.PHONY: all
all: $(NAME)

# Build the target application
.PHONY: $(NAME)
$(NAME): $(BUILD_DIR)/main.o $(OBJECTS)
	$(CC) $^ -o $@

$(BUILD_DIR)/main.o: $(MAIN_SRC)
	mkdir $(BUILD_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Build components
$(OBJECTS) : $(BUILD_DIR)/%.o : $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

# Remove compiled object files
.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)
	rm -f $(NAME)


# Run tests
.PHONY: tests
tests:
	make -C $(TEST_DIR)
	
# Clean tests
.PHONY: tests_clean
tests_clean:
	make -C $(TEST_DIR) clean
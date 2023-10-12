# see https://stackoverflow.com/a/3220288 for Makefile symbol explanations

CXX = g++
CXXFLAGS = -Wall -std=c++20 -MMD
SRC_DIR = src
BUILD_DIR = build
TARGET = main

OBJS = $(patsubst $(SRC_DIR)/%.cpp,$(BUILD_DIR)/%.o,$(SRCS))
SRCS = $(wildcard $(SRC_DIR)/*.cpp)

all: $(TARGET)

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp # build object files
	@mkdir -p $(@D)
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(TARGET): $(OBJS) # build target
	$(CXX) $(CXXFLAGS) -o $@ $^

-include $(wildcard $(BUILD_DIR)/*.d) # include generated rules

.PHONY: clean
clean:
	rm -rf $(BUILD_DIR) $(TARGET)
# Shell (Makefile)
# A simple shell made in C++
# Github:https://www.github.com/awesomelewis2007/shell
# Main makefile

CC = g++
CFLAGS = -std=c++17 -O2 -I include

SRC = $(wildcard src/*.cpp) $(wildcard src/modules/*.cpp) $(wildcard src/commands/*.cpp)
OBJ = $(SRC:.cpp=.o)

BIN = bin
OUTPUT = shell

all: init shell

shell: $(OBJ)
	@echo "LD $@"
	$(CC) $(CFLAGS) -o $(BIN)/$(OUTPUT) $(OBJ)

%.o: %.cpp
	@echo "CC $@"
	$(CC) $(CFLAGS) -o $@ -c $<

init:
	@echo "MKDIR" $(BIN)
	@mkdir -p $(BIN)

clean:
	@echo "RM" $(OBJ) shell
	@rm -f $(OBJ) shell

clean_all: clean
	@echo "RM" $(BIN)
	@rm -f $(OBJ) shell
	@rm -rf $(BIN)

help:
	@echo "Usage: make [target]"
	@echo "Targets:"
	@echo "  all:    Build the shell"
	@echo "  clean:  Remove all build files"
	@echo "  help:   Display this help message"

.SILENT:

.PHONY: all clean

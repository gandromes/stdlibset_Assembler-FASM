NAME = main
LANG = asm
SUB_LANG = c
CC = fasm
SUB_CC = gcc
LD_FLAGS = -o
C_FLAGS = -no-pie
LIB_DIR = c_lib
LIB_SUB_DIR = asm_lib
LIBS = $(wildcard $(LIB_DIR)/*.$(LANG))
LIBS_OBJ = $(patsubst %.$(LANG), %.o, $(LIBS))
LIBS_SUB = $(wildcard $(LIB_DIR)/$(LIB_SUB_DIR)/*.$(LANG))
LIBS_SUB_OBJ = $(patsubst %.$(LANG), %.o, $(LIBS_SUB))

.PHONY: default build run
default: build run
$(LIB_DIR)/%.o: $(LIB_DIR)/%.$(LANG)
	$(CC) $<
$(LIB_DIR)/$(LIB_SUB_DIR)/%.o: $(LIB_DIR)/$(LIB_SUB_DIR)/%.$(LANG)
	$(CC) $<
build: $(NAME).$(SUB_LANG) $(LIBS_OBJ) $(LIBS_SUB_OBJ)
	@$(SUB_CC) $(C_FLAGS) $(NAME).$(SUB_LANG) \
	$(LIBS_OBJ) $(LIBS_SUB_OBJ) $(LD_FLAGS) $(NAME)
run: $(NAME)
	./$<

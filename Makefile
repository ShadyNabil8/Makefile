########################################################################
############################### Makefile ###############################
########################################################################

# Compiler settings - Can be customized.
CC = gcc
CXXFLAGS = -std=c11 -Wall
LDFLAGS = 

# Makefile settings - Can be customized.
APPNAME = myapp
EXT = .o
SRCDIR = .
OBJDIR = .

############## Do not change anything from here downwards! #############
SRC = $(wildcard $(SRCDIR)/*$(EXT))
# 
OBJ = *.o
DEP = *.d
# UNIX-based OS variables & settings
RM = rm
DELOBJ = $(OBJ)

########################################################################
####################### Targets beginning here #########################
########################################################################
include Makeconfig
vfiles = $(files:.c=.o)
################### Build rules for Unix-based OS ###################
libinit:
	@$(MAKE) -C $(LIB_SRC) $@

libclean: 
	@$(MAKE) -C $(LIB_SRC) $@

build: clean libinit $(vfiles)
	$(CC) $(vfiles) -$(libname) -L $(LIB_SRC) -o $(APPNAME)
################### Cleaning rules for Unix-based OS ###################
# Cleans complete project
.PHONY: clean
clean: libclean
ifneq ("$(wildcard $(DELOBJ))","")
	$(RM) $(DELOBJ)
endif
ifneq ("$(wildcard $(APPNAME))","")
	$(RM) $(APPNAME)
endif




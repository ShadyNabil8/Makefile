# Make file 
### Why we need to use it?
* Automate process.
* Fully control on the output
* Organize the compilation process
* Can run external tools and scripts

## Functions

```
# Function defination
define print
	@echo "Function name -> $0"
	@echo "Target name -> $@"
	@echo "print function started -> $1"
	@echo "print function is executing-> $2"
	@echo "print function ended-> $3"
endef
```
* We must write the function name after the call word and this name is passed as a paramater $0. i.e., if you wht to use the name of the function in the functionitself just use the $0.
* Using $@ in the function prints the caller target which in this case is (function1).
```
function1:
	$(call print, ok, inprogress, done)
```

## Loops
```
arr = shady nabil mohamed
loop1:
	@for i in $(arr); do\
		echo $$i; \
	done
```

```
dirs := a b c d
syn  := $(foreach dir,$(dirs),"\nprinted: $(dir)")
loop2:
	@echo $(syn)
```

## Conditions
```
name = shady
ifeq '$(name)' 'shady'
condition1:
	@echo "Condition1 is true"
endif
```
```
bool = true
condition2:
ifdef bool
	@echo "Condition2 is true"
else
	@echo "Condition2 is false"
endif
```
```
filename = makefile
condition3:
ifeq '$(filename)' 'make'
	@echo "File name is make"
else ifeq '$(filename)' 'file'
	@echo "File name is file"
else
	@echo "File name is makefile"
endif
```

## automatic variables
```
helper1:
	@echo "This is helper1"
helper2:
	@echo "This is helper2"

mytarget1: helper1 helper2
	@echo "Traget name is $@"
	@echo "First prerequisute is $<"
	@echo "All prerequisutes are $^"
```

## built-in Rules
Even if we donot have the main.o/file1.o object files, the built in rules will take the .c file and generate the .o files.
```
mybuild: main.o file1.o
	$(CC) $^ -o $(APPNAME)
```
After running this target we get,
```
gcc -std=c11 -Wall -o main.o -c main.c
gcc -std=c11 -Wall -o file1.o -c file1.c
gcc main.o file1.o -o myapp
```


.PHONY: all

CFLAGS := -fprofile-arcs -ftest-coverage
LDFLAGS := -lgcov 

SRCS := $(wildcard *.c)
OBJS := $(patsubst %.c,%.o,$(SRCS))
TEST_SRCS := $(wildcard test/*.c)
TEST_OBJS := $(patsubst %.c,%.o,$(TEST_SRCS))


%.o: %.c
	gcc -I./ -g -c -o $@ $< $(CFLAGS)

all: $(OBJS) $(TEST_OBJS)
	gcc -o test_all $^ $(LDFLAGS)

clean:
	rm *.o test/*.o -f
	rm test_all -f
	rm *.gc?? -f
	rm test/*.gc?? -f

.PHONY: all

SRCS := $(wildcard *.c)
OBJS := $(patsubst %.c,%.o,$(SRCS))
TEST_SRCS := $(wildcard test/*.c)
TEST_OBJS := $(patsubst %.c,%.o,$(TEST_SRCS))


%.o: %.c
	gcc -I./ -g -c -o $@ $<

all: $(OBJS) $(TEST_OBJS)
	gcc -o test_all $^

clean:
	rm *.o test/*.o -f
	rm test_all -f

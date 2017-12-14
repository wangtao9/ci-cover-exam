.PHONY: all

CFLAGS := -fprofile-arcs -ftest-coverage
LDFLAGS := -lgcov 

SRCS := $(wildcard *.c)
OBJS := $(patsubst %.c,%.o,$(SRCS))
TEST_SRCS := $(wildcard test/*.c)
TEST_OBJS := $(patsubst %.c,%.o,$(TEST_SRCS))


%.o: %.c
	gcc -I./ -g -c -o $@ $< $(CFLAGS)

all: test

test: $(OBJS) $(TEST_OBJS)
	gcc -o test_all $^ $(LDFLAGS)

gcov: # cover local
	make test
	./test_all
	gcov complicated.c
	lcov -c -o output.info -d . --no-recursion
	genhtml output.info -o /data/disk3/fma/wt/gcov_report/ci-cover-exam


clean:
	rm *.o test/*.o -f
	rm test_all -f
	rm *.gc?? -f
	rm test/*.gc?? -f
	rm *.info -f

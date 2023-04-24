CC := g++
CFLAGS := -Wall -g -I./include
SRCS := $(wildcard *.cc)
OBJS := $(patsubst %.cc, %.o, $(SRCS))
TARGET := helloworld

$(TARGET): $(OBJS)
	$(CC) -o $@ $^

%.o: %.cc
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS) $(TARGET)

CFLAGS = -Wall -fno-stack-protector -Wno-unused-function

.PHONY: all clean

all: piece_of_pie

piece_of_pie: piece_of_pie.o

piece_of_pie.o: piece_of_pie.c

docker:
	docker run --rm -v $(shell pwd):/usr/src/app -w /usr/src/app gcc:14.2 make

clean:
	-rm -f *~ *.o
	-rm -f piece_of_pie

public: piece_of_pie
	cp piece_of_pie ../public/

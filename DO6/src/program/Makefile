all: main
	
main:
	gcc main.c -o DO

test:
	chmod +x test.sh
	./test.sh || exit 1

clean:
	rm -rf *.o DO

CC = gcc
CFLAGS = -Wall -Wextra -Werror
FCGI = $(shell brew --prefix fcgi)

SERVER = fastcgi_server

.PHONY: all run stop clean

all:
	$(CC) $(CFLAGS) server.c -o $(SERVER) \
	-I$(FCGI)/include -L$(FCGI)/lib -lfcgi

run: all
	spawn-fcgi -p 8080 ./$(SERVER)
	nginx -c $(PWD)/nginx.conf

stop:
	-pkill nginx
	-pkill spawn-fcgi
	-pkill $(SERVER)

clean:
	rm -f $(SERVER)

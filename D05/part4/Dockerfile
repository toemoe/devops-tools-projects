FROM ubuntu:22.04

RUN apt-get update && apt-get install -y nginx gcc spawn-fcgi libfcgi-dev \
    && rm -rf /var/lib/apt/lists/*

COPY server.c /server.c
COPY start.sh /start.sh
COPY nginx/nginx.conf /etc/nginx/nginx.conf

RUN gcc /server.c -o /webserver -lfcgi && chmod +x /start.sh

EXPOSE 8080 81

ENTRYPOINT ["/start.sh"]

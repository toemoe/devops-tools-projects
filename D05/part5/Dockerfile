FROM ubuntu:22.04

RUN apt-get update && apt-get install -y nginx gcc spawn-fcgi libfcgi-dev curl \
    && rm -rf /var/lib/apt/lists/*

COPY server.c /server.c
COPY start.sh /start.sh
COPY nginx/nginx.conf /etc/nginx/nginx.conf

RUN gcc /server.c -o /webserver -lfcgi && chmod +x /start.sh

RUN useradd -m -u 1000 str \
    && chown -R str:str /webserver /start.sh \
    && chown -R str:str /var/log/nginx \
    && chown -R str:str /var/lib/nginx \
    && touch /run/nginx.pid \
    && chown -R str:str /run/nginx.pid

USER str

EXPOSE 8080 81

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:81/ || exit 1

ENTRYPOINT ["/start.sh"]
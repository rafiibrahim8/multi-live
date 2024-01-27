FROM alpine:3.19.1
RUN apk add --no-cache nginx nginx-mod-rtmp bash supervisor stunnel
RUN mkdir /etc/nginx/rtmp.conf.d
RUN echo 'include /etc/nginx/rtmp.conf.d/*.conf;' | tee -a /etc/nginx/nginx.conf

COPY app /app
WORKDIR /app

ENTRYPOINT ["/usr/bin/supervisord", "-c", "/app/supervisord.conf"]

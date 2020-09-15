FROM alpine:latest

ADD repositories etc/apk

RUN apk update && apk add openssl telegraf openssh nginx \
&&      rm -rf /var/cache/apk/*

RUN mkdir -p var/run/nginx/ && mkdir /html
RUN rm /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /html/index.html
COPY script.sh ./tmp/script.sh
COPY livenessprobe.sh /tmp/
ADD   telegraf.conf /etc/

RUN adduser -D "admin" && echo "admin:admin" | chpasswd && ssh-keygen -A

RUN chmod 777 tmp/script.sh

RUN mkdir /etc/nginx/ssl && chmod 700 /etc/nginx/ssl
RUN openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -subj '/C=FR/ST=75/L=Paris/O=42-Paris/CN=timlecou' -keyout /etc/ssl/certs/privatekey.key -out /etc/ssl/certs/certificate.crt

RUN chmod 777 /html/index.html

EXPOSE 80 443 22

ENTRYPOINT sh tmp/script.sh

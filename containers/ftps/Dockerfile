FROM alpine:latest

RUN apk update
RUN apk add openssl vsftpd
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

RUN openssl req -newkey rsa:2048 -x509 -days 365 -sha256 -nodes -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=timlecou/CN=localhost"

RUN mkdir -p /home/admin

COPY ./setup.sh /tmp
COPY ./vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY ./telegraf.conf /etc/telegraf.conf
COPY ./test /home/admin

RUN adduser -D "admin" && echo "admin:admin" | chpasswd

RUN chmod 777 /tmp/setup.sh

EXPOSE 21 20 30021 30020

CMD sh /tmp/setup.sh

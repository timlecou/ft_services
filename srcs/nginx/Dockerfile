FROM alpine

RUN apk update && apk add nginx openssl openssh
RUN mkdir -p /run/nginx
COPY nginx.conf /etc/nginx/conf.d/nginx.conf
COPY index.html /var/www/
RUN chmod -R 755 /etc/nginx
RUN mkdir /etc/nginx/ssl && chmod 700 /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=US/ST=CA/L=Fremont/O=42/CN=timlecou' -keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.crt
EXPOSE 80 443
ENTRYPOINT nginx -g "daemon off;"

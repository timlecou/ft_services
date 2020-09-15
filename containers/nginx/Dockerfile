FROM alpine:latest
ADD repositories etc/apk
RUN apk update \
&& apk add nginx \
&& apk add openssh \
&& apk add openssl \
&& apk add telegraf \
&& openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt \
&& mkdir -p /run/nginx \
&& touch /file
RUN adduser -D test \
&& echo "test:test" | chpasswd \
&& ssh-keygen -A
ADD ./default2.conf /etc/nginx/conf.d/default.conf
ADD ./index.html /var/www/localhost/htdocs/
ADD ./telegraf.conf /etc/
EXPOSE 22 80 443
ADD ./script.sh /
ADD ./liveness.sh /
#ENTRYPOINT ["nginx", "-g", "daemon off;"]
#CMD sh
CMD sh script.sh

FROM	alpine:latest

ADD repositories etc/apk

RUN		apk update \
&&		apk add --no-cache	php php7-fpm \
							php7-opcache php7-zlib \
							php7-mbstring php7-session \
							php7-common php7-iconv \
							php7-json php7-gd \
							php7-curl php7-xml \
							php7-mysqli php7-imap \
							php7-cgi fcgi \
							php7-pdo php7-pdo_mysql \
							php7-soap php7-xmlrpc \
							php7-posix php7-mcrypt \
							php7-gettext php7-ldap \
							php7-ctype php7-dom \
							telegraf \
&&		wget https://wordpress.org/latest.tar.gz \
&&		mkdir /web \
&&		tar xvf latest.tar.gz \
&&		mv /wordpress /web/ \
&&		rm latest.tar.gz

COPY	./wp-config.php /web/wordpress/
ADD     telegraf.conf /etc/

RUN		chmod -R 755 /web/wordpress

COPY	./run-wordpress /root/

EXPOSE	5050

CMD		sh /root/run-wordpress
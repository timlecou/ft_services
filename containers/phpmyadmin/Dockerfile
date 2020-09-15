FROM	alpine:latest

ADD repositories etc/apk

RUN		apk update
RUN		apk add --no-cache	php7            \
							php7-fpm        \
							php7-opcache    \
							php7-gd         \
							php7-mysqli     \
							php7-zlib       \
							php7-curl       \
							php7-mbstring   \
							php7-json       \
							php7-session	\
							telegraf        \
&&		wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-english.tar.gz \
&&		tar xvf phpMyAdmin-latest-english.tar.gz \
&&		mkdir /web \
&&		mv /phpMyAdmin-5.0.2-english /web/phpmyadmin \
&&		rm phpMyAdmin-latest-english.tar.gz

COPY	./config.inc.php /web/phpmyadmin/
COPY	./run-phpmyadmin /root/run-phpmyadmin
ADD     ./telegraf.conf /etc/
RUN		chmod -R 755 /web/phpmyadmin

EXPOSE	5000

CMD		sh /root/run-phpmyadmin
FROM	alpine:latest

ADD repositories etc/apk

RUN		apk update \
&&		apk add --no-cache	mariadb \
							mariadb-client \
							telegraf

COPY	./nohup-mysql.sh /root/
COPY	./run-mysql /root/
COPY	./db-launch.sql /root/
COPY	./db-fill.sql /root/
COPY	./my.cnf /etc/
ADD    ./telegraf.conf /etc/

RUN		chmod 777 /root/db-fill.sql

EXPOSE	3306

CMD		sh /root/run-mysql
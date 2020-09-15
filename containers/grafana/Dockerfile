FROM	alpine:latest

ADD repositories etc/apk

RUN		apk update \
&&		apk add --no-cache libc6-compat \
&&      apk add telegraf \
&&		wget https://dl.grafana.com/oss/release/grafana-7.0.6.linux-amd64.tar.gz \
&&		tar -xvf grafana-7.0.6.linux-amd64.tar.gz \
&&		mv grafana-7.0.6 grafana \
&&		rm grafana-7.0.6.linux-amd64.tar.gz

COPY	./srcs/default.yaml /grafana/conf/provisioning/datasources/
COPY	./srcs/dashboard.yaml /grafana/conf/provisioning/dashboards/
COPY	./srcs/nginx.json /grafana/conf/provisioning/dashboards/
COPY	./srcs/ftps.json /grafana/conf/provisioning/dashboards/
COPY	./srcs/mysql.json /grafana/conf/provisioning/dashboards/
COPY	./srcs/wordpress.json /grafana/conf/provisioning/dashboards/
COPY	./srcs/phpmyadmin.json /grafana/conf/provisioning/dashboards/
COPY	./srcs/influxdb.json /grafana/conf/provisioning/dashboards/
COPY	./srcs/grafana.json /grafana/conf/provisioning/dashboards/
COPY	./srcs/run-grafana /root/
ADD     ./telegraf.conf /etc/

RUN		chmod -R 777 /grafana

WORKDIR /grafana

EXPOSE	3000

CMD		sh /root/run-grafana

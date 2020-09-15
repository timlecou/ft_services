FROM alpine:latest

ADD repositories etc/apk

RUN apk update \
&& apk add influxdb \
&& apk add telegraf

ADD script.sh /
ADD telegraf.conf /etc/

EXPOSE 8086

CMD sh script.sh

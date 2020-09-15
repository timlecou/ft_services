export TELEGRAF_CONFIG_PATH=/etc/telegraf.conf
nginx -g 'daemon off;' & /usr/sbin/sshd -D & /usr/bin/telegraf
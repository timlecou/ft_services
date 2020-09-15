export TELEGRAF_CONFIG_PATH=/etc/telegraf.conf

/usr/sbin/sshd -D & nginx -g "daemon off;" & /usr/bin/telegraf
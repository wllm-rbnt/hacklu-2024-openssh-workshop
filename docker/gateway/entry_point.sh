#!/bin/bash -eu

echo '172.18.0.1      local_machine' >> /etc/hosts
echo '172.19.0.3      secret-intranet' >> /etc/hosts

ln -fs /usr/share/zoneinfo/${TZ} /etc/localtime

echo "root:${ROOT_PASSWORD}" | chpasswd
echo "user:${USER_PASSWORD}" | chpasswd

# telnetd
echo "telnet	stream	tcp	nowait	root	/usr/sbin/tcpd	/usr/sbin/telnetd" > /etc/inetd.d/telnetd.conf
echo "ALL: ALL" > /etc/hosts.allow

# sshd
echo "VisualHostKey yes" > /etc/ssh/ssh_config.d/VisualHostKey.conf
echo "PermitRootLogin yes" > /etc/ssh/sshd_config.d/PermitRootLogin.conf
#    sed -i 's/^\(UsePAM yes\)/# \1/' /etc/ssh/sshd_config; \

echo 'Hello world ! This is gateway listening on 127.0.0.1 port 80.' > /var/www/html/index.html

/usr/sbin/sshd -f /etc/ssh/sshd_config-error_host_key_type 
/usr/sbin/sshd -f /etc/ssh/sshd_config-error_key_exchange_method_type 
/usr/sbin/sshd -f /etc/ssh/sshd_config-error_matching_cipher 
/usr/sbin/sshd -f /etc/ssh/sshd_config-error_mutual_signature_algorithm

echo "IP address(es) of gateway: $(hostname -i)"
exec "$@"

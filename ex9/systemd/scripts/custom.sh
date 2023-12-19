sudo yum install epel-release -y && yum install spawn-fcgi php php-cli mod_fcgid httpd -y
sudo sh -c "mv /tmp/watchlog.log /var/log/watchlog.log -f"
sudo sh -c "mv /tmp/watchlog.timer /etc/systemd/system/watchlog.timer -f"
sudo sh -c "mv /tmp/watchlog.service /etc/systemd/system/watchlog.service -f"
sudo sh -c "mv /tmp/watchlog /etc/sysconfig/watchlog -f"
sudo sh -c "mv /tmp/watchlog.sh /opt/watchlog.sh -f"
sudo sh -c "mv /tmp/spawn-fcgi /etc/sysconfig/spawn-fcgi -f"
sudo sh -c "mv /tmp/spawn-fcgi.service /etc/systemd/system/spawn-fcgi.service -f"
sudo sh -c "mv /tmp/httpd.service /usr/lib/systemd/system/httpd.service -f"
sudo sh -c "mv /tmp/httpd-first /etc/sysconfig/httpd-first -f"
sudo sh -c "mv /tmp/httpd-second /etc/sysconfig/httpd-second -f"
sudo sh -c "mv /tmp/first.conf /etc/httpd/conf/first.conf -f"
sudo sh -c "mv /tmp/second.conf /etc/httpd/conf/second.conf -f"
sudo sh -c "chmod +x /opt/watchlog.sh"
sudo systemctl start watchlog.timer
sudo systemctl start spawn-fcgi.service
sudo sh -c "sudo reboot --reboot --force"
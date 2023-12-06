 sudo sh -c "echo '192.168.56.226:/srv/share/ /mnt nfs vers=3,proto=udp,noauto,x-systemd.automount 0 0' >> /etc/fstab"
 sudo systemctl daemon-reload 
 sudo systemctl restart remote-fs.target
 sudo touch /mnt/upload/client_file
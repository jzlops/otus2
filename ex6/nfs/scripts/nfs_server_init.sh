 sudo yum -y install nfs-utils
 sudo systemctl enable firewalld --now    
 sudo firewall-cmd --add-service="nfs3" --add-service="rpc-bind" --add-service="mountd" --permanent
 sudo firewall-cmd --reload
 sudo systemctl enable nfs --now
 sudo mkdir -p /srv/share/upload 
 sudo chown -R nfsnobody:nfsnobody /srv/share 
 sudo chmod 0777 /srv/share/upload 
 sudo sh -c "echo '/srv/share 192.168.56.227/32(rw,sync,root_squash)' >> /etc/exports"
 sudo exportfs -r 
 sudo touch /srv/share/upload/srv_file 

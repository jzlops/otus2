     sudo mkdir -p ~root/.ssh;
     sudo cp ~vagrant/.ssh/auth* ~root/.ssh
     sudo sh -c "echo 'PasswordAuthentication yes' > /etc/ssh/sshd_config"
     sudo sh -c "echo 'ChallengeResponseAuthentication no' >> /etc/ssh/sshd_config"
     sudo sh -c "echo 'X11Forwarding no' >> /etc/ssh/sshd_config"
     sudo sh -c "echo 'UsePAM yes' >> /etc/ssh/sshd_config"
     sudo sh -c "echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config"
     sudo sh -c "echo 'PubkeyAuthentication yes' >> /etc/ssh/sshd_config"
     sudo sh -c "echo 'AuthorizedKeysFile      .ssh/authorized_keys' >> /etc/ssh/sshd_config"
     sudo sh -c "echo 'PermitEmptyPasswords no '>> /etc/ssh/sshd_config"
     sudo sh -c "echo 'Subsystem	sftp	/usr/libexec/openssh/sftp-server '>> /etc/ssh/sshd_config"
     sudo setenforce 0
     sudo systemctl stop firewalld.service
#    sudo systemctl disable firewalld.service
     sudo yum -y install python3
#    sudo yum -y install mdadm smartmontools hdparm gdisk
     sudo yum -y install mc nano -y
#    sudo yum -y install  mdadm smartmontools hdparm gdisk
     sudo usermod -aG wheel vagrant
#    sudo yum -y install xfsdump
     sudo yum -y install nfs-utils
     sudo systemctl enable firewalld --now 
     sudo timedatectl set-timezone Europe/Moscow
     sudo systemctl restart sshd   

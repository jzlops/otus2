     sudo mkdir -p ~root/.ssh;
     sudo cp ~vagrant/.ssh/auth* ~root/.ssh
     sudo echo "PasswordAuthentication yes" > /etc/ssh/sshd_config
     sudo echo "ChallengeResponseAuthentication no" >> /etc/ssh/sshd_config
     sudo echo "X11Forwarding no" >> /etc/ssh/sshd_config
     sudo echo "UsePAM yes" >> /etc/ssh/sshd_config
     sudo echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
     sudo echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config
     sudo echo "AuthorizedKeysFile      .ssh/authorized_keys" >> /etc/ssh/sshd_config
     sudo echo "PermitEmptyPasswords no ">> /etc/ssh/sshd_config
     sudo echo "Subsystem	sftp	/usr/libexec/openssh/sftp-server ">> /etc/ssh/sshd_config
     sudo setenforce 0
     sudo systemctl stop firewalld.service
     sudo systemctl disable firewalld.service
     sudo yum install python3 -y
    #sudo yum install mdadm smartmontools hdparm gdisk -y
     sudo yum install mc nano -y
    #sudo yum install -y mdadm smartmontools hdparm gdisk
     sudo usermod -aG wheel vagrant
    #sudo yum install xfsdump -y
     sudo timedatectl set-timezone Europe/Moscow
     sudo systemctl restart sshd   
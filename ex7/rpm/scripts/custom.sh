sudo yum -y install redhat-lsb-core wget rpmdevtools rpm-build createrepo yum-utils gcc
sudo mkdir /packages
sudo wget https://nginx.org/packages/centos/8/SRPMS/nginx-1.20.2-1.el8.ngx.src.rpm -P /packages
sudo rpm -i /packages/nginx-1.*
sudo wget https://github.com/openssl/openssl/archive/refs/heads/OpenSSL_1_1_1-stable.zip -P /packages
sudo unzip /packages/OpenSSL_1_1_1-stable.zip -d /root
sudo yum-builddep -y /root/rpmbuild/SPECS/nginx.spec

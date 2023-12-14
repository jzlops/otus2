## В папке grub весь набор файлов и скриптов для выполнения ДЗ:
#### - Vagrantfile - инициализация и установка 2-х вирутальный машин (ubuntu и centos). Думал поделать тесты на 2=х ВМ, в итоге делал только на CentOS-8

#### Ниже приведены срины выполнения ДЗ

#### Вход в систему без пароля и монтирование / в режиме RW
![Alt text](./rpm/screens/rhel1.jpg)

#### Перебиваем волюм группу в файлах /etc/fstab, /etc/default/grub, /boot/grub2/grub.cfg
![Alt text](./rpm/screens/rhel2.jpg)
![Alt text](./rpm/screens/rhel3.jpg)
![Alt text](./rpm/screens/rhel4.jpg)

#### Пересобираем файл initrd image и далее перегружаемся
![Alt text](./rpm/screens/rhel5.jpg)


#### Создаем и добавляем свои модули для initrd
![Alt text](./rpm/screens/rhel6.jpg)
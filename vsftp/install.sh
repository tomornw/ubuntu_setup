#!/bin/bash
echo "welcome install and config vsftpd"
#
#vsftpd
#
echo "purge and auto remove vsftpd"
sudo apt-get purge --auto-remove vsftpd -y
echo "remove user itfiledata"
sudo deluser --remove-home itfiledata
sudo rm -rf /home/itfiledata
echo "install vsftpd"
sudo apt-get install vsftpd -y
sudo systemctl start vsftpd
sudo systemctl enable vsftpd
echo "create directory for ftp"
sudo adduser itfiledata
sudo chown -R itfiledata /home/itfiledata/
sudo chmod -R 777 /home/itfiledata/
sudo mkdir /home/itfiledata/ftp
echo "change ownership to itfiledata user"
sudo chown itfiledata:itfiledata /home/itfiledata/ftp
echo "edit config"
sudo cp /etc/vsftpd.conf /etc/vsftpd.conf.bak
sudo cp ./vsftpd.conf /etc/vsftpd.conf
sudo cp /etc/vsftpd.userlist /etc/vsftpd.userlist.bak
sudo cp ./vsftpd.userlist /etc/vsftpd.userlist
echo "restart service"
sudo systemctl restart vsftpd

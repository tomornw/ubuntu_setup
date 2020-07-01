#!/bin/bash
echo "welcome install and config vsftpd"
#
#vsftpd
#
echo "install vsftpd"
sudo apt-get install vsftpd -y
sudo systemctl start vsftpd
sudo systemctl enable vsftpd
echo "create directory for ftp"
sudo adduser itfiledata
sudo mkdir /home/itfiledata/ftp
sudo chown nobody:nogroup /home/itfiledata/ftp
sudo chmod a-w /home/itfiledata/ftp
echo "change ownership to itfiledata user"
sudo mkdir /home/itfiledata/ftp/test
sudo chown itfiledata:itfiledata /home/itfiledata/ftp/test
echo "edit config"
sudo cp /etc/vsftpd.conf /etc/vsftpd.conf.bak
sudo cp ./vsftpd.conf /etc/vsftpd.conf
sudo cp /etc/vsftpd.userlist /etc/vsftpd.userlist.bak
sudo cp ./vsftpd.userlist /etc/vsftpd.userlist
echo "restart service"
sudo systemctl restart vsftpd


#echo "purge and auto remove vsftpd"
#sudo apt-get purge --auto-remove vsftpd -y
#echo "remove user itfiledata"
#sudo deluser --remove-home itfiledata
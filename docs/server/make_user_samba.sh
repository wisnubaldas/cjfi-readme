#!/bin/bash

read -p "Nama depo dan username jadi satu: " usr
read -p "Password Nya: " pss

# add user ngga pake password
sudo adduser --no-create-home $usr
echo "user create \n"

# add password samba
# printf "$pss\$pss\n" | sudo smbpasswd -a -s $usr

sudo smbpasswd -a $usr

mkdir /home/cjfi/data_share/$usr
sudo chmod 775 /home/cjfi/data_share/$usr
sudo chown $usr:sambashare $usr

echo "direktory /home/cjfi/data_share/$usr telah dibuat"
echo "#----------------------------------------" | sudo tee -a /etc/samba/smb.conf
echo "# nama folder depo nya $usr ###### " | sudo tee -a /etc/samba/smb.conf
echo "[$usr]" | sudo tee -a /etc/samba/smb.conf
echo "   comment = Sharing data $usr" | sudo tee -a /etc/samba/smb.conf
echo "   path = /home/cjfi/data_share/$usr " | sudo tee -a /etc/samba/smb.conf
echo "   read only = no" | sudo tee -a /etc/samba/smb.conf
echo "   browsable = yes" | sudo tee -a /etc/samba/smb.conf
echo "   valid users = @$usr, @it" | sudo tee -a /etc/samba/smb.conf

sudo systemctl restart smbd.service
echo "suksess restart"
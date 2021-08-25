## Seting Samba 

To install Samba, we run:

``` bash
    sudo apt update
    sudo apt install samba
```

We can check if the installation was successful by running:

``` bash
    whereis samba
```

    samba: /usr/sbin/samba /usr/lib/samba /etc/samba /usr/share/samba /usr/share/man/man7/samba.7.gz /usr/share/man/man8/samba.8.gz

we need to create a directory for it to share:

```bash 
    mkdir /home/<username>/sambashare/
```

The configuration file for Samba is located at /etc/samba/smb.conf. To add the new directory as a share, we edit the file by running:
```bash
   sudo nano /etc/samba/smb.conf
```
At the bottom of the file, add the following lines:

``` conf
    [sambashare]
        comment = Samba on Ubuntu
        path = /home/username/sambashare
        read only = no
        browsable = yes
        valid users = it raj joe
```

```bash
   sudo service smbd restart
```
Update the firewall rules to allow Samba traffic:
```bash
   sudo ufw allow samba
```
NAS untuk backup data master dari depo-depo.

- IP Lokal: ``192.168.10.11``;
- IP Public: ``202.51.98.142``;

| User        | Password                             | 
| ----------- | ------------------------------------ |
| `it`           | `itcjfi`  |
| `pluit`        | `@depo#pluit01`  |
| `karawang`        | `@depo#karawang02`  |
| `serang`        | `@depo#serang03`  |
| `bogor`        | `@depo#bogor04`  |
| `bandung`        | `@depo#bandung05`  |
| `tasikmalaya`        | `@depo#tasikmalaya06`  |
| `cirebon`        | `@depo#cirebon07`  |
| `sukabumi`        | `@depo#sukabumi08`  |
| `purwokerto`        | `@depo#purwekerto09`  |
| `semarang`        | `@depo#semarang10`  |
| `solo`        | `@depo#solo11`  |
| `yogyakarta`        | `@depo#yogyakarta12`  |
| `surabaya`        | `@depo#surabaya13`  |
| `malang`        | `@depo#malang14`  |
| `kediri`        | `@depo#kediri15`  |
| `jember`        | `@depo#jember16`  |
| `bali`        | `@depo#bali17`  |
| `lampung`        | `@depo#lampung18`  |
| `bengkulu`        | `@depo#bengkulu19`  |
| `palembang`        | `@depo#palembang20`  |
| `padang`        | `@depo#padang21`  |
| `makasar`        | `@depo#makasar22`  |
| `palu`        | `@depo#palu23`  |
| `kendari`        | `@depo#kendari24`  |
| `banjarmasin`        | `@depo#banjarmasin25`  |
| `pontianak`        | `@depo#pontianak26`  |
| `samarinda`        | `@depo#samarinda27`  |
| `pekanbaru`        | `@depo#pekanbaru28`  |






!!! danger "Tips membuat user dan depo baru"
    Untuk membuat user baru login ke server menggunakan ssh pada console.
    `ssh cjfi@192.168.10.11` jalankan perintah `adduser <username>` kemudian
    buat password samba `smbpasswd -a <username>` setelah selesai restart sambanya
    `service smb restart` buat direktory folder di `/home/cjfi/data_share` ubah permission dengan user samba yang sudah dibuat. ``chown -R <username>:sambashare /home/cjfi/data_share``
    tambahkan kode config file samba `/etc/samba/smb.conf` tambah code berikut:
    ``` shell 
        # nama folder depo nya
        [pluit] 
                comment = Sharing data pluit
                path = /home/cjfi/data_share/pluit # direktori foldernya
                read only = no
                browsable = yes
                valid users = pluit,it # nama user yang bisa mengakses folder 
    ```
    [link artikel...](/tutorial/setting-samba/)

script bash nya untuk membuat folder sharing otomatis di server:
``` bash
    #!/bin/bash

    read -p "Nama depo dan username jadi satu: " usr
    read -p "Password Nya: " pss

    # add user ngga pake password
    sudo adduser --no-create-home $usr
    echo "user create \n"

    # add password samba
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
```

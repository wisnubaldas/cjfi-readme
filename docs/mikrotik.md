# Mikrotik

### Login Mikrotik
Login mikrotik menggunakan winbox, bisa di download di [link](https://mikrotik.com/download) buka winbox terlebih dahulu.
![Login form di winbox](/assets/img/winbox.png)

- [x] Klik tab `Neighbor` winbox akan mendeteksi perangkat mikrotik yang terhubung ke jaringan. 
setelah mendeteksi perangkat mikrotik yang terhubung ke jaringan, klik tab `Mac Adress` untuk mendapatkan mac address perangkat mikrotik tersebut.
- [x] Pada bagian `Mac Address` terdapat mac address perangkat mikrotik tersebut. lihat bagian 3.
- [x] Login menggunakan username dan password mikrotik, user ```admin``` pass ```itcjfi```

### Seting Firewall NAT ke Ip Publik 
Langkah pembuatan rule, masuk ke menu ```IP --> Firewall``` klik tab `NAT`, tambahkan rule baru dengan menekan tombol `add` atau tanda `+` berwarna merah. 
![Login form di winbox](/assets/img/nat.jpg)

Pada tab general NAT set beberapa input berikut

- [x] Pada bagian `chain` isi dengan `dstnat`
- [x] Pada bagian `dst address` isi dengan ip address publik
- [x] Pada bagian `dst port` isi dengan port ```80```
- [x] Pada bagian `protocol` isi dengan ```tcp```

di bagian tab action 

- [x] Pada bagian `action` isi dengan `dst-nat`
- [x] Pada bagian `to address` isi dengan ip adress lokal servernya 
- [x] Pada bagian `to port` isi dengan port ```80```

Sampai tahap ini server sudah dapat diakses menggunakan ip publik.

### Firewall Skema Router CJFI
![Login form di winbox](/assets/img/firewall.JPG)

Keterangan :

- [x] `0` action `masquerade` fungsi NAT untuk seluruh jaringan lokal CJFI
- [x] `1` action `dst-nat` fungsi NAT untuk domain [cjfi.co.id](http://cjfi.co.id/) ke publik ip profider menggunakan 
ip publik `202.51.98.140` nat destenation nya ke lokal ip `192.168.10.10`  
- [x] `2` action `dst-nat` fungsi nat untuk domain [sp-digital.cjfi.co.id](http://sp-digital.cjfi.co.id/#/login) ke publik ip profider `202.51.98.142`
nat destenation nya ke lokal ip `192.168.10.11`
- [x] `6` action `dst-nat` fungsi nat untuk storage NAS menggunakan protokol samba ke ip profider `202.51.98.141` nat destination nya ke lokal ip `192.168.10.72`


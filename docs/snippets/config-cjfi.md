!!! danger "Config"

    === "IP/Port"

        __Lokal IP__ ``192.168.10.10``, __Global IP__ ``202.51.98.140`` __domain__ ``cjfi.co.id``  
        __Port:__  
        ``80`` : Digunakan official untuk mengakses situs web cjfi.  
        ``8080`` : Digunakan untuk mengakses situs web aplikasi report.  
        ``8081`` : Digunakan untuk mengakses situs web dev cjfi.  
        ``8082`` : Digunakan untuk mengakses situs web dev acura.  
        ``8083`` : Digunakan untuk mengakses situs web admin cjfi.  
        ``8084`` : Digunakan untuk mengakses situs web dev harvest.  
        ``9090`` : Digunakan untuk mengakses situs web dokumentasi cjfi.  
        ``9191`` : Digunakan untuk mengakses situs web dev tes programer.  
        ``22021`` : Digunakan sebagai port forwarding ssh.  

    === "Database"

        __Database Host__ ``localhost``  
        __Database Port__ ``3306``  
        __Database User__ ``it``  
        __Database Password__ ``itcjfi``  
        __Database Name__ ``it_cjfi``  

    === "Cron Job"
        ``` bash
            # m h  dom mon dow   command
            # * * * * * cd /var/www/html/iderp2 && php artisan schedule:run >> /var/www/html/iderp2/schedule.log
            * * * * * cd /var/www/html/iderp7 && php artisan schedule:run >> /dev/null 2>&1
            # copy image dari iderp7 ke image web cjfi
            # 0 0 * * * rsync /var/www/html/iderp7/public/img/slider/* /var/www/html/cjfi_r1/images/home/slide/
            0 0 * * SAT rsync -aP /var/www/html/ cjfi@192.168.10.11:/var/www/html/ >> ~/backup_web.log 2>&1
            0 0 * * SAT sh /home/wisnu/backup/backup_cron.sh >> /home/wisnu/backup/backup.log 2>&1
        ```
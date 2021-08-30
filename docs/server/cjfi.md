#### Spesifikasi

{% include "spec-cjfi-prod.md" %}

### Configurasi

!!! danger "Config"

    === "IP/Port"

        __Lokal IP__ ``192.168.10.11``, __Global IP__ ``202.51.98.142`` __domain__ ``http://sp-digital.cjfi.co.id``  
        __Port:__  
        ``80`` : Digunakan official untuk mengakses situs web sp-digital.cjfi.co.id.  
        ``8000`` : Digunakan untuk mengakses API sp-digital.cjfi.co.id.  

    === "Database"

        - mysql:5.7
            User : ``root``
            Password : ``password``
            ip : ``192.168.10.11``
            port : ``3307``
        - postgresql:9.6
            user : ``postgres``
            password : ``cjfi2020``
            ip : ``192.168.10.11``
            port : ``5432``

    === "Cron Job"
        ``` bash
            # m h  dom mon dow   command
            #0 20 * * * java -jar ~/cron_iderp/cron_iderp.jar
            0 20 * * * sh ~/cron_crot.sh
            0 0 * * SUN sh /home/cjfi/backup/restore.sh >> /home/cjfi/backup/backup.log 2>&1

        ```
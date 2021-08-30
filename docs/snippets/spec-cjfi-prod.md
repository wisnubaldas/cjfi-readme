!!! info 
    Detail system dapat dilihat [dilink ini](http://192.168.10.11:61208/)
=== "System"
    ``` json
    {
        "os_name": "Linux",
        "hostname": "web-cjfi",
        "platform": "64bit",
        "linux_distro": "Ubuntu 20.04",
        "os_version": "5.4.0-70-generic",
        "hr_name": "Ubuntu 20.04 64bit"
    }
    ```
=== "IP"
    ``` json
    {
        "address": "192.168.10.11",
        "mask": "255.255.255.0",
        "mask_cidr": 24,
        "gateway": "192.168.10.253",
        "public_address": "202.51.98.138"
    }
    ```
=== "Docker"
    ``` json
        {
        "version": {
            "Platform": {
            "Name": "Docker Engine - Community"
            },
            "Components": [
            {
                "Name": "Engine",
                "Version": "20.10.8",
                "Details": {
                "ApiVersion": "1.41",
                "Arch": "amd64",
                "BuildTime": "2021-07-30T19:52:33.000000000+00:00",
                "Experimental": "false",
                "GitCommit": "75249d8",
                "GoVersion": "go1.16.6",
                "KernelVersion": "5.4.0-70-generic",
                "MinAPIVersion": "1.12",
                "Os": "linux"
                }
            },
            {
                "Name": "containerd",
                "Version": "1.4.9",
                "Details": {
                "GitCommit": "e25210fe30a0a703442421b0f60afac609f950a3"
                }
            },
            {
                "Name": "runc",
                "Version": "1.0.1",
                "Details": {
                "GitCommit": "v1.0.1-0-g4144b63"
                }
            },
            {
                "Name": "docker-init",
                "Version": "0.19.0",
                "Details": {
                "GitCommit": "de40ad0"
                }
            }
            ],
            "Version": "20.10.8",
            "ApiVersion": "1.41",
            "MinAPIVersion": "1.12",
            "GitCommit": "75249d8",
            "GoVersion": "go1.16.6",
            "Os": "linux",
            "Arch": "amd64",
            "KernelVersion": "5.4.0-70-generic",
            "BuildTime": "2021-07-30T19:52:33.000000000+00:00"
        },
        "containers": [
            {
            "key": "name",
            "name": "backup_db_10_10_db_1",
            "Names": [
                "backup_db_10_10_db_1"
            ],
            "Id": "1d00bf1bb0912e7d8d2c2cd11bbce7b2c9addceaee50840b04bc038ce61ada99",
            "Image": [
                "mariadb:latest"
            ],
            "Status": "running",
            "Command": [
                "docker-entrypoint.sh"
            ],
            "cpu": {
                "total": 0.1650143185254812
            },
            "cpu_percent": 0.1650143185254812,
            "memory": {
                "usage": 63528960,
                "limit": 18863755264,
                "max_usage": 64352256
            },
            "memory_usage": 63528960,
            "io": {
                "time_since_update": 61.5504035949707,
                "ior": 0,
                "iow": 0,
                "cumulative_ior": 90112,
                "cumulative_iow": 10752
            },
            "io_r": 0,
            "io_w": 0,
            "network": {
                "time_since_update": 61.55041193962097,
                "rx": 0,
                "tx": 0,
                "cumulative_rx": 21709388,
                "cumulative_tx": 9365
            },
            "network_rx": 0,
            "network_tx": 0
            }
        ]
    }
    ```
## 1. Установить Apache веб-сервер на VM и настроить его на работу с PHP (например, как указано в инструкции. Поменять порт по умолчанию на 8080. Убедиться, что Apache работает и возвращает страницу с информацией о PHP.
```
[root@localhost ~]# yum -y install httpd mod_ssl
Последняя проверка окончания срока действия метаданных: 0:44:51 назад, Ср 30 авг 2023 22:43:03.
Пакет httpd-2.4.37-62.module_el8+657+88b2113f.x86_64 уже установлен.
Пакет mod_ssl-1:2.4.37-62.module_el8+657+88b2113f.x86_64 уже установлен.
Зависимости разрешены.
Отсутствуют действия для выполнения
Выполнено!
[root@localhost ~]# nano /etc/httpd/conf/httpd.conf 
[root@localhost ~]# chkconfig httpd on
Запрос будет перенаправлен «systemctl enable httpd.service».
Created symlink /etc/systemd/system/multi-user.target.wants/httpd.service → /usr/lib/systemd/system/httpd.service.
[root@localhost ~]# service httpd start
Redirecting to /bin/systemctl start httpd.service

[root@localhost ~]# nano /var/www/html/index.php
[root@localhost ~]# yum install php
Последняя проверка окончания срока действия метаданных: 0:03:11 назад, Чт 31 авг 2023 14:50:06.
Зависимости разрешены.
================================================================================
 Пакет        Архитектура
                       Версия                                 Репозиторий Размер
================================================================================
Установка:
 php          x86_64   7.2.24-1.module_el8.2.0+313+b04d0a66   appstream   1.5 M
Установка зависимостей:
 php-cli      x86_64   7.2.24-1.module_el8.2.0+313+b04d0a66   appstream   3.1 M
 php-common   x86_64   7.2.24-1.module_el8.2.0+313+b04d0a66   appstream   661 k
Установка слабых зависимостей:
 php-fpm      x86_64   7.2.24-1.module_el8.2.0+313+b04d0a66   appstream   1.6 M
Включение потоков модулей:
 php                   7.2                                                     

Результат транзакции
================================================================================
Установка  4 Пакета

Объем загрузки: 6.9 M
Объем изменений: 25 M
Продолжить? [д/Н]: y
Загрузка пакетов:
(1/4): php-common-7.2.24-1.module_el8.2.0+313+b 2.2 MB/s | 661 kB     00:00    
(2/4): php-7.2.24-1.module_el8.2.0+313+b04d0a66 3.9 MB/s | 1.5 MB     00:00    
(3/4): php-fpm-7.2.24-1.module_el8.2.0+313+b04d 4.0 MB/s | 1.6 MB     00:00    
(4/4): php-cli-7.2.24-1.module_el8.2.0+313+b04d 4.0 MB/s | 3.1 MB     00:00    
--------------------------------------------------------------------------------
Общий размер                                    6.4 MB/s | 6.9 MB     00:01     
Проверка транзакции
Проверка транзакции успешно завершена.
Идет проверка транзакции
Тест транзакции проведен успешно
Выполнение транзакции
  Подготовка       :                                                        1/1 
  Установка        : php-common-7.2.24-1.module_el8.2.0+313+b04d0a66.x86_   1/4 
  Установка        : php-cli-7.2.24-1.module_el8.2.0+313+b04d0a66.x86_64    2/4 
  Установка        : php-fpm-7.2.24-1.module_el8.2.0+313+b04d0a66.x86_64    3/4 
  Запуск скриптлета: php-fpm-7.2.24-1.module_el8.2.0+313+b04d0a66.x86_64    3/4 
  Установка        : php-7.2.24-1.module_el8.2.0+313+b04d0a66.x86_64        4/4 
  Запуск скриптлета: php-7.2.24-1.module_el8.2.0+313+b04d0a66.x86_64        4/4 
/sbin/ldconfig: /usr/lib64/llvm15/lib/libclang.so.15 is not a symbolic link


  Запуск скриптлета: php-fpm-7.2.24-1.module_el8.2.0+313+b04d0a66.x86_64    4/4 
  Проверка         : php-7.2.24-1.module_el8.2.0+313+b04d0a66.x86_64        1/4 
  Проверка         : php-cli-7.2.24-1.module_el8.2.0+313+b04d0a66.x86_64    2/4 
  Проверка         : php-common-7.2.24-1.module_el8.2.0+313+b04d0a66.x86_   3/4 
  Проверка         : php-fpm-7.2.24-1.module_el8.2.0+313+b04d0a66.x86_64    4/4 

Установлен:
  php-7.2.24-1.module_el8.2.0+313+b04d0a66.x86_64                               
  php-cli-7.2.24-1.module_el8.2.0+313+b04d0a66.x86_64                           
  php-common-7.2.24-1.module_el8.2.0+313+b04d0a66.x86_64                        
  php-fpm-7.2.24-1.module_el8.2.0+313+b04d0a66.x86_64                           

Выполнено!
[root@localhost ~]# service httpd restart
Redirecting to /bin/systemctl restart httpd.service

```
## 2. Установить Nginx на VM.
```
[root@localhost ~]# nano /etc/yum.repos.d/nginx.repo
[root@localhost ~]# yum update
nginx repo                                      103 kB/s |  53 kB     00:00    
Зависимости разрешены.
Отсутствуют действия для выполнения
Выполнено!
[root@localhost ~]# yum install nginx
Последняя проверка окончания срока действия метаданных: 0:01:38 назад, Ср 30 авг 2023 23:56:28.
Зависимости разрешены.
================================================================================
 Пакет           Архитектура
                        Версия                                  Репозиторий
                                                                          Размер
================================================================================
Установка:
 nginx           x86_64 1:1.14.1-9.module_el8.0.0+1060+3ab382d3 appstream 570 k
Установка зависимостей:
 nginx-all-modules
                 noarch 1:1.14.1-9.module_el8.0.0+1060+3ab382d3 appstream  23 k
 nginx-filesystem
                 noarch 1:1.14.1-9.module_el8.0.0+1060+3ab382d3 appstream  24 k
 nginx-mod-http-image-filter
                 x86_64 1:1.14.1-9.module_el8.0.0+1060+3ab382d3 appstream  35 k
 nginx-mod-http-perl
                 x86_64 1:1.14.1-9.module_el8.0.0+1060+3ab382d3 appstream  46 k
 nginx-mod-http-xslt-filter
                 x86_64 1:1.14.1-9.module_el8.0.0+1060+3ab382d3 appstream  33 k
 nginx-mod-mail  x86_64 1:1.14.1-9.module_el8.0.0+1060+3ab382d3 appstream  64 k
 nginx-mod-stream
                 x86_64 1:1.14.1-9.module_el8.0.0+1060+3ab382d3 appstream  85 k
Включение потоков модулей:
 nginx                  1.14                                                   

Результат транзакции
================================================================================
Установка  8 Пакетов

Объем загрузки: 880 k
Объем изменений: 2.0 M
Продолжить? [д/Н]: y
Загрузка пакетов:
(1/8): nginx-filesystem-1.14.1-9.module_el8.0.0 276 kB/s |  24 kB     00:00    
(2/8): nginx-all-modules-1.14.1-9.module_el8.0. 260 kB/s |  23 kB     00:00    
(3/8): nginx-mod-http-image-filter-1.14.1-9.mod 973 kB/s |  35 kB     00:00    
(4/8): nginx-mod-http-perl-1.14.1-9.module_el8. 643 kB/s |  46 kB     00:00    
(5/8): nginx-mod-http-xslt-filter-1.14.1-9.modu 740 kB/s |  33 kB     00:00    
(6/8): nginx-1.14.1-9.module_el8.0.0+1060+3ab38 3.1 MB/s | 570 kB     00:00    
(7/8): nginx-mod-mail-1.14.1-9.module_el8.0.0+1 2.7 MB/s |  64 kB     00:00    
(8/8): nginx-mod-stream-1.14.1-9.module_el8.0.0 1.8 MB/s |  85 kB     00:00    
--------------------------------------------------------------------------------
Общий размер                                    1.1 MB/s | 880 kB     00:00     
Проверка транзакции
Проверка транзакции успешно завершена.
Идет проверка транзакции
Тест транзакции проведен успешно
Выполнение транзакции
  Подготовка       :                                                        1/1 
  Запуск скриптлета: nginx-filesystem-1:1.14.1-9.module_el8.0.0+1060+3ab3   1/8 
  Установка        : nginx-filesystem-1:1.14.1-9.module_el8.0.0+1060+3ab3   1/8 
  Установка        : nginx-mod-http-image-filter-1:1.14.1-9.module_el8.0.   2/8 
  Запуск скриптлета: nginx-mod-http-image-filter-1:1.14.1-9.module_el8.0.   2/8 
  Установка        : nginx-mod-http-perl-1:1.14.1-9.module_el8.0.0+1060+3   3/8 
  Запуск скриптлета: nginx-mod-http-perl-1:1.14.1-9.module_el8.0.0+1060+3   3/8 
  Установка        : nginx-mod-http-xslt-filter-1:1.14.1-9.module_el8.0.0   4/8 
  Запуск скриптлета: nginx-mod-http-xslt-filter-1:1.14.1-9.module_el8.0.0   4/8 
  Установка        : nginx-mod-mail-1:1.14.1-9.module_el8.0.0+1060+3ab382   5/8 
  Запуск скриптлета: nginx-mod-mail-1:1.14.1-9.module_el8.0.0+1060+3ab382   5/8 
  Установка        : nginx-all-modules-1:1.14.1-9.module_el8.0.0+1060+3ab   6/8 
  Установка        : nginx-1:1.14.1-9.module_el8.0.0+1060+3ab382d3.x86_64   7/8 
  Запуск скриптлета: nginx-1:1.14.1-9.module_el8.0.0+1060+3ab382d3.x86_64   7/8 
  Установка        : nginx-mod-stream-1:1.14.1-9.module_el8.0.0+1060+3ab3   8/8 
  Запуск скриптлета: nginx-mod-stream-1:1.14.1-9.module_el8.0.0+1060+3ab3   8/8 
/sbin/ldconfig: /usr/lib64/llvm15/lib/libclang.so.15 is not a symbolic link


  Проверка         : nginx-1:1.14.1-9.module_el8.0.0+1060+3ab382d3.x86_64   1/8 
  Проверка         : nginx-all-modules-1:1.14.1-9.module_el8.0.0+1060+3ab   2/8 
  Проверка         : nginx-filesystem-1:1.14.1-9.module_el8.0.0+1060+3ab3   3/8 
  Проверка         : nginx-mod-http-image-filter-1:1.14.1-9.module_el8.0.   4/8 
  Проверка         : nginx-mod-http-perl-1:1.14.1-9.module_el8.0.0+1060+3   5/8 
  Проверка         : nginx-mod-http-xslt-filter-1:1.14.1-9.module_el8.0.0   6/8 
  Проверка         : nginx-mod-mail-1:1.14.1-9.module_el8.0.0+1060+3ab382   7/8 
  Проверка         : nginx-mod-stream-1:1.14.1-9.module_el8.0.0+1060+3ab3   8/8 

Установлен:
  nginx-1:1.14.1-9.module_el8.0.0+1060+3ab382d3.x86_64                          
  nginx-all-modules-1:1.14.1-9.module_el8.0.0+1060+3ab382d3.noarch              
  nginx-filesystem-1:1.14.1-9.module_el8.0.0+1060+3ab382d3.noarch               
  nginx-mod-http-image-filter-1:1.14.1-9.module_el8.0.0+1060+3ab382d3.x86_64    
  nginx-mod-http-perl-1:1.14.1-9.module_el8.0.0+1060+3ab382d3.x86_64            
  nginx-mod-http-xslt-filter-1:1.14.1-9.module_el8.0.0+1060+3ab382d3.x86_64     
  nginx-mod-mail-1:1.14.1-9.module_el8.0.0+1060+3ab382d3.x86_64                 
  nginx-mod-stream-1:1.14.1-9.module_el8.0.0+1060+3ab382d3.x86_64               

Выполнено!
[root@localhost ~]# systemctl enable nginx
Created symlink /etc/systemd/system/multi-user.target.wants/nginx.service → /usr/lib/systemd/system/nginx.service.
[root@localhost ~]# systemctl is-enabled nginx
enabled
[root@localhost ~]# service nginx status
Redirecting to /bin/systemctl status nginx.service
● nginx.service - The nginx HTTP and reverse proxy server
   Loaded: loaded (/usr/lib/systemd/system/nginx.service; enabled; vendor preset: disabled)
   Active: active (running) since Thu 2023-08-31 00:21:20 +03; 8s ago
  Process: 236463 ExecStart=/usr/sbin/nginx (code=exited, status=0/SUCCESS)
  Process: 236461 ExecStartPre=/usr/sbin/nginx -t (code=exited, status=0/SUCCESS)
  Process: 236459 ExecStartPre=/usr/bin/rm -f /run/nginx.pid (code=exited, status=0/SUCCESS)
 Main PID: 236464 (nginx)
    Tasks: 5 (limit: 23216)
   Memory: 14.1M
   CGroup: /system.slice/nginx.service
           ├─236464 nginx: master process /usr/sbin/nginx
           ├─236465 nginx: worker process
           ├─236466 nginx: worker process
           ├─236467 nginx: worker process
           └─236468 nginx: worker process

авг 31 00:21:19 localhost.localdomain systemd[1]: Starting The nginx HTTP and reverse proxy server...
авг 31 00:21:20 localhost.localdomain nginx[236461]: nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
авг 31 00:21:20 localhost.localdomain nginx[236461]: nginx: configuration file /etc/nginx/nginx.conf test is successful
авг 31 00:21:20 localhost.localdomain systemd[1]: Started The nginx HTTP and reverse proxy server.
```
## 3. Скопировать папку https://github.com/tms-dos17-onl/_sandbox/tree/main/lecture15/react_nginx/build на VM и настроить Nginx на хостинг этого веб-приложения. Проверить работоспособность приложения путем посещения всех доступных ссылок на главной странице и обновления каждой из страниц в веб-браузере.

![VirtualBox_Centos7_04_09_2023_19_21_07](https://github.com/tms-dos17-onl/Eugene-stasiukevich/assets/100120414/dff65db6-9ec6-4f0d-8df1-6440a592fd0e)
![VirtualBox_Centos7_04_09_2023_19_21_18](https://github.com/tms-dos17-onl/Eugene-stasiukevich/assets/100120414/91a76a4f-a551-4e09-a559-c85f838fe1d4)
![VirtualBox_Centos7_04_09_2023_19_21_27](https://github.com/tms-dos17-onl/Eugene-stasiukevich/assets/100120414/12721eb5-d6df-4a3a-91db-69f673739557)

```
[root@localhost ~]# ls -la /var/www/build/html
итого 44
drwxr-xr-x. 3 root root  177 сен  1 07:59 .
drwxr-xr-x. 3 root root   18 сен  1 07:59 ..
-rw-r--r--. 1 root root  497 авг 28 14:27 50x.html
-rw-r--r--. 1 root root  366 авг 28 14:27 asset-manifest.json
-rw-r--r--. 1 root root 3870 авг 28 14:27 favicon.ico
-rw-r--r--. 1 root root  584 авг 28 14:27 index.html
-rw-r--r--. 1 root root 5347 авг 28 14:27 logo192.png
-rw-r--r--. 1 root root 9664 авг 28 14:27 logo512.png
-rw-r--r--. 1 root root  492 авг 28 14:27 manifest.json
-rw-r--r--. 1 root root   67 авг 28 14:27 robots.txt
drwxr-xr-x. 3 root root   16 авг 28 14:27 static

[root@localhost ~]# cat /etc/nginx/conf.d/temp.conf
server {
        listen       81 default_server;
        listen       [::]:81 default_server;
        server_name  _;
        root         /var/www/build/html;

        # Load configuration files for the default server block.
        include /etc/nginx/default.d/*.conf;

        location / {
        }

        error_page 404 /404.html;
            location = /40x.html {
        }

        error_page 500 502 503 504 /50x.html;
            location = /50x.html {
        }
    }
```
## 4. Скопировать папку https://github.com/tms-dos17-onl/_sandbox/tree/main/lecture15/api на VM и запустить Python REST Api приложение согласно инструкции. Проверить работоспособность всех доступных REST Api методов с помощью Swagger.
```
[root@localhost ~]# cd /root/api
[root@localhost api]# python3 -m venv .venv
[root@localhost api]# source .venv/bin/activate
(.venv) [root@localhost api]# python3 -m pip install -r requirements.txt
Collecting Flask==2.3.2 (from -r requirements.txt (line 1))
  Cache entry deserialization failed, entry ignored
  Could not find a version that satisfies the requirement Flask==2.3.2 (from -r requirements.txt (line 1)) (from versions: 0.1, 0.2, 0.3, 0.3.1, 0.4, 0.5, 0.5.1, 0.5.2, 0.6, 0.6.1, 0.7, 0.7.1, 0.7.2, 0.8, 0.8.1, 0.9, 0.10, 0.10.1, 0.11, 0.11.1, 0.12, 0.12.1, 0.12.2, 0.12.3, 0.12.4, 0.12.5, 1.0, 1.0.1, 1.0.2, 1.0.3, 1.0.4, 1.1.0, 1.1.1, 1.1.2, 1.1.3, 1.1.4, 2.0.0rc1, 2.0.0rc2, 2.0.0, 2.0.1, 2.0.2, 2.0.3)
No matching distribution found for Flask==2.3.2 (from -r requirements.txt (line 1))
You are using pip version 9.0.3, however version 23.2.1 is available.
You should consider upgrading via the 'pip install --upgrade pip' command.
(.venv) [root@localhost api]# python3.8 -m pip install -r requirements.txt
Collecting Flask==2.3.2
  Downloading Flask-2.3.2-py3-none-any.whl (96 kB)
     |████████████████████████████████| 96 kB 797 kB/s 
Collecting flasgger==0.9.7.1
  Downloading flasgger-0.9.7.1.tar.gz (4.0 MB)
     |████████████████████████████████| 4.0 MB 6.6 MB/s 
Collecting requests==2.31.0
  Downloading requests-2.31.0-py3-none-any.whl (62 kB)
     |████████████████████████████████| 62 kB 1.2 MB/s 
Collecting itsdangerous>=2.1.2
  Downloading itsdangerous-2.1.2-py3-none-any.whl (15 kB)
Collecting click>=8.1.3
  Downloading click-8.1.7-py3-none-any.whl (97 kB)
     |████████████████████████████████| 97 kB 6.0 MB/s 
Collecting Jinja2>=3.1.2
  Downloading Jinja2-3.1.2-py3-none-any.whl (133 kB)
     |████████████████████████████████| 133 kB 12.2 MB/s 
Collecting Werkzeug>=2.3.3
  Downloading werkzeug-2.3.7-py3-none-any.whl (242 kB)
     |████████████████████████████████| 242 kB 12.5 MB/s 
Collecting blinker>=1.6.2
  Downloading blinker-1.6.2-py3-none-any.whl (13 kB)
Collecting importlib-metadata>=3.6.0
  Downloading importlib_metadata-6.8.0-py3-none-any.whl (22 kB)
Collecting PyYAML>=3.0
  Downloading PyYAML-6.0.1-cp38-cp38-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (736 kB)
     |████████████████████████████████| 736 kB 12.9 MB/s 
Collecting jsonschema>=3.0.1
  Downloading jsonschema-4.19.0-py3-none-any.whl (83 kB)
     |████████████████████████████████| 83 kB 3.7 MB/s 
Collecting mistune
  Downloading mistune-3.0.1-py3-none-any.whl (47 kB)
     |████████████████████████████████| 47 kB 4.5 MB/s 
Collecting six>=1.10.0
  Downloading six-1.16.0-py2.py3-none-any.whl (11 kB)
Collecting packaging
  Downloading packaging-23.1-py3-none-any.whl (48 kB)
     |████████████████████████████████| 48 kB 4.3 MB/s 
Collecting urllib3<3,>=1.21.1
  Downloading urllib3-2.0.4-py3-none-any.whl (123 kB)
     |████████████████████████████████| 123 kB 16.2 MB/s 
Collecting idna<4,>=2.5
  Downloading idna-3.4-py3-none-any.whl (61 kB)
     |████████████████████████████████| 61 kB 124 kB/s 
Collecting certifi>=2017.4.17
  Downloading certifi-2023.7.22-py3-none-any.whl (158 kB)
     |████████████████████████████████| 158 kB 13.3 MB/s 
Collecting charset-normalizer<4,>=2
  Downloading charset_normalizer-3.2.0-cp38-cp38-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (199 kB)
     |████████████████████████████████| 199 kB 10.9 MB/s 
Collecting zipp>=0.5
  Downloading zipp-3.16.2-py3-none-any.whl (7.2 kB)
Collecting MarkupSafe>=2.0
  Downloading MarkupSafe-2.1.3-cp38-cp38-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (25 kB)
Collecting attrs>=22.2.0
  Downloading attrs-23.1.0-py3-none-any.whl (61 kB)
     |████████████████████████████████| 61 kB 9.3 MB/s 
Collecting pkgutil-resolve-name>=1.3.10
  Downloading pkgutil_resolve_name-1.3.10-py3-none-any.whl (4.7 kB)
Collecting jsonschema-specifications>=2023.03.6
  Downloading jsonschema_specifications-2023.7.1-py3-none-any.whl (17 kB)
Collecting referencing>=0.28.4
  Downloading referencing-0.30.2-py3-none-any.whl (25 kB)
Collecting rpds-py>=0.7.1
  Downloading rpds_py-0.10.2-cp38-cp38-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (1.2 MB)
     |████████████████████████████████| 1.2 MB 13.1 MB/s 
Collecting importlib-resources>=1.4.0
  Downloading importlib_resources-6.0.1-py3-none-any.whl (34 kB)
Using legacy 'setup.py install' for flasgger, since package 'wheel' is not installed.
Installing collected packages: zipp, rpds-py, attrs, referencing, MarkupSafe, importlib-resources, Werkzeug, pkgutil-resolve-name, jsonschema-specifications, Jinja2, itsdangerous, importlib-metadata, click, blinker, urllib3, six, PyYAML, packaging, mistune, jsonschema, idna, Flask, charset-normalizer, certifi, requests, flasgger
    Running setup.py install for flasgger ... done
Successfully installed Flask-2.3.2 Jinja2-3.1.2 MarkupSafe-2.1.3 PyYAML-6.0.1 Werkzeug-2.3.7 attrs-23.1.0 blinker-1.6.2 certifi-2023.7.22 charset-normalizer-3.2.0 click-8.1.7 flasgger-0.9.7.1 idna-3.4 importlib-metadata-6.8.0 importlib-resources-6.0.1 itsdangerous-2.1.2 jsonschema-4.19.0 jsonschema-specifications-2023.7.1 mistune-3.0.1 packaging-23.1 pkgutil-resolve-name-1.3.10 referencing-0.30.2 requests-2.31.0 rpds-py-0.10.2 six-1.16.0 urllib3-2.0.4 zipp-3.16.2
WARNING: Running pip as root will break packages and permissions. You should install packages reliably by using venv: https://pip.pypa.io/warnings/venv
WARNING: You are using pip version 21.1.1; however, version 23.2.1 is available.
You should consider upgrading via the '/usr/local/bin/python3.8 -m pip install --upgrade pip' command.
(.venv) [root@localhost api]# python3.8 main.py
 * Serving Flask app 'main'
 * Debug mode: on
WARNING: This is a development server. Do not use it in a production deployment. Use a production WSGI server instead.
 * Running on all addresses (0.0.0.0)
 * Running on http://127.0.0.1:5000
 * Running on http://192.168.100.97:5000
Press CTRL+C to quit
 * Restarting with stat
 * Debugger is active!
 * Debugger PIN: 794-703-785
```
![VirtualBox_Centos7_04_09_2023_22_18_52](https://github.com/tms-dos17-onl/Eugene-stasiukevich/assets/100120414/4171d551-9cdd-4ef1-ab55-9fb43baedd40)
![VirtualBox_Centos7_04_09_2023_22_19_11](https://github.com/tms-dos17-onl/Eugene-stasiukevich/assets/100120414/f39275e9-8f14-438d-b1df-f4e049104e3f)
![VirtualBox_Centos7_04_09_2023_22_19_27](https://github.com/tms-dos17-onl/Eugene-stasiukevich/assets/100120414/97f9c68b-23ce-447b-8bb7-937f729be8d6)
![VirtualBox_Centos7_04_09_2023_22_19_39](https://github.com/tms-dos17-onl/Eugene-stasiukevich/assets/100120414/0676d6e2-d1ae-4589-a9c3-f71a0319d065)
![VirtualBox_Centos7_04_09_2023_22_20_05](https://github.com/tms-dos17-onl/Eugene-stasiukevich/assets/100120414/d01bf9cb-8a4e-46a8-b131-6823e0e66bc7)
## 5. Настроить Nginx как Reverse Proxy для Python REST Api приложения из предыдущего пункта. А затем:
## - Открыть Swagger для веб-приложения через Nginx (http://<NGINX_IP>:<NGINX_PORT>/apidocs).
## - Проверить работоспособность всех доступных REST Api методов через Nginx с помощью Swagger. Убедиться, что нет ошибок ни в выводе Rest Api приложения, ни в HTTP ответе     в Swagger. При необходимости поправить конфигурацию Nginx сервера, чтобы все методы работали.
## - Для тестирования метода /uploadFile использовать файл размером больше 1MB.
## - Вывести в консоль содержимое файла конфигурации Nginx с измененными значениями и комментариями.
```




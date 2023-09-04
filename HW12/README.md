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

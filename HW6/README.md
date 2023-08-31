## 1. Определить все IP адреса, маски подсетей и соответствующие MAC адреса Linux VM. Определите класс и адреса подсетей, в которых находится VM.
```
[root@localhost ~]# ifconfig
enp0s3: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.100.97  netmask 255.255.255.0  broadcast 192.168.100.255
        inet6 fe80::a00:27ff:fe11:bade  prefixlen 64  scopeid 0x20<link>
        ether 08:00:27:11:ba:de  txqueuelen 1000  (Ethernet)
        RX packets 77108  bytes 106361611 (101.4 MiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 36314  bytes 3402149 (3.2 MiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

enp0s8: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        ether 08:00:27:a7:52:4b  txqueuelen 1000  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 4016  bytes 241560 (235.8 KiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 4016  bytes 241560 (235.8 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```
VM IPv4 192.168.100.97, IP-сеть класса C, MAC 08:00:27:11:ba:de.

## 2. Определить публичный IP адрес хоста и Linux VM? Чем они отличаются?

HOST
```
C:\Users\User>curl.exe ifconfig.me
37.212.83.34
```
CentOS VM
```
[root@localhost ~]# curl ifconfig.me
37.212.83.34[root@localhost ~]# 
```
## 3. Вывести ARP таблицу на хосте и найти там запись, соответствующую MAC адресу с предыдущего задания. Если её нет, то объяснить почему.
```
C:\Users\User>arp -a
Интерфейс: 192.168.100.2 --- 0xf
  адрес в Интернете      Физический адрес      Тип
  192.168.100.1         60-f1-8a-3e-d2-14     динамический
  192.168.100.97        08-00-27-11-ba-de     динамический
  192.168.100.255       ff-ff-ff-ff-ff-ff     статический
  224.0.0.22            01-00-5e-00-00-16     статический
  224.0.0.251           01-00-5e-00-00-fb     статический
  224.0.0.252           01-00-5e-00-00-fc     статический
  239.255.255.250       01-00-5e-7f-ff-fa     статический
  255.255.255.255       ff-ff-ff-ff-ff-ff     статический

[root@localhost ~]# arp -a
_gateway (192.168.100.1) at 60:f1:8a:3e:d2:14 [ether] on enp0s3
? (192.168.100.2) at a8:a1:59:6e:29:70 [ether] on enp0s3
```
Так как ВМ настроена сетевым мостом, то соответственно Машина использует сетевой интерфейс чтобы получить адрес у роутера и становится доступна для других устройств, как и основной компьютер по своему ip адресу.

## 4. Выполнить разбиение сети 172.20.0.0/16 на подсети с маской /24 и ответить на следующие вопросы:
- Сколько всего подсетей будет в сети? - 254
- Сколько узлов будет в каждой подсети? - 256
- Каким будет сетевой адрес первой и второй подсети? - 172.20.0.0 172.20.1.0
- Каким будут адреса первого и последнего хостов в первой и второй подсетях? - 172.20.0.1 172.20.0.254 172.20.1.1 172.20.1.254
- Каким будет широковещательный адрес в последней подсети? - 172.20.255.255
## 5. Найти IP адрес соответствующий доменному имени ya.ru. Выполнить HTTP запрос на указанный IP адрес, чтобы скачать страницу с помощью утилиты curl. В результате должна вывестись HTML страничка в консоль. Подсказка:
  ```
[root@localhost ~]# nslookup ya.ru
Server:		192.168.100.1
Address:	192.168.100.1#53

Non-authoritative answer:
Name:	ya.ru
Address: 5.255.255.242
Name:	ya.ru
Address: 77.88.55.242
Name:	ya.ru
Address: 2a02:6b8::2:242

--2023-08-17 21:33:39--  https://5.255.255.242/
Подключение к 5.255.255.242:443... соединение установлено.
Владелец сертификата не совпадает с именем узла «5.255.255.242»
Ссылки преобразованы в файлы (0) за 0 секунд.
[root@localhost ~]# wget -k -r -p https://ya.ru
--2023-08-17 21:33:50--  https://ya.ru/
Распознаётся ya.ru (ya.ru)… 77.88.55.242, 5.255.255.242, 2a02:6b8::2:242
Подключение к ya.ru (ya.ru)|77.88.55.242|:443... соединение установлено.
HTTP-запрос отправлен. Ожидание ответа… 302 Moved temporarily
Адрес: https://ya.ru/?nr=1&redirect_ts=1692297230.00000 [переход]
--2023-08-17 21:33:51--  https://ya.ru/?nr=1&redirect_ts=1692297230.00000
Повторное использование соединения с ya.ru:443.
HTTP-запрос отправлен. Ожидание ответа… 302 Moved temporarily
Адрес: https://sso.passport.yandex.ru/push?retpath=https%3A%2F%2Fya.ru%2F%3Fnr%3D1%26redirect_ts%3D1692297230.00000&uuid=3ab5ef2b-5035-4d83-9045-990412260f5a [переход]
--2023-08-17 21:33:51--  https://sso.passport.yandex.ru/push?retpath=https%3A%2F%2Fya.ru%2F%3Fnr%3D1%26redirect_ts%3D1692297230.00000&uuid=3ab5ef2b-5035-4d83-9045-990412260f5a
Распознаётся sso.passport.yandex.ru (sso.passport.yandex.ru)… 213.180.204.24, 2a02:6b8::24
Подключение к sso.passport.yandex.ru (sso.passport.yandex.ru)|213.180.204.24|:443... соединение установлено.
HTTP-запрос отправлен. Ожидание ответа… 200 OK
Длина: 1945 (1,9K) [text/html]
Сохранение в: «ya.ru/index.html»

ya.ru/index.html               100%[=================================================>]   1,90K  --.-KB/s    за 0s      

2023-08-17 21:33:51 (89,5 MB/s) - «ya.ru/index.html» сохранён [1945/1945]

ЗАВЕРШЕНО --2023-08-17 21:33:51--
Общее время: 0,5s
Загружено: 1 файлов, 1,9K за 0s (89,5 MB/s)
Преобразование ссылок в ya.ru/index.html… нечего выполнять.
Ссылки преобразованы в файлы (1) за 0 секунд.



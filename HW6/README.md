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
curl -o /root/homework 5.255.255.242 -LvH 'Host: ya.ru'
```



## 1. Распределить основные сетевые протоколы (перечислены ниже) по уровням модели TCP/IP
```
UDP - Транспортный
TCP - Транспортный
FTP - Прикладной
RTP - Прикладной
DNS - Прикладной
ICMP - Сетевой
HTTP - Прикладной
NTP - Прикладной
SSH - Прикладной
```
## 2. Узнать pid процесса и длительность подключения ssh с помощью утилиты ss
```
[root@localhost ~]# lsof -n -a -itcp -stcp:established -c sshd
COMMAND   PID USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
sshd    54156 root    4u  IPv4 359955      0t0  TCP 192.168.100.97:ssh->192.168.100.2:63525 (ESTABLISHED)
sshd    54160 root    4u  IPv4 359955      0t0  TCP 192.168.100.97:ssh->192.168.100.2:63525 (ESTABLISHED)
[root@localhost ~]# ss -o state established '( dport = :ssh or sport = :ssh )'
Netid       Recv-Q       Send-Q              Local Address:Port              Peer Address:Port       Process      
tcp         0            0                  192.168.100.97:ssh              192.168.100.2:63525       timer:(keepalive,100min,0)
```
## 3. Закрыть все порты для входящих подключений, кроме ssh
```
[root@localhost ~]# # iptables -A INPUT -p tcp --dport 22 -j ACCEPT
[root@localhost ~]# iptables -L
Chain INPUT (policy ACCEPT)
target     prot opt source               destination         
LIBVIRT_INP  all  --  anywhere             anywhere            

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination         
LIBVIRT_FWX  all  --  anywhere             anywhere            
LIBVIRT_FWI  all  --  anywhere             anywhere            
LIBVIRT_FWO  all  --  anywhere             anywhere            

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination         
LIBVIRT_OUT  all  --  anywhere             anywhere            

Chain LIBVIRT_INP (1 references)
target     prot opt source               destination         
ACCEPT     udp  --  anywhere             anywhere             udp dpt:domain
ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:domain
ACCEPT     udp  --  anywhere             anywhere             udp dpt:bootps
ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:bootps

Chain LIBVIRT_OUT (1 references)
target     prot opt source               destination         
ACCEPT     udp  --  anywhere             anywhere             udp dpt:domain
ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:domain
ACCEPT     udp  --  anywhere             anywhere             udp dpt:bootpc
ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:bootpc

Chain LIBVIRT_FWO (1 references)
target     prot opt source               destination         
ACCEPT     all  --  192.168.122.0/24     anywhere            
REJECT     all  --  anywhere             anywhere             reject-with icmp-port-unreachable

Chain LIBVIRT_FWI (1 references)
target     prot opt source               destination         
ACCEPT     all  --  anywhere             192.168.122.0/24     ctstate RELATED,ESTABLISHED
REJECT     all  --  anywhere             anywhere             reject-with icmp-port-unreachable

Chain LIBVIRT_FWX (1 references)
target     prot opt source               destination         
ACCEPT     all  --  anywhere             anywhere
```
## 4. Установить telnetd на ВМ, зайти на нее с другой ВМ с помощью telnet и отловить вводимый пароль и вводимые команды при входе c помощью tcpdump
```
[root@localhost ~]# yum install telnet telnet-server -y
Последняя проверка окончания срока действия метаданных: 1:11:31 назад, Чт 10 авг 2023 19:26:41.
Зависимости разрешены.
==================================================================================================================
 Пакет                        Архитектура           Версия                         Репозиторий              Размер
==================================================================================================================
Установка:
 telnet                       x86_64                1:0.17-76.el8                  appstream                 72 k
 telnet-server                x86_64                1:0.17-76.el8                  appstream                 48 k

Результат транзакции
==================================================================================================================
Установка  2 Пакета

Объем загрузки: 120 k
Объем изменений: 175 k
Загрузка пакетов:
(1/2): telnet-0.17-76.el8.x86_64.rpm                                              738 kB/s |  72 kB     00:00    
(2/2): telnet-server-0.17-76.el8.x86_64.rpm                                       484 kB/s |  48 kB     00:00    
------------------------------------------------------------------------------------------------------------------
Общий размер                                                                      363 kB/s | 120 kB     00:00     
Проверка транзакции
Проверка транзакции успешно завершена.
Идет проверка транзакции
Тест транзакции проведен успешно
Выполнение транзакции
  Подготовка       :                                                                                          1/1 
  Установка        : telnet-server-1:0.17-76.el8.x86_64                                                       1/2 
  Запуск скриптлета: telnet-server-1:0.17-76.el8.x86_64                                                       1/2 
  Установка        : telnet-1:0.17-76.el8.x86_64                                                              2/2 
  Запуск скриптлета: telnet-1:0.17-76.el8.x86_64                                                              2/2 
  Проверка         : telnet-1:0.17-76.el8.x86_64                                                              1/2 
  Проверка         : telnet-server-1:0.17-76.el8.x86_64                                                       2/2 

Установлен:
  telnet-1:0.17-76.el8.x86_64                          telnet-server-1:0.17-76.el8.x86_64                         

Выполнено!

estetiques@estetiques-VirtualBox:~$ telnet 192.168.100.97
Trying 192.168.100.97...
Connected to 192.168.100.97.
Escape character is '^]'.

Kernel 4.18.0-492.el8.x86_64 on an x86_64
localhost login: root
Password: 
Last login: Thu Aug 10 20:00:37 from 192.168.100.2
########################
Welcome to DOS17-Smile##
########################

[root@localhost ~]# sudo tcpdump port telnet -lA > ./logfile
dropped privs to tcpdump
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on enp0s3, link-type EN10MB (Ethernet), capture size 262144 bytes

```

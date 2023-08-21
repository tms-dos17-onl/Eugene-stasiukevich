## 1. Добавить новый диск к виртуальной машине и проверить, что система видит его.
```
[root@localhost ~]# lsblk
NAME        MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda           8:0    0 41,5G  0 disk 
├─sda1        8:1    0    1G  0 part /boot
└─sda2        8:2    0 40,5G  0 part 
  ├─cs-root 253:0    0 36,5G  0 lvm  /
  └─cs-swap 253:1    0    4G  0 lvm  [SWAP]
sdb           8:16   0 41,5G  0 disk /test_disk
sdc           8:32   0 15,1G  0 disk 
sr0          11:0    1   61M  0 rom  /run/media/root/VBox_GAs_6.1.44
```
## 2. Вывести в консоль информацию по текущему размеру файловой системы.
```
[root@localhost ~]# df -h
Файловая система    Размер Использовано  Дост Использовано% Cмонтировано в
devtmpfs              1,8G            0  1,8G            0% /dev
tmpfs                 1,8G            0  1,8G            0% /dev/shm
tmpfs                 1,8G         9,3M  1,8G            1% /run
tmpfs                 1,8G            0  1,8G            0% /sys/fs/cgroup
/dev/mapper/cs-root    37G         9,4G   28G           26% /
/dev/sda1            1014M         226M  789M           23% /boot
/dev/sdb               41G         424M   39G            2% /test_disk
tmpfs                 367M          60K  367M            1% /run/user/0
/dev/sr0               61M          61M     0          100% /run/media/root/VBox_GAs_6.1.44
/dev/sdc               15G          24K   15G            1% /test_disk_hw9
```
## 3.Расширить корневую файловую систему за счёт добавленного диска.
```
[root@localhost ~]# lsblk
NAME        MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda           8:0    0 52,1G  0 disk 
├─sda1        8:1    0    1G  0 part /boot
└─sda2        8:2    0 40,5G  0 part 
  ├─cs-root 253:0    0 36,5G  0 lvm  /
  └─cs-swap 253:1    0    4G  0 lvm  [SWAP]
sdb           8:16   0 41,5G  0 disk /test_disk
sdc           8:32   0 15,1G  0 disk /test_disk_hw9
sr0          11:0    1 1024M  0 rom  
[root@localhost ~]# pvs
  PV         VG Fmt  Attr PSize   PFree
  /dev/sda2  cs lvm2 a--  <40,48g    0 
[root@localhost ~]# growpart /dev/sda 2
CHANGED: partition=2 start=2099200 old: size=84893696 end=86992895 new: size=107236831 end=109336030
```
## 4. Вывести информацию по новому размеру файловой системы.
```
[root@localhost ~]# pvs
  PV         VG Fmt  Attr PSize  PFree  
  /dev/sda2  cs lvm2 a--  51,13g <10,66g
[root@localhost ~]# lsblk
NAME        MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda           8:0    0 52,1G  0 disk 
├─sda1        8:1    0    1G  0 part /boot
└─sda2        8:2    0 51,1G  0 part 
  ├─cs-root 253:0    0 36,5G  0 lvm  /
  └─cs-swap 253:1    0    4G  0 lvm  [SWAP]
sdb           8:16   0 41,5G  0 disk /test_disk
sdc           8:32   0 15,1G  0 disk /test_disk_hw9
sr0          11:0    1 1024M  0 rom
```
## 5. Вывести в консоль текущую рабочую директорию.
```
[root@localhost ~]# pwd
/root
```
## 6. Вывести в консоль все файлы из домашней директории.
```
[root@localhost ~]# ls -l
итого 380
-rwxr-xr-x. 1 root root    301 авг 10 19:29 2.sh
-rw-------. 1 root root   1721 мая 28 19:45 anaconda-ks.cfg
-rw-r--r--. 1 root root  12875 авг 17 20:28 curl_ya.txt
drwxr-xr-x. 2 root root      6 июл  7 23:27 Desktop
drwxr-xr-x. 2 root root      6 июл  7 23:27 Documents
drwxr-xr-x. 2 root root     53 июл 10 19:37 Downloads
-rwxr-xr-x. 1 root root    336 июл 31 19:14 endless.sh
drwxr-xr-x. 6 root root     51 июл 24 19:46 Eugene-stasiukevich
-rw-r--r--. 1 root root  14362 авг 10 19:50 file.log
-rw-r--r--. 1 root root      0 авг 10 19:38 immortalfile
-rw-r--r--. 1 root root   2013 мая 28 19:49 initial-setup-ks.cfg
-rw-r--r--. 1 root root      0 авг 17 23:28 log
-rw-r--r--. 1 root root 295373 авг 10 22:52 logfile
-rw-r--r--. 1 root root   3623 июл  8 00:43 modules.txt
---x--x--x. 1 root root    367 июл 24 20:16 monitor.sh
drwxr-xr-x. 2 root root      6 июл  7 23:27 Music
-rw-r--r--. 1 root root   2921 июл 31 20:25 myplaylist.txt
-rwxr-xr-x. 1 root root    554 июл 31 19:05 new_user.sh
-rw-r--r--. 1 root root  16136 июл 31 19:40 output.txt
drwxr-xr-x. 2 root root   4096 июл 10 21:04 Pictures
drwxr-xr-x. 2 root root      6 июл  7 23:27 Public
drwxr-xr-x. 2 root root      6 июл  7 23:27 Templates
drwxr-xr-x. 2 root root      6 июл 10 19:11 test_disk
drwxr-xr-x. 2 root root      6 июл  7 23:27 Videos
-rwxr-xr-x. 1 root root     53 июл 31 19:37 work.sh
drwxr-xr-x. 2 root root     24 авг 17 21:29 ya.ru
```
## 7. Построить маршрут до google.com при помощи утилиты traceroute.
```
[root@localhost ~]# traceroute google.com
traceroute to google.com (192.178.25.174), 30 hops max, 60 byte packets
 1  _gateway (192.168.100.1)  0.822 ms  1.000 ms  1.151 ms
 2  100.107.128.1 (100.107.128.1)  12.150 ms  12.102 ms  12.050 ms
 3  93.84.80.133 (93.84.80.133)  11.320 ms  11.330 ms  11.339 ms
 4  10.0.42.61 (10.0.42.61)  11.794 ms  11.745 ms  11.690 ms
 5  core2.net.belpak.by (93.85.253.77)  22.313 ms  22.226 ms  22.167 ms
 6  ie1.net.belpak.by (93.85.80.50)  22.113 ms  13.874 ms  13.903 ms
 7  asbr10.net.belpak.by (93.85.80.229)  12.723 ms  12.506 ms  13.051 ms
 8  194.158.197.209 (194.158.197.209)  40.321 ms  36.777 ms  37.284 ms
 9  * * *
10  waw40s02-in-f14.1e100.net (192.178.25.174)  21.116 ms 142.250.214.194 (142.250.214.194)  36.864 ms 142.250.214.186 (142.250.214.186)  35.816 ms
```
## 8. Установить Sonatype Nexus OSS по следующей инструкции, а именно:
```



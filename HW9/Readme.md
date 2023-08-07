##1. Добавить новый диск к виртуальной машине и проверить, что система видит его.
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
##2. Вывести в консоль информацию по текущему размеру файловой системы.
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
##3.Расширить корневую файловую систему за счёт добавленного диска.
```



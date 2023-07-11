HW 2
1. Смонтировать /home на отдельный раздел
[root@localhost ~]# lsblk
NAME        MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda           8:0    0 41,5G  0 disk 
├─sda1        8:1    0    1G  0 part /boot
└─sda2        8:2    0 40,5G  0 part 
  ├─cs-root 253:0    0 36,5G  0 lvm  /
  └─cs-swap 253:1    0    4G  0 lvm  [SWAP]
sdb           8:16   0 41,5G  0 disk 
sr0          11:0    1   61M  0 rom  /run/media/root/VBox_GAs_6.1.44
[root@localhost ~]# parted /dev/sdb
GNU Parted 3.2
Используется /dev/sdb
Добро пожаловать в GNU Parted! Наберите 'help' для просмотра списка команд.
(parted) print                                                            
Ошибка: /dev/sdb: метка диска не определена
Модель: ATA VBOX HARDDISK (scsi)                                          
Диск /dev/sdb: 44,5GB
Размер сектора (логич./физич.): 512B/512B
Таблица разделов: unknown
Флаги диска: 
(parted) select                                                           
Новое устройство?  [/dev/sdb]? /dev/sdb                                   
Используется /dev/sdb
(parted) mklabel GPT                                                      
(parted) mklabel GPT                                                      
Предупреждение: Существующая метка диска на  /dev/sdb будет уничтожена и все
данные на этом диске будут потеряны. Действительно продолжить?
Да/Yes/Нет/No? yes                                                        
(parted) mkpart                                                           
Имя раздела?  []? 1                                                       
Тип файловой системы?  [ext2]? ext4                                       
Начало? 1                                                                 
Конец? 41000
(parted) print                                                            
Модель: ATA VBOX HARDDISK (scsi)
Диск /dev/sdb: 44,5GB
Размер сектора (логич./физич.): 512B/512B
Таблица разделов: gpt
Флаги диска: 

Номер  Начало  Конец   Размер  Файловая система  Имя  Флаги
 1     1049kB  41,0GB  41,0GB  ext4              1

(parted) quit                                                             
Информация: Не забудьте обновить /etc/fstab.

[root@localhost ~]# mkfs.ext4 /dev/sdb                                    
mke2fs 1.45.6 (20-Mar-2020)
Found a gpt partition table in /dev/sdb
Proceed anyway? (y,N) y
Creating filesystem with 10874112 4k blocks and 2719744 inodes
Filesystem UUID: 3744ba17-00c9-46f1-8597-3b5e06644a59
Superblock backups stored on blocks: 
	32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208, 
	4096000, 7962624

Allocating group tables: done                            
Writing inode tables: done                            
Creating journal (65536 blocks): done
Writing superblocks and filesystem accounting information: done   

[root@localhost ~]# lsblk
NAME        MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda           8:0    0 41,5G  0 disk 
├─sda1        8:1    0    1G  0 part /boot
└─sda2        8:2    0 40,5G  0 part 
  ├─cs-root 253:0    0 36,5G  0 lvm  /
  └─cs-swap 253:1    0    4G  0 lvm  [SWAP]
sdb           8:16   0 41,5G  0 disk 
sr0          11:0    1   61M  0 rom  /run/media/root/VBox_GAs_6.1.44
[root@localhost ~]# mkdir test_disk
[root@localhost ~]# mkdir /test_disk
[root@localhost ~]# mount -t ext4 /dev/sdb /test_disk/
[root@localhost ~]# df -h
Файловая система    Размер Использовано  Дост Использовано% Cмонтировано в
devtmpfs              1,8G            0  1,8G            0% /dev
tmpfs                 1,8G            0  1,8G            0% /dev/shm
tmpfs                 1,8G         9,3M  1,8G            1% /run
tmpfs                 1,8G            0  1,8G            0% /sys/fs/cgroup
/dev/mapper/cs-root    37G         8,6G   28G           24% /
/dev/sda1            1014M         226M  789M           23% /boot
tmpfs                 367M          28K  367M            1% /run/user/0
/dev/sr0               61M          61M     0          100% /run/media/root/VBox_GAs_6.1.44
/dev/sdb               41G          24K   39G            1% /test_disk
[root@localhost ~]# blkid
/dev/sdb: UUID="3744ba17-00c9-46f1-8597-3b5e06644a59" BLOCK_SIZE="4096" TYPE="ext4"
/dev/sda1: UUID="2ef8d6ad-143a-4fe7-8485-9e6c0eb29c89" BLOCK_SIZE="512" TYPE="xfs" PARTUUID="5a9d5fce-01"
/dev/sda2: UUID="qYB0As-ZdZ4-n6md-0XIH-mAoZ-9oQO-nYDuRk" TYPE="LVM2_member" PARTUUID="5a9d5fce-02"
/dev/sr0: BLOCK_SIZE="2048" UUID="2023-04-13-10-15-32-66" LABEL="VBox_GAs_6.1.44" TYPE="iso9660"
/dev/mapper/cs-root: UUID="734bdb20-cc2b-4411-aa53-84786f3d831d" BLOCK_SIZE="512" TYPE="xfs"
/dev/mapper/cs-swap: UUID="12c62d6f-49f9-49e5-9c43-e74b354b1097" TYPE="swap"
[root@localhost ~]# etc/fstab
bash: etc/fstab: No such file or directory
[root@localhost ~]# /etc/fstab
bash: /etc/fstab: Permission denied
[root@localhost ~]# cat /etc/fstab

# /etc/fstab
# Created by anaconda on Sun May 28 16:27:56 2023
# Accessible filesystems, by reference, are maintained under '/dev/disk/'.
# See man pages fstab(5), findfs(8), mount(8) and/or blkid(8) for more info.
# After editing this file, run 'systemctl daemon-reload' to update systemd
# units generated from this file.

/dev/mapper/cs-root     /                       xfs     defaults        0 0
UUID=2ef8d6ad-143a-4fe7-8485-9e6c0eb29c89 /boot                   xfs     defaults        0 0
/dev/mapper/cs-swap     none                    swap    defaults        0 0
[root@localhost ~]# cat /etc/fstab -n
     1	
     2	#
     3	# /etc/fstab
     4	# Created by anaconda on Sun May 28 16:27:56 2023
     5	#
     6	# Accessible filesystems, by reference, are maintained under '/dev/disk/'.
     7	# See man pages fstab(5), findfs(8), mount(8) and/or blkid(8) for more info.
     8	#
     9	# After editing this file, run 'systemctl daemon-reload' to update systemd
    10	# units generated from this file.
    11	#
    12	/dev/mapper/cs-root     /                       xfs     defaults        0 0
    13	UUID=2ef8d6ad-143a-4fe7-8485-9e6c0eb29c89 /boot                   xfs     defaults        0 0
    14	/dev/mapper/cs-swap     none                    swap    defaults        0 0
[root@localhost ~]# UUID="3744ba17-00c9-46f1-8597-3b5e06644a59" /test_disk ext4 defaults 1 2
bash: /test_disk: Is a directory
[root@localhost ~]# vim /etc/fstab
[root@localhost ~]# mount -a
[root@localhost ~]# dd if=/dev/zero of=/test_disk/filetest bs=1G count=0 seek=40
0+0 записей получено
0+0 записей отправлено
0 байт скопировано, 0,000183118 s, 0,0 kB/s
[root@localhost ~]# du -sh
19M	.
[root@localhost ~]# sudo cp -a /home/* /test_disk


2. Создать нового пользователя user_with_group с home-директорией /var/home/user

[root@localhost ~]# adduser user_with_group
[root@localhost ~]# cat /etc/passwd
root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/bin:/sbin/nologin
daemon:x:2:2:daemon:/sbin:/sbin/nologin
adm:x:3:4:adm:/var/adm:/sbin/nologin
lp:x:4:7:lp:/var/spool/lpd:/sbin/nologin
sync:x:5:0:sync:/sbin:/bin/sync
shutdown:x:6:0:shutdown:/sbin:/sbin/shutdown
halt:x:7:0:halt:/sbin:/sbin/halt
mail:x:8:12:mail:/var/spool/mail:/sbin/nologin
operator:x:11:0:operator:/root:/sbin/nologin
games:x:12:100:games:/usr/games:/sbin/nologin
ftp:x:14:50:FTP User:/var/ftp:/sbin/nologin
nobody:x:65534:65534:Kernel Overflow User:/:/sbin/nologin
dbus:x:81:81:System message bus:/:/sbin/nologin
systemd-coredump:x:999:997:systemd Core Dumper:/:/sbin/nologin
systemd-resolve:x:193:193:systemd Resolver:/:/sbin/nologin
tss:x:59:59:Account used for TPM access:/dev/null:/sbin/nologin
polkitd:x:998:996:User for polkitd:/:/sbin/nologin
unbound:x:997:994:Unbound DNS resolver:/etc/unbound:/sbin/nologin
gluster:x:996:993:GlusterFS daemons:/run/gluster:/sbin/nologin
geoclue:x:995:992:User for geoclue:/var/lib/geoclue:/sbin/nologin
rtkit:x:172:172:RealtimeKit:/proc:/sbin/nologin
pipewire:x:994:990:PipeWire System Daemon:/var/run/pipewire:/sbin/nologin
qemu:x:107:107:qemu user:/:/sbin/nologin
apache:x:48:48:Apache:/usr/share/httpd:/sbin/nologin
cockpit-ws:x:993:989:User for cockpit web service:/nonexisting:/sbin/nologin
cockpit-wsinstance:x:992:988:User for cockpit-ws instances:/nonexisting:/sbin/nologin
pulse:x:171:171:PulseAudio System Daemon:/var/run/pulse:/sbin/nologin
named:x:25:25:Named:/var/named:/bin/false
usbmuxd:x:113:113:usbmuxd user:/:/sbin/nologin
postfix:x:89:89::/var/spool/postfix:/sbin/nologin
rpc:x:32:32:Rpcbind Daemon:/var/lib/rpcbind:/sbin/nologin
chrony:x:991:984::/var/lib/chrony:/sbin/nologin
saslauth:x:990:76:Saslauthd user:/run/saslauthd:/sbin/nologin
libstoragemgmt:x:989:982:daemon account for libstoragemgmt:/var/run/lsm:/sbin/nologin
dnsmasq:x:981:981:Dnsmasq DHCP and DNS server:/var/lib/dnsmasq:/sbin/nologin
sssd:x:980:980:User for sssd:/:/sbin/nologin
pegasus:x:66:65:tog-pegasus OpenPegasus WBEM/CIM services:/var/lib/Pegasus:/sbin/nologin
pcp:x:979:979:Performance Co-Pilot:/var/lib/pcp:/sbin/nologin
colord:x:978:978:User for colord:/var/lib/colord:/sbin/nologin
setroubleshoot:x:977:977::/var/lib/setroubleshoot:/sbin/nologin
abrt:x:173:173::/etc/abrt:/sbin/nologin
flatpak:x:976:976:User for flatpak system helper:/:/sbin/nologin
rpcuser:x:29:29:RPC Service User:/var/lib/nfs:/sbin/nologin
clevis:x:975:975:Clevis Decryption Framework unprivileged user:/var/cache/clevis:/sbin/nologin
gdm:x:42:42::/var/lib/gdm:/sbin/nologin
gnome-initial-setup:x:974:973::/run/gnome-initial-setup/:/sbin/nologin
pesign:x:973:972:Group for the pesign signing daemon:/run/pesign:/sbin/nologin
sshd:x:74:74:Privilege-separated SSH:/var/empty/sshd:/sbin/nologin
avahi:x:70:70:Avahi mDNS/DNS-SD Stack:/var/run/avahi-daemon:/sbin/nologin
dovecot:x:97:97:Dovecot IMAP server:/usr/libexec/dovecot:/sbin/nologin
dovenull:x:972:971:Dovecot's unauthorized user:/usr/libexec/dovecot:/sbin/nologin
tcpdump:x:72:72::/:/sbin/nologin
grafana:x:971:970:grafana user account:/usr/share/grafana:/sbin/nologin
Estetiques:x:1000:1000:Eugene Stasiukevich:/home/Estetiques:/bin/bash
vboxadd:x:970:1::/var/run/vboxadd:/bin/false
new_admin_user:x:1001:1001::/home/new_admin_user:/bin/bash
user_with_group:x:1002:1002::/home/user_with_group:/bin/bash
[root@localhost ~]# ls -l /home/user_with_group
итого 0
[root@localhost ~]# tree /home/user_with_group
/home/user_with_group

0 directories, 0 files
[root@localhost ~]# usermod -d /var/home/user_with_group user_with_group
[root@localhost ~]# ls -l /var/home/user_with_group
ls: невозможно получить доступ к '/var/home/user_with_group': No such file or directory
[root@localhost ~]# cat /etc/passwd
root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/bin:/sbin/nologin
daemon:x:2:2:daemon:/sbin:/sbin/nologin
adm:x:3:4:adm:/var/adm:/sbin/nologin
lp:x:4:7:lp:/var/spool/lpd:/sbin/nologin
sync:x:5:0:sync:/sbin:/bin/sync
shutdown:x:6:0:shutdown:/sbin:/sbin/shutdown
halt:x:7:0:halt:/sbin:/sbin/halt
mail:x:8:12:mail:/var/spool/mail:/sbin/nologin
operator:x:11:0:operator:/root:/sbin/nologin
games:x:12:100:games:/usr/games:/sbin/nologin
ftp:x:14:50:FTP User:/var/ftp:/sbin/nologin
nobody:x:65534:65534:Kernel Overflow User:/:/sbin/nologin
dbus:x:81:81:System message bus:/:/sbin/nologin
systemd-coredump:x:999:997:systemd Core Dumper:/:/sbin/nologin
systemd-resolve:x:193:193:systemd Resolver:/:/sbin/nologin
tss:x:59:59:Account used for TPM access:/dev/null:/sbin/nologin
polkitd:x:998:996:User for polkitd:/:/sbin/nologin
unbound:x:997:994:Unbound DNS resolver:/etc/unbound:/sbin/nologin
gluster:x:996:993:GlusterFS daemons:/run/gluster:/sbin/nologin
geoclue:x:995:992:User for geoclue:/var/lib/geoclue:/sbin/nologin
rtkit:x:172:172:RealtimeKit:/proc:/sbin/nologin
pipewire:x:994:990:PipeWire System Daemon:/var/run/pipewire:/sbin/nologin
qemu:x:107:107:qemu user:/:/sbin/nologin
apache:x:48:48:Apache:/usr/share/httpd:/sbin/nologin
cockpit-ws:x:993:989:User for cockpit web service:/nonexisting:/sbin/nologin
cockpit-wsinstance:x:992:988:User for cockpit-ws instances:/nonexisting:/sbin/nologin
pulse:x:171:171:PulseAudio System Daemon:/var/run/pulse:/sbin/nologin
named:x:25:25:Named:/var/named:/bin/false
usbmuxd:x:113:113:usbmuxd user:/:/sbin/nologin
postfix:x:89:89::/var/spool/postfix:/sbin/nologin
rpc:x:32:32:Rpcbind Daemon:/var/lib/rpcbind:/sbin/nologin
chrony:x:991:984::/var/lib/chrony:/sbin/nologin
saslauth:x:990:76:Saslauthd user:/run/saslauthd:/sbin/nologin
libstoragemgmt:x:989:982:daemon account for libstoragemgmt:/var/run/lsm:/sbin/nologin
dnsmasq:x:981:981:Dnsmasq DHCP and DNS server:/var/lib/dnsmasq:/sbin/nologin
sssd:x:980:980:User for sssd:/:/sbin/nologin
pegasus:x:66:65:tog-pegasus OpenPegasus WBEM/CIM services:/var/lib/Pegasus:/sbin/nologin
pcp:x:979:979:Performance Co-Pilot:/var/lib/pcp:/sbin/nologin
colord:x:978:978:User for colord:/var/lib/colord:/sbin/nologin
setroubleshoot:x:977:977::/var/lib/setroubleshoot:/sbin/nologin
abrt:x:173:173::/etc/abrt:/sbin/nologin
flatpak:x:976:976:User for flatpak system helper:/:/sbin/nologin
rpcuser:x:29:29:RPC Service User:/var/lib/nfs:/sbin/nologin
clevis:x:975:975:Clevis Decryption Framework unprivileged user:/var/cache/clevis:/sbin/nologin
gdm:x:42:42::/var/lib/gdm:/sbin/nologin
gnome-initial-setup:x:974:973::/run/gnome-initial-setup/:/sbin/nologin
pesign:x:973:972:Group for the pesign signing daemon:/run/pesign:/sbin/nologin
sshd:x:74:74:Privilege-separated SSH:/var/empty/sshd:/sbin/nologin
avahi:x:70:70:Avahi mDNS/DNS-SD Stack:/var/run/avahi-daemon:/sbin/nologin
dovecot:x:97:97:Dovecot IMAP server:/usr/libexec/dovecot:/sbin/nologin
dovenull:x:972:971:Dovecot's unauthorized user:/usr/libexec/dovecot:/sbin/nologin
tcpdump:x:72:72::/:/sbin/nologin
grafana:x:971:970:grafana user account:/usr/share/grafana:/sbin/nologin
Estetiques:x:1000:1000:Eugene Stasiukevich:/home/Estetiques:/bin/bash
vboxadd:x:970:1::/var/run/vboxadd:/bin/false
new_admin_user:x:1001:1001::/home/new_admin_user:/bin/bash
user_with_group:x:1002:1002::/var/home/user_with_group:/bin/bash
[root@localhost ~]# cat /var/home/user_with_group
cat: /var/home/user_with_group: No such file or directory
[root@localhost ~]# usermod -md /var/home/user_with_group user_with_group
usermod: изменения не внесены
[root@localhost ~]# ls -l /var/home/user_with_group
ls: невозможно получить доступ к '/var/home/user_with_group': No such file or directory
[root@localhost ~]# /var# mkdir -v home
bash: /var#: No such file or directory
[root@localhost ~]# /var mkdir -v home
bash: /var: Is a directory
[root@localhost ~]# cat /var
cat: /var: Is a directory
[root@localhost ~]# cd /var 
[root@localhost var]# mkdir -v home
mkdir: создан каталог 'home'
[root@localhost var]# cd /var/home
[root@localhost home]# mkdir -v iser_with_group
mkdir: создан каталог 'iser_with_group'
[root@localhost home]# mkdir -v user_with_group
mkdir: создан каталог 'user_with_group'
[root@localhost home]# ls -l /var/home/user_with_group
итого 0



3. Создать новую группу пользователей priv_group, перенести в нее пользователя user_with_group
 
  
  [root@localhost ~]# groupadd priv_group
[root@localhost ~]# cat /etc/group
root:x:0:
bin:x:1:
daemon:x:2:
sys:x:3:
adm:x:4:
tty:x:5:
disk:x:6:
lp:x:7:
mem:x:8:
kmem:x:9:
wheel:x:10:new_admin_user,Estetiques
cdrom:x:11:
mail:x:12:postfix
man:x:15:
dialout:x:18:
floppy:x:19:
games:x:20:
tape:x:33:
video:x:39:
ftp:x:50:
lock:x:54:
audio:x:63:
users:x:100:
nobody:x:65534:
dbus:x:81:
utmp:x:22:
utempter:x:35:
input:x:999:
kvm:x:36:qemu
render:x:998:
systemd-journal:x:190:
systemd-coredump:x:997:
systemd-resolve:x:193:
tss:x:59:clevis
polkitd:x:996:
printadmin:x:995:
unbound:x:994:
gluster:x:993:
geoclue:x:992:
ssh_keys:x:991:
rtkit:x:172:
pipewire:x:990:
qemu:x:107:
apache:x:48:
cockpit-ws:x:989:
cockpit-wsinstance:x:988:
pulse-access:x:987:
pulse-rt:x:986:
pulse:x:171:
named:x:25:
usbmuxd:x:113:
brlapi:x:985:
postdrop:x:90:
postfix:x:89:
rpc:x:32:
chrony:x:984:
saslauth:x:76:
cgred:x:983:
libstoragemgmt:x:982:
dnsmasq:x:981:
sssd:x:980:
pegasus:x:65:
pcp:x:979:
stapusr:x:156:
stapsys:x:157:
stapdev:x:158:
colord:x:978:
setroubleshoot:x:977:
abrt:x:173:
flatpak:x:976:
rpcuser:x:29:
clevis:x:975:
gdm:x:42:
libvirt:x:974:
gnome-initial-setup:x:973:
pesign:x:972:
sshd:x:74:
avahi:x:70:
slocate:x:21:
dovecot:x:97:
dovenull:x:971:
tcpdump:x:72:
grafana:x:970:
Estetiques:x:1000:
vboxsf:x:969:
new_admin_user:x:1001:
user_with_group:x:1002:
priv_group:x:1003:
[root@localhost ~]# usermod -a -G priv_group user_with_group
[root@localhost ~]# usermod -g priv_group user_with_group
[root@localhost ~]# groups user_with_group
user_with_group : priv_group

4. Cоздать директорию и выдать права на нее только группе это пользователя
  [root@localhost ~]# cd /test_disk
[root@localhost test_disk]# mkdir -v policy_folder
mkdir: создан каталог 'policy_folder'
[root@localhost test_disk]# cd ~
[root@localhost ~]# chgrp priv_group policy_folder
chgrp: невозможно получить доступ к 'policy_folder': No such file or directory
[root@localhost ~]# cd /test_disk
[root@localhost test_disk]# cd /policy_folder
bash: cd: /policy_folder: No such file or directory
[root@localhost test_disk]# chgrp priv_group /test_disk/policy_folder
[root@localhost test_disk]# ls -l
итого 28
drwx------. 16 Estetiques     Estetiques            4096 июл  9 16:16 Estetiques
-rw-r--r--.  1 root           root           42949672960 июл 10 19:29 filetest
drwx------.  2 root           root                 16384 июл 10 19:10 lost+found
drwx------. 15 new_admin_user new_admin_user        4096 июл  9 16:18 new_admin_user
drwxr-xr-x.  2 root           priv_group            4096 июл 10 20:38 policy_folder


5. Установить ntpd(chrony), разрешить пользователю user_with_group выполнять команду 
  [root@localhost ~]# yum install chrony
Последняя проверка окончания срока действия метаданных: 1:31:14 назад, Пн 10 июл 2023 19:20:16.
Пакет chrony-4.2-1.el8.x86_64 уже установлен.
Зависимости разрешены.
Отсутствуют действия для выполнения
Выполнено!
[root@localhost ~]# cat /etc/chrony.conf
# Use public servers from the pool.ntp.org project.
# Please consider joining the pool (http://www.pool.ntp.org/join.html).
pool 2.centos.pool.ntp.org iburst
# Record the rate at which the system clock gains/losses time.
driftfile /var/lib/chrony/drift
# Allow the system clock to be stepped in the first three updates
# if its offset is larger than 1 second.
makestep 1.0 3
# Enable kernel synchronization of the real-time clock (RTC).
rtcsync
# Enable hardware timestamping on all interfaces that support it.
#hwtimestamp *
# Increase the minimum number of selectable sources required to adjust
# the system clock.
#minsources 2
# Allow NTP client access from local network.
#allow 192.168.0.0/16
# Serve time even if not synchronized to a time source.
#local stratum 10
# Specify file containing keys for NTP authentication.
keyfile /etc/chrony.keys
# Get TAI-UTC offset and leap seconds from the system tz database.
leapsectz right/UTC
# Specify directory for log files.
logdir /var/log/chrony
# Select which information is logged.
#log measurements statistics tracking
[root@localhost ~]# sudo visudo
[root@localhost ~]# su user_with_group
bash-4.4$ exit
exit
[root@localhost ~]# sudo visudo
[root@localhost ~]# su user_with_group
bash-4.4$ systemctl restart chronyd
Failed to restart chronyd.service: Access denied
See system logs and 'systemctl status chronyd.service' for details.
bash-4.4$ exit
exit
[root@localhost ~]# sudo passwd user_with_group
Изменение пароля пользователя user_with_group.
Новый пароль : 
НЕУДАЧНЫЙ ПАРОЛЬ: Пароль не прошел проверку орфографии - на основе слова из словаря
Повторите ввод нового пароля : 
passwd: данные аутентификации успешно обновлены.
[root@localhost ~]# su user_with_group
bash-4.4$ systemctl restart chronyd


6. Вывод команды iostat -x в последней колонке показывает загрузку дисков в процентах. Откуда утилита это понимает?
 Достаточно ли вывода команды iostat -x для того, чтобы оценить реальную нагрузку на диски,  или нужны дополнительные условия или ключи?

  %util считается как процентное отношение к Ticks, deltams. 
busy = 100.0 * blkio.ticks / deltams; /* percentage! */
if (busy > 100.0) busy = 100.0;
DeltaMS представляет собой сумму нагрузки на систему за период времени (время пользователя + системное время + время простоя + iowait)/ncpu.

double deltams = 1000.0 *
        ((new_cpu.user + new_cpu.system +
          new_cpu.idle + new_cpu.iowait) -
         (old_cpu.user + old_cpu.system +
          old_cpu.idle + old_cpu.iowait)) / ncpu / HZ;
Тики - это Time of requests in queueза период

blkio.ticks = new_blkio[p].ticks
                - old_blkio[p].ticks;
   

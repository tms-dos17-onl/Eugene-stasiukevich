## 1. Вывести в консоль список всех пользователей системы.
```
[root@localhost ~]# getent passwd | awk -F: '{ print $1}'
root
bin
daemon
adm
lp
sync
shutdown
halt
mail
operator
games
ftp
nobody
dbus
systemd-coredump
systemd-resolve
tss
polkitd
unbound
gluster
geoclue
rtkit
pipewire
qemu
apache
cockpit-ws
cockpit-wsinstance
pulse
named
usbmuxd
postfix
rpc
chrony
saslauth
libstoragemgmt
dnsmasq
sssd
pegasus
pcp
colord
setroubleshoot
abrt
flatpak
rpcuser
clevis
gdm
gnome-initial-setup
pesign
sshd
avahi
dovecot
dovenull
tcpdump
grafana
Estetiques
vboxadd
new_admin_user
user_with_group
testuser
```
## 2. Найти и вывести в консоль домашние каталоги для текущего пользователя и root.
```
[root@localhost ~]# pwd
/root

[root@localhost ~]# cd ~Estetiques
[root@localhost Estetiques]# pwd
/home/Estetiques
```
## 3. Создать Bash скрипт get-date.sh, выводящий текущую дату.
```
#!/bin/bash
echo "Hello, $USER!"
echo "Today is $(date)"
```
## 4. Запустить скрипт через ./get-date.sh и bash get-date.sh. Какой вариант не работает? Сделать так, чтобы оба варианта работали.
```
[root@localhost Estetiques]# ./get-date.sh
Hello, root!
Today is Чт авг 17 22:10:03 +03 2023


[root@localhost Estetiques]# bash get-date.sh
Hello, root!
Today is Чт авг 17 22:12:38 +03 2023
```
## 5. Создать пользователей alice и bob с домашними директориями и установить /bin/bash в качестве командной оболочки по умолчанию.
```
[root@localhost Estetiques]# cat /etc/passwd | grep alice
alice:x:1004:1005::/home/alice:/bin/bash

[root@localhost Estetiques]# cat /etc/passwd | grep bob
bob:x:1005:1006::/home/bob:/bin/bash
```
## 6. Запустить интерактивную сессию от пользователя alice. Создать файл secret.txt с каким-нибудь секретом в домашней директории при помощи текстового редактора nano.
```
C:\Users\User>ssh alice@192.168.100.97
alice@192.168.100.97's password:
########################
Welcome to DOS17-Smile##
########################
Activate the web console with: systemctl enable --now cockpit.socket

[alice@localhost ~]$ touch secret
[alice@localhost ~]$ nano secret
```
## 7. Вывести права доступа к файлу secret.txt.
```
[alice@localhost ~]$ ls -l secret.txt
-rw-rw-r--. 1 alice alice 21 Aug 17 22:26 secret.txt
```
## 8. Выйти из сессии от alice и открыть сессию от bob. Вывести содержимое файла /home/alice/secret.txt созданного ранее не прибегая к команде sudo. В случае, если это не работает, объяснить.
```
[bob@localhost ~]$ cat /home/alice/secret.txt
cat: /home/alice/secret.txt: Permission denied
```
## 9. Создать файл secret.txt с каким-нибудь секретом в каталоге /tmp при помощи текстового редактора nano.
```
[bob@localhost ~]$ cd /tmp
[bob@localhost tmp]$ touch secret.txt
[bob@localhost tmp]$ nano secret.txt
```
## 10. Вывести права доступа к файлу secret.txt. Поменять права таким образом, чтобы этот файл могли читать только владелец и члены группы, привязанной к файлу.
```
[bob@localhost tmp]$ ls -l secret.txt
-rw-rw-r--. 1 bob bob 20 Aug 17 22:37 secret.txt

[bob@localhost tmp]$ chmod 440 /tmp/secret.txt
[bob@localhost tmp]$ ls -l secret.txt
-r--r-----. 1 bob bob 20 Aug 17 22:37 secret.txt
```
## 11. Выйти из сессии от bob и открыть сессию от alice. Вывести содержимое файла /tmp/secret.txt созданного ранее не прибегая к команде sudo. В случае, если это не работает, объяснить.
```

```
## 12. Добавить пользователя alice в группу, привязанную к файлу /tmp/secret.txt.
```
[root@localhost ~]# usermod -a -G bob alice
[root@localhost ~]# su alice
```
## 13. Вывести содержимое файла /tmp/secret.txt.
```
[alice@localhost root]$ cat /tmp/secret.txt
beware of humanoids
```
## 14. Скопировать домашнюю директорию пользователя alice в директорию /tmp/alice с помощью rsync.
```
[root@localhost ~]# rsync -avP /home/alice/ /tmp/alice/
sending incremental file list
created directory /tmp/alice
./
.bash_history
             53 100%    0.00kB/s    0:00:00 (xfr#1, to-chk=18/20)
.bash_logout
             18 100%   17.58kB/s    0:00:00 (xfr#2, to-chk=17/20)
.bash_profile
            141 100%  137.70kB/s    0:00:00 (xfr#3, to-chk=16/20)
.bashrc
            376 100%  367.19kB/s    0:00:00 (xfr#4, to-chk=15/20)
.esd_auth
             16 100%   15.62kB/s    0:00:00 (xfr#5, to-chk=14/20)
.zshrc
            658 100%  642.58kB/s    0:00:00 (xfr#6, to-chk=13/20)
secret
              0 100%    0.00kB/s    0:00:00 (xfr#7, to-chk=12/20)
secret.txt
             21 100%   20.51kB/s    0:00:00 (xfr#8, to-chk=11/20)
.config/
.config/pulse/
.config/pulse/bca86d53552245ccb6e1c8ab6b40f3f7-card-database.tdb
            696 100%  679.69kB/s    0:00:00 (xfr#9, to-chk=7/20)
.config/pulse/bca86d53552245ccb6e1c8ab6b40f3f7-default-sink
              1 100%    0.98kB/s    0:00:00 (xfr#10, to-chk=6/20)
.config/pulse/bca86d53552245ccb6e1c8ab6b40f3f7-default-source
              1 100%    0.98kB/s    0:00:00 (xfr#11, to-chk=5/20)
.config/pulse/bca86d53552245ccb6e1c8ab6b40f3f7-device-volumes.tdb
          8,192 100%    7.81MB/s    0:00:00 (xfr#12, to-chk=4/20)
.config/pulse/bca86d53552245ccb6e1c8ab6b40f3f7-stream-volumes.tdb
            696 100%  679.69kB/s    0:00:00 (xfr#13, to-chk=3/20)
.config/pulse/cookie
            256 100%  250.00kB/s    0:00:00 (xfr#14, to-chk=2/20)
.mozilla/
.mozilla/extensions/
.mozilla/plugins/

sent 12,357 bytes  received 342 bytes  25,398.00 bytes/sec
total size is 11,125  speedup is 0.88
```
## 15. Скопировать домашнюю директорию пользователя alice в директорию /tmp/alice на другую VM по SSH с помощью rsync. Как альтернатива, можно скопировать любую папку с хоста на VM по SSH.
```
[root@localhost ~]# scp -r /home/alice estetiques@192.168.100.100:/tmp/alice
estetiques@192.168.100.100's password: 
.bash_logout                                                                           100%   18    20.0KB/s   00:00    
.bash_profile                                                                          100%  141   262.1KB/s   00:00    
.bashrc                                                                                100%  376     1.2MB/s   00:00    
.zshrc                                                                                 100%  658     1.9MB/s   00:00    
bca86d53552245ccb6e1c8ab6b40f3f7-device-volumes.tdb                                    100% 8192    20.9MB/s   00:00    
bca86d53552245ccb6e1c8ab6b40f3f7-stream-volumes.tdb                                    100%  696     2.2MB/s   00:00    
bca86d53552245ccb6e1c8ab6b40f3f7-card-database.tdb                                     100%  696     2.4MB/s   00:00    
cookie                                                                                 100%  256   924.1KB/s   00:00    
bca86d53552245ccb6e1c8ab6b40f3f7-default-sink                                          100%    1     3.7KB/s   00:00    
bca86d53552245ccb6e1c8ab6b40f3f7-default-source                                        100%    1     4.0KB/s   00:00    
.esd_auth                                                                              100%   16    62.6KB/s   00:00    
secret                                                                                 100%    0     0.0KB/s   00:00    
secret.txt                                                                             100%   21    81.5KB/s   00:00    
.bash_history
```
## 16. Удалить пользователей alice и bob вместе с домашними директориями.
```
[root@localhost ~]# userdel -f -r alice
[root@localhost ~]# userdel -f -r bob
```
## 17. С помощью утилиты htop определить какой процесс потребляет больше всего ресурсов в системе.
```
[root@localhost ~]# ps -eo pid,ppid,cmd,%mem --sort=-%mem | head
    PID    PPID CMD                         %MEM
   4903    4472 /usr/lib64/firefox/firefox  15.0
   4472    4380 /usr/bin/gnome-shell         7.5
  85223    4903 /usr/lib64/firefox/firefox   6.0
  15636    4903 /usr/lib64/firefox/firefox   4.8
 111534    4903 /usr/lib64/firefox/firefox   4.8
  94198    4903 /usr/lib64/firefox/firefox   4.7
 116610    4903 /usr/lib64/firefox/firefox   4.7
   5947    4903 /usr/lib64/firefox/firefox   4.7
 116590    4903 /usr/lib64/firefox/firefox   4.5
```
## 18. Вывести логи сервиса Firewall с помощью journalctl не прибегая к фильтрации с помощью grep.
```
evilsmile@Evilsmile:~$ journalctl -u ufw.service
мар 20 16:32:24 Evilsmile systemd[1]: Starting Uncomplicated firewall...
мар 20 16:32:24 Evilsmile systemd[1]: Finished Uncomplicated firewall.
-- Boot 96c489a8c39a4d6b9d285075a4a7e389 --
мар 20 16:32:25 Evilsmile systemd[1]: Starting Uncomplicated firewall...
-- Boot 00f51b26fb5e43c798588d9db37e00cd --
ноя 09 20:01:42 Evilsmile systemd[1]: Starting Uncomplicated firewall...
ноя 09 20:01:42 Evilsmile systemd[1]: Finished Uncomplicated firewall.
-- Boot 96c489a8c39a4d6b9d285075a4a7e389 --
ноя 09 20:49:55 Evilsmile systemd[1]: Finished Uncomplicated firewall.
```


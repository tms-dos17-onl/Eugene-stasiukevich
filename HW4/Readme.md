HW4

1. Отобразить все процессы в системе


    [root@localhost ~]# ps -a

        PID TTY          TIME CMD
      
       5225 tty2     00:00:00 gnome-session-b
       5325 tty2     00:03:29 gnome-shell
       5371 tty2     00:00:37 Xwayland
       5396 tty2     00:00:00 ibus-daemon
       5400 tty2     00:00:00 ibus-dconf
       5401 tty2     00:00:00 ibus-extension-
       5409 tty2     00:00:00 ibus-x11
       5483 tty2     00:00:00 gsd-power
       5484 tty2     00:00:00 gsd-print-notif
       5486 tty2     00:00:00 gsd-rfkill
       5487 tty2     00:00:00 gsd-screensaver
       5490 tty2     00:00:00 gsd-sharing
       5493 tty2     00:00:00 gsd-smartcard
       5495 tty2     00:00:00 gsd-sound
       5499 tty2     00:00:00 gsd-xsettings
       5512 tty2     00:00:00 gsd-wacom
       5525 tty2     00:00:00 ibus-engine-sim
       5529 tty2     00:00:00 gsd-account
       5533 tty2     00:00:00 gsd-a11y-settin
       5538 tty2     00:00:00 gsd-clipboard
       5539 tty2     00:00:00 gsd-color
       5540 tty2     00:00:00 gsd-datetime
       5541 tty2     00:00:00 gsd-housekeepin
       5542 tty2     00:00:00 gsd-keyboard
       5546 tty2     00:00:00 gsd-media-keys
       5549 tty2     00:00:00 gsd-mouse
       5565 tty2     00:00:00 gsd-printer
       5614 tty2     00:00:02 gnome-software
       5620 tty2     00:00:00 tracker-miner-f
       5636 tty2     00:00:00 tracker-miner-a
       5671 tty2     00:00:00 gsd-disk-utilit
       5822 tty2     00:04:11 firefox
       6015 tty2     00:00:00 Socket Process
       6070 tty2     00:00:00 Privileged Cont
       6107 tty2     00:00:00 WebExtensions
       6168 tty2     00:00:16 Isolated Web Co
       6190 tty2     00:00:58 Isolated Web Co
       6256 tty2     00:00:00 Isolated Servic
       6387 tty2     00:00:12 Isolated Web Co
       6418 tty2     00:00:01 Isolated Web Co
       6421 tty2     00:00:00 Web Content
       6451 tty2     00:00:00 RDD Process
       7880 tty2     00:00:00 Utility Process
       8650 tty2     00:00:00 Web Content
       9198 tty2     00:00:00 Web Content
       9364 pts/0    00:00:00 ps

2. Запустить бесконечный процесс в фоновом режиме

   [root@localhost ~]# ./endless.sh > output.txt  &

        [2] 17739

   [root@localhost ~]# jobs
   
        [1]+  Запущен          ./endless.sh > output.txt &


3. Убедиться, что процесс продолжил работу после завершения сессии

   [root@localhost ~]# ps aux

       root       19630  0.1  0.0 222664  3232 pts/0    S    19:32   0:00 /bin/bash ./endless.sh

4. Убить процесс, запущенный в фоновом режиме

   [root@localhost ~]# kill 19630
   
       [1]+  Terminated              ./endless.sh > output.txt

5. Написать свой сервис под управлением systemd, добавить его в автозагрузку (можно использовать процесс из п.2)

  [root@localhost ~]# systemctl status endless.service
  
      ● endless.service - Service test
  
     Loaded: loaded (/etc/systemd/system/endless.service; enabled; vendor preset:>
     Active: failed (Result: exit-code) since Mon 2023-07-31 20:29:41 +03; 16min >
     Process: 1014 ExecStart=/tmp/endless.sh (code=exited, status=203/EXEC)
     Main PID: 1014 (code=exited, status=203/EXEC)

    июл 31 20:29:40 localhost.localdomain systemd[1]: Started Service test.
    июл 31 20:29:41 localhost.localdomain systemd[1]: endless.service: Main process>
    июл 31 20:29:41 localhost.localdomain systemd[1]: endless.service: Failed with >
    lines 1-9/9 (END)


6. Посмотреть логи своего сервиса.

   [root@localhost ~]# journalctl -eu endless.service

        -- Logs begin at Mon 2023-07-31 20:29:14 +03, end at Mon 2023-07-31 21:02:11 +03. --
       июл 31 20:29:40 localhost.localdomain systemd[1]: Started Service test.
       июл 31 20:29:41 localhost.localdomain systemd[1]: endless.service: Main process exited, code=exited, status=203/EXEC
       июл 31 20:29:41 localhost.localdomain systemd[1]: endless.service: Failed with result 'exit-code'.

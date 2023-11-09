## 1. Прочитать статью.
## 2. Установить Jenkins.
```
evilsmile@Evilsmile:~$ sudo systemctl status jenkins
[sudo] пароль для evilsmile: 
● jenkins.service - Jenkins Continuous Integration Server
     Loaded: loaded (/lib/systemd/system/jenkins.service; enabled; vendor prese>
     Active: active (running) since Thu 2023-11-09 18:57:19 EET; 23min ago
   Main PID: 14573 (java)
      Tasks: 50 (limit: 9301)
     Memory: 2.2G
        CPU: 7min 10.201s
     CGroup: /system.slice/jenkins.service
             └─14573 /usr/bin/java -Djava.awt.headless=true -jar /usr/share/jav>
```
## 3. Создать свой первый pipeline по инструкции "Through the classic UI"
![image](https://github.com/tms-dos17-onl/Eugene-stasiukevich/assets/100120414/99ffd8ee-b37d-40ac-8d2e-9e67f1929462)


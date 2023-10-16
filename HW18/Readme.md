## 1. Установить Docker на хостовую ОС. В случае с Windows использовать WSL backend.
```
```
## 2. Убедиться, что Docker работает исправно путем запуска контейнера hello-world.
```
PS H:\DevOps> docker run hello-world

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/
```
## 3. Установить Nginx используя Docker образ
  ```
  PS H:\DevOps> docker pull nginx
  Using default tag: latest
  latest: Pulling from library/nginx
  a378f10b3218: Pull complete
  4dfff0708538: Pull complete
  2135e49ace4b: Pull complete
  c843f6b280ce: Pull complete
  6f35ab6f1400: Pull complete
  6c538b49fa4a: Pull complete
  d57731fb9008: Pull complete
  Digest: sha256:b4af4f8b6470febf45dc10f564551af682a802eda1743055a7dfc8332dffa595
  Status: Downloaded newer image for nginx:latest
  docker.io/library/nginx:latest

  What's Next?
    View a summary of image vulnerabilities and recommendations → docker scout quickview nginx
  PS H:\DevOps> docker run -dit --rm --name nginx -p 9001:80 nginx
  93de863bc0aad814e8d0c3905e746f9d6e41c6338365118f83344ab6cedaefce
  ```
## 4. Изучить следующие команды и их флаги:
- docker run (-i, -t, -d, --rm)
- docker ps (-a, -l, -q)
- docker images
- docker start/docker stop/docker restart
- docker exec
  ```
  - docker run:
  -i - Держит STDIN открытым, даже если он не подключен.
  -t - Выделение псевдо-TTY
  -d - Запускает контейнер в фоне и выводит его ID
  -rm - Автоматически удаляет контейнер при выходе
  - docker ps:
  -a - Показать все контейнеры
  -l - Показать последний созданный контейнер
  -q - Показывать только ID контейнеров
  - docker images - Показывает Docker образы 
  - docker start/docker stop/docker restart - Запускает/останавливает/перезапускает один или несколько контейнеров
  - docker exec - Bспользуется для выполнения команды в запущенном контейнере.
 ```
## 5. Установить Nexus используя Docker образ
 ```
 ```
## 6. Установить Jenkins используя Docker образ
 ```

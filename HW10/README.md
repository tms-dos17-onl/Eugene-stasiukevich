## 1. Создать Bash скрипт print-value.sh, выводящий значение переменной $VALUE в консоль. Выполнить скрипт 3 раза, передавая каждый раз значение этой переменной разным способом.
```
evilsmile@Evilsmile:~$ ./print-value.sh HELLO
HELLO
evilsmile@Evilsmile:~$ ./print-value.sh
Value was not set
evilsmile@Evilsmile:~$ VALUE=STUDY ./print-value.sh
STUDY
evilsmile@Evilsmile:~$ 
```
## 2. Создать Shell скрипт check-parity-shell.sh, который принимает число в качестве первого аргумента командной строки, и для чётного числа выводит в консоль строку "чётное", а для нечётного - "нечётное". В случае, если переданный аргумент не является числом, вывести соответствующее сообщение и завершить скрипт с кодом 1.
```

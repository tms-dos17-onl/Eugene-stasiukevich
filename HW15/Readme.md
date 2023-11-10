## 1. Установить MySQL на VM.
```
evilsmile@DESKTOP-R7EM63B:~$ sudo apt install mysql-server
[sudo] password for evilsmile: 
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following additional packages will be installed:
  libaio1 libcgi-fast-perl libcgi-pm-perl libclone-perl libencode-locale-perl libevent-pthreads-2.1-7 libfcgi-bin libfcgi-perl libfcgi0ldbl
  libhtml-parser-perl libhtml-tagset-perl libhtml-template-perl libhttp-date-perl libhttp-message-perl libio-html-perl liblwp-mediatypes-perl libmecab2
  libprotobuf-lite23 libtimedate-perl liburi-perl mecab-ipadic mecab-ipadic-utf8 mecab-utils mysql-client-8.0 mysql-client-core-8.0 mysql-common
  mysql-server-8.0 mysql-server-core-8.0
Suggested packages:
  libdata-dump-perl libipc-sharedcache-perl libbusiness-isbn-perl libwww-perl mailx tinyca
The following NEW packages will be installed:
  libaio1 libcgi-fast-perl libcgi-pm-perl libclone-perl libencode-locale-perl libevent-pthreads-2.1-7 libfcgi-bin libfcgi-perl libfcgi0ldbl
  libhtml-parser-perl libhtml-tagset-perl libhtml-template-perl libhttp-date-perl libhttp-message-perl libio-html-perl liblwp-mediatypes-perl libmecab2
  libprotobuf-lite23 libtimedate-perl liburi-perl mecab-ipadic mecab-ipadic-utf8 mecab-utils mysql-client-8.0 mysql-client-core-8.0 mysql-common
  mysql-server mysql-server-8.0 mysql-server-core-8.0
0 upgraded, 29 newly installed, 0 to remove and 101 not upgraded.
Need to get 29.6 MB of archives.
After this operation, 243 MB of additional disk space will be used.
Do you want to continue? [Y/n] y
Get:1 http://archive.ubuntu.com/ubuntu jammy/main amd64 mysql-common all 5.8+1.0.8 [7212 B]
Get:2 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 mysql-client-core-8.0 amd64 8.0.34-0ubuntu0.22.04.1 [2754 kB]
Get:3 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 mysql-client-8.0 amd64 8.0.34-0ubuntu0.22.04.1 [22.7 kB]
Get:4 http://archive.ubuntu.com/ubuntu jammy/main amd64 libaio1 amd64 0.3.112-13build1 [7176 B]
Get:5 http://archive.ubuntu.com/ubuntu jammy/main amd64 libevent-pthreads-2.1-7 amd64 2.1.12-stable-1build3 [7642 B]
Get:6 http://archive.ubuntu.com/ubuntu jammy/main amd64 libmecab2 amd64 0.996-14build9 [199 kB]
Get:7 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libprotobuf-lite23 amd64 3.12.4-1ubuntu7.22.04.1 [209 kB]
Get:8 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 mysql-server-core-8.0 amd64 8.0.34-0ubuntu0.22.04.1 [17.5 MB]
Get:9 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 mysql-server-8.0 amd64 8.0.34-0ubuntu0.22.04.1 [1437 kB]
Get:10 http://archive.ubuntu.com/ubuntu jammy/main amd64 libhtml-tagset-perl all 3.20-4 [12.5 kB]
Get:11 http://archive.ubuntu.com/ubuntu jammy/main amd64 liburi-perl all 5.10-1 [78.8 kB]
Get:12 http://archive.ubuntu.com/ubuntu jammy/main amd64 libhtml-parser-perl amd64 3.76-1build2 [88.4 kB]
Get:13 http://archive.ubuntu.com/ubuntu jammy/main amd64 libcgi-pm-perl all 4.54-1 [188 kB]
Get:14 http://archive.ubuntu.com/ubuntu jammy/main amd64 libfcgi0ldbl amd64 2.4.2-2build2 [28.0 kB]
Get:15 http://archive.ubuntu.com/ubuntu jammy/main amd64 libfcgi-perl amd64 0.82+ds-1build1 [22.8 kB]
Get:16 http://archive.ubuntu.com/ubuntu jammy/main amd64 libcgi-fast-perl all 1:2.15-1 [10.5 kB]
Get:17 http://archive.ubuntu.com/ubuntu jammy/main amd64 libclone-perl amd64 0.45-1build3 [11.0 kB]
Get:18 http://archive.ubuntu.com/ubuntu jammy/main amd64 libencode-locale-perl all 1.05-1.1 [11.8 kB]
Get:19 http://archive.ubuntu.com/ubuntu jammy/main amd64 libfcgi-bin amd64 2.4.2-2build2 [11.2 kB]
Get:20 http://archive.ubuntu.com/ubuntu jammy/main amd64 libhtml-template-perl all 2.97-1.1 [59.1 kB]
Get:21 http://archive.ubuntu.com/ubuntu jammy/main amd64 libtimedate-perl all 2.3300-2 [34.0 kB]
Get:22 http://archive.ubuntu.com/ubuntu jammy/main amd64 libhttp-date-perl all 6.05-1 [9920 B]
Get:23 http://archive.ubuntu.com/ubuntu jammy/main amd64 libio-html-perl all 1.004-2 [15.4 kB]
Get:24 http://archive.ubuntu.com/ubuntu jammy/main amd64 liblwp-mediatypes-perl all 6.04-1 [19.5 kB]
Get:25 http://archive.ubuntu.com/ubuntu jammy/main amd64 libhttp-message-perl all 6.36-1 [76.8 kB]
Get:26 http://archive.ubuntu.com/ubuntu jammy/main amd64 mecab-utils amd64 0.996-14build9 [4850 B]
Get:27 http://archive.ubuntu.com/ubuntu jammy/main amd64 mecab-ipadic all 2.7.0-20070801+main-3 [6718 kB]
Get:28 http://archive.ubuntu.com/ubuntu jammy/main amd64 mecab-ipadic-utf8 all 2.7.0-20070801+main-3 [4384 B]
Get:29 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 mysql-server all 8.0.34-0ubuntu0.22.04.1 [9460 B]
Fetched 29.6 MB in 5s (5877 kB/s)       
Preconfiguring packages ...
Selecting previously unselected package mysql-common.
(Reading database ... 50211 files and directories currently installed.)
Preparing to unpack .../0-mysql-common_5.8+1.0.8_all.deb ...
Unpacking mysql-common (5.8+1.0.8) ...
Selecting previously unselected package mysql-client-core-8.0.
Preparing to unpack .../1-mysql-client-core-8.0_8.0.34-0ubuntu0.22.04.1_amd64.deb ...
Unpacking mysql-client-core-8.0 (8.0.34-0ubuntu0.22.04.1) ...
Selecting previously unselected package mysql-client-8.0.
Preparing to unpack .../2-mysql-client-8.0_8.0.34-0ubuntu0.22.04.1_amd64.deb ...
Unpacking mysql-client-8.0 (8.0.34-0ubuntu0.22.04.1) ...
Selecting previously unselected package libaio1:amd64.
Preparing to unpack .../3-libaio1_0.3.112-13build1_amd64.deb ...
Unpacking libaio1:amd64 (0.3.112-13build1) ...
Selecting previously unselected package libevent-pthreads-2.1-7:amd64.
Preparing to unpack .../4-libevent-pthreads-2.1-7_2.1.12-stable-1build3_amd64.deb ...
Unpacking libevent-pthreads-2.1-7:amd64 (2.1.12-stable-1build3) ...
Selecting previously unselected package libmecab2:amd64.
Preparing to unpack .../5-libmecab2_0.996-14build9_amd64.deb ...
Unpacking libmecab2:amd64 (0.996-14build9) ...
Selecting previously unselected package libprotobuf-lite23:amd64.
Preparing to unpack .../6-libprotobuf-lite23_3.12.4-1ubuntu7.22.04.1_amd64.deb ...
Unpacking libprotobuf-lite23:amd64 (3.12.4-1ubuntu7.22.04.1) ...
Selecting previously unselected package mysql-server-core-8.0.
Preparing to unpack .../7-mysql-server-core-8.0_8.0.34-0ubuntu0.22.04.1_amd64.deb ...
Unpacking mysql-server-core-8.0 (8.0.34-0ubuntu0.22.04.1) ...
Setting up mysql-common (5.8+1.0.8) ...
update-alternatives: using /etc/mysql/my.cnf.fallback to provide /etc/mysql/my.cnf (my.cnf) in auto mode
Selecting previously unselected package mysql-server-8.0.
(Reading database ... 50430 files and directories currently installed.)
Preparing to unpack .../00-mysql-server-8.0_8.0.34-0ubuntu0.22.04.1_amd64.deb ...
Unpacking mysql-server-8.0 (8.0.34-0ubuntu0.22.04.1) ...
Selecting previously unselected package libhtml-tagset-perl.
Preparing to unpack .../01-libhtml-tagset-perl_3.20-4_all.deb ...
Unpacking libhtml-tagset-perl (3.20-4) ...
Selecting previously unselected package liburi-perl.
Preparing to unpack .../02-liburi-perl_5.10-1_all.deb ...
Unpacking liburi-perl (5.10-1) ...
Selecting previously unselected package libhtml-parser-perl:amd64.
Preparing to unpack .../03-libhtml-parser-perl_3.76-1build2_amd64.deb ...
Unpacking libhtml-parser-perl:amd64 (3.76-1build2) ...
Selecting previously unselected package libcgi-pm-perl.
Preparing to unpack .../04-libcgi-pm-perl_4.54-1_all.deb ...
Unpacking libcgi-pm-perl (4.54-1) ...
Selecting previously unselected package libfcgi0ldbl:amd64.
Preparing to unpack .../05-libfcgi0ldbl_2.4.2-2build2_amd64.deb ...
Unpacking libfcgi0ldbl:amd64 (2.4.2-2build2) ...
Selecting previously unselected package libfcgi-perl:amd64.
Preparing to unpack .../06-libfcgi-perl_0.82+ds-1build1_amd64.deb ...
Unpacking libfcgi-perl:amd64 (0.82+ds-1build1) ...
Selecting previously unselected package libcgi-fast-perl.
Preparing to unpack .../07-libcgi-fast-perl_1%3a2.15-1_all.deb ...
Unpacking libcgi-fast-perl (1:2.15-1) ...
Selecting previously unselected package libclone-perl.
Preparing to unpack .../08-libclone-perl_0.45-1build3_amd64.deb ...
Unpacking libclone-perl (0.45-1build3) ...
Selecting previously unselected package libencode-locale-perl.
Preparing to unpack .../09-libencode-locale-perl_1.05-1.1_all.deb ...
Unpacking libencode-locale-perl (1.05-1.1) ...
Selecting previously unselected package libfcgi-bin.
Preparing to unpack .../10-libfcgi-bin_2.4.2-2build2_amd64.deb ...
Unpacking libfcgi-bin (2.4.2-2build2) ...
Selecting previously unselected package libhtml-template-perl.
Preparing to unpack .../11-libhtml-template-perl_2.97-1.1_all.deb ...
Unpacking libhtml-template-perl (2.97-1.1) ...
Selecting previously unselected package libtimedate-perl.
Preparing to unpack .../12-libtimedate-perl_2.3300-2_all.deb ...
Unpacking libtimedate-perl (2.3300-2) ...
Selecting previously unselected package libhttp-date-perl.
Preparing to unpack .../13-libhttp-date-perl_6.05-1_all.deb ...
Unpacking libhttp-date-perl (6.05-1) ...
Selecting previously unselected package libio-html-perl.
Preparing to unpack .../14-libio-html-perl_1.004-2_all.deb ...
Unpacking libio-html-perl (1.004-2) ...
Selecting previously unselected package liblwp-mediatypes-perl.
Preparing to unpack .../15-liblwp-mediatypes-perl_6.04-1_all.deb ...
Unpacking liblwp-mediatypes-perl (6.04-1) ...
Selecting previously unselected package libhttp-message-perl.
Preparing to unpack .../16-libhttp-message-perl_6.36-1_all.deb ...
Unpacking libhttp-message-perl (6.36-1) ...
Selecting previously unselected package mecab-utils.
Preparing to unpack .../17-mecab-utils_0.996-14build9_amd64.deb ...
Unpacking mecab-utils (0.996-14build9) ...
Selecting previously unselected package mecab-ipadic.
Preparing to unpack .../18-mecab-ipadic_2.7.0-20070801+main-3_all.deb ...
Unpacking mecab-ipadic (2.7.0-20070801+main-3) ...
Selecting previously unselected package mecab-ipadic-utf8.
Preparing to unpack .../19-mecab-ipadic-utf8_2.7.0-20070801+main-3_all.deb ...
Unpacking mecab-ipadic-utf8 (2.7.0-20070801+main-3) ...
Selecting previously unselected package mysql-server.
Preparing to unpack .../20-mysql-server_8.0.34-0ubuntu0.22.04.1_all.deb ...
Unpacking mysql-server (8.0.34-0ubuntu0.22.04.1) ...
Setting up libmecab2:amd64 (0.996-14build9) ...
Setting up mysql-client-core-8.0 (8.0.34-0ubuntu0.22.04.1) ...
Setting up libfcgi0ldbl:amd64 (2.4.2-2build2) ...
Setting up libclone-perl (0.45-1build3) ...
Setting up libhtml-tagset-perl (3.20-4) ...
Setting up liblwp-mediatypes-perl (6.04-1) ...
Setting up libfcgi-bin (2.4.2-2build2) ...
Setting up libencode-locale-perl (1.05-1.1) ...
Setting up libprotobuf-lite23:amd64 (3.12.4-1ubuntu7.22.04.1) ...
Setting up mecab-utils (0.996-14build9) ...
Setting up libio-html-perl (1.004-2) ...
Setting up libtimedate-perl (2.3300-2) ...
Setting up mysql-client-8.0 (8.0.34-0ubuntu0.22.04.1) ...
Setting up libfcgi-perl:amd64 (0.82+ds-1build1) ...
Setting up libaio1:amd64 (0.3.112-13build1) ...
Setting up liburi-perl (5.10-1) ...
Setting up libevent-pthreads-2.1-7:amd64 (2.1.12-stable-1build3) ...
Setting up libhttp-date-perl (6.05-1) ...
Setting up mecab-ipadic (2.7.0-20070801+main-3) ...
Compiling IPA dictionary for Mecab.  This takes long time...
reading /usr/share/mecab/dic/ipadic/unk.def ... 40
emitting double-array: 100% |###########################################| 
/usr/share/mecab/dic/ipadic/model.def is not found. skipped.
reading /usr/share/mecab/dic/ipadic/Prefix.csv ... 221
reading /usr/share/mecab/dic/ipadic/Adj.csv ... 27210
reading /usr/share/mecab/dic/ipadic/Noun.org.csv ... 16668
reading /usr/share/mecab/dic/ipadic/Adnominal.csv ... 135
reading /usr/share/mecab/dic/ipadic/Noun.demonst.csv ... 120
reading /usr/share/mecab/dic/ipadic/Noun.nai.csv ... 42
reading /usr/share/mecab/dic/ipadic/Noun.adjv.csv ... 3328
reading /usr/share/mecab/dic/ipadic/Noun.name.csv ... 34202
reading /usr/share/mecab/dic/ipadic/Noun.place.csv ... 72999
reading /usr/share/mecab/dic/ipadic/Filler.csv ... 19
reading /usr/share/mecab/dic/ipadic/Verb.csv ... 130750
reading /usr/share/mecab/dic/ipadic/Symbol.csv ... 208
reading /usr/share/mecab/dic/ipadic/Noun.adverbal.csv ... 795
reading /usr/share/mecab/dic/ipadic/Postp.csv ... 146
reading /usr/share/mecab/dic/ipadic/Noun.proper.csv ... 27328
reading /usr/share/mecab/dic/ipadic/Noun.csv ... 60477
reading /usr/share/mecab/dic/ipadic/Noun.others.csv ... 151
reading /usr/share/mecab/dic/ipadic/Adverb.csv ... 3032
reading /usr/share/mecab/dic/ipadic/Interjection.csv ... 252
reading /usr/share/mecab/dic/ipadic/Conjunction.csv ... 171
reading /usr/share/mecab/dic/ipadic/Auxil.csv ... 199
reading /usr/share/mecab/dic/ipadic/Noun.verbal.csv ... 12146
reading /usr/share/mecab/dic/ipadic/Noun.number.csv ... 42
reading /usr/share/mecab/dic/ipadic/Suffix.csv ... 1393
reading /usr/share/mecab/dic/ipadic/Postp-col.csv ... 91
reading /usr/share/mecab/dic/ipadic/Others.csv ... 2
emitting double-array: 100% |###########################################| 
reading /usr/share/mecab/dic/ipadic/matrix.def ... 1316x1316
emitting matrix      : 100% |###########################################| 

done!
update-alternatives: using /var/lib/mecab/dic/ipadic to provide /var/lib/mecab/dic/debian (mecab-dictionary) in auto mode
Setting up mysql-server-core-8.0 (8.0.34-0ubuntu0.22.04.1) ...
Setting up mecab-ipadic-utf8 (2.7.0-20070801+main-3) ...
Compiling IPA dictionary for Mecab.  This takes long time...
reading /usr/share/mecab/dic/ipadic/unk.def ... 40
emitting double-array: 100% |###########################################| 
/usr/share/mecab/dic/ipadic/model.def is not found. skipped.
reading /usr/share/mecab/dic/ipadic/Prefix.csv ... 221
reading /usr/share/mecab/dic/ipadic/Adj.csv ... 27210
reading /usr/share/mecab/dic/ipadic/Noun.org.csv ... 16668
reading /usr/share/mecab/dic/ipadic/Adnominal.csv ... 135
reading /usr/share/mecab/dic/ipadic/Noun.demonst.csv ... 120
reading /usr/share/mecab/dic/ipadic/Noun.nai.csv ... 42
reading /usr/share/mecab/dic/ipadic/Noun.adjv.csv ... 3328
reading /usr/share/mecab/dic/ipadic/Noun.name.csv ... 34202
reading /usr/share/mecab/dic/ipadic/Noun.place.csv ... 72999
reading /usr/share/mecab/dic/ipadic/Filler.csv ... 19
reading /usr/share/mecab/dic/ipadic/Verb.csv ... 130750
reading /usr/share/mecab/dic/ipadic/Symbol.csv ... 208
reading /usr/share/mecab/dic/ipadic/Noun.adverbal.csv ... 795
reading /usr/share/mecab/dic/ipadic/Postp.csv ... 146
reading /usr/share/mecab/dic/ipadic/Noun.proper.csv ... 27328
reading /usr/share/mecab/dic/ipadic/Noun.csv ... 60477
reading /usr/share/mecab/dic/ipadic/Noun.others.csv ... 151
reading /usr/share/mecab/dic/ipadic/Adverb.csv ... 3032
reading /usr/share/mecab/dic/ipadic/Interjection.csv ... 252
reading /usr/share/mecab/dic/ipadic/Conjunction.csv ... 171
reading /usr/share/mecab/dic/ipadic/Auxil.csv ... 199
reading /usr/share/mecab/dic/ipadic/Noun.verbal.csv ... 12146
reading /usr/share/mecab/dic/ipadic/Noun.number.csv ... 42
reading /usr/share/mecab/dic/ipadic/Suffix.csv ... 1393
reading /usr/share/mecab/dic/ipadic/Postp-col.csv ... 91
reading /usr/share/mecab/dic/ipadic/Others.csv ... 2
emitting double-array: 100% |###########################################| 
reading /usr/share/mecab/dic/ipadic/matrix.def ... 1316x1316
emitting matrix      : 100% |###########################################| 

done!
update-alternatives: using /var/lib/mecab/dic/ipadic-utf8 to provide /var/lib/mecab/dic/debian (mecab-dictionary) in auto mode
Setting up libhtml-parser-perl:amd64 (3.76-1build2) ...
Setting up libhttp-message-perl (6.36-1) ...
Setting up mysql-server-8.0 (8.0.34-0ubuntu0.22.04.1) ...
update-alternatives: using /etc/mysql/mysql.cnf to provide /etc/mysql/my.cnf (my.cnf) in auto mode
Renaming removed key_buffer and myisam-recover options (if present)
mysqld will log errors to /var/log/mysql/error.log
mysqld is running as pid 5904
Created symlink /etc/systemd/system/multi-user.target.wants/mysql.service → /lib/systemd/system/mysql.service.
Setting up libcgi-pm-perl (4.54-1) ...
Setting up libhtml-template-perl (2.97-1.1) ...
Setting up mysql-server (8.0.34-0ubuntu0.22.04.1) ...
Setting up libcgi-fast-perl (1:2.15-1) ...
Processing triggers for man-db (2.10.2-1) ...
Processing triggers for libc-bin (2.35-0ubuntu3.1) ...
/sbin/ldconfig.real: /usr/lib/wsl/lib/libcuda.so.1 is not a symbolic link
```
## 2. (**) Настроить Multi-Primary репликацию для MySQL на 2 VM согласно инструкции.
```
```
## 3. Создать схему БД clinic и наполнить её данными используя скрипты из https://github.com/tms-dos17-onl/_sandbox/tree/main/lecture18/mysql/initdb.d/data.
```
mysql> source /home/evilsmile/HW18/schema.sql
Query OK, 0 rows affected (0,00 sec)

Query OK, 1 row affected (0,15 sec)

Database changed
Query OK, 0 rows affected (0,82 sec)

Query OK, 0 rows affected (1,52 sec)

Query OK, 0 rows affected (1,28 sec)

Query OK, 0 rows affected (1,35 sec)

Query OK, 0 rows affected (1,13 sec)

Query OK, 0 rows affected (1,43 sec)

Query OK, 0 rows affected (0,27 sec)

Query OK, 0 rows affected (0,00 sec)

mysql> use clinic
Database changed
mysql> SHOW TABLES;
+------------------+
| Tables_in_clinic |
+------------------+
| Appointment      |
| Department       |
| Doctor           |
| Job              |
| Patient          |
| Room             |
+------------------+
6 rows in set (0,01 sec)

mysql> source /home/evilsmile/HW18/data.sql
Query OK, 0 rows affected (0,00 sec)

Database changed
Query OK, 5 rows affected (0,00 sec)
Records: 5  Duplicates: 0  Warnings: 0

Query OK, 6 rows affected (0,01 sec)
Records: 6  Duplicates: 0  Warnings: 0

Query OK, 2 rows affected (0,00 sec)
Records: 2  Duplicates: 0  Warnings: 0

Query OK, 6 rows affected (0,00 sec)
Records: 6  Duplicates: 0  Warnings: 0

Query OK, 5 rows affected (0,01 sec)
Records: 5  Duplicates: 0  Warnings: 0

Query OK, 5 rows affected (0,00 sec)
Records: 5  Duplicates: 0  Warnings: 0

Query OK, 0 rows affected (0,15 sec)

mysql> SELECT * FROM Job;
+----+----------------------------------+------------+------------+---------------+-----------+
| id | Title                            | StartDate  | EndDate    | Department_id | Doctor_id |
+----+----------------------------------+------------+------------+---------------+-----------+
|  1 | Заведующий                       | 2010-01-01 | 2025-01-01 |             1 |         1 |
|  2 | Заведующий                       | 2005-01-01 | 2025-01-01 |             2 |         2 |
|  3 | Врач 1-й категории               | 2020-01-01 | 2025-01-01 |             2 |         3 |
|  4 | Врач 2-й категории               | 2020-01-01 | 2025-01-01 |             1 |         4 |
|  5 | Врач 2-й категории               | 2020-01-01 | 2025-01-01 |             1 |         5 |
|  6 | Врач 2-й категории               | 2020-01-01 | 2025-01-01 |             1 |         6 |
+----+----------------------------------+------------+------------+---------------+-----------+
6 rows in set (0,00 sec)
```
## 4. Создать бэкап базы данных clinic.
```



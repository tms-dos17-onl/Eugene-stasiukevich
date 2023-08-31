## 1. Вывести список всех удаленных репозиториев для локального.

  ```

   $ git branch -r
   origin/HEAD -> origin/main
   origin/main

  ```

## 2. Вывести список всех веток.

  ```

  $ git branch -a 
  * main
  remotes/origin/HEAD -> origin/main
  remotes/origin/main
  ```

## 3. Вывести последние 3 коммитa с помощью git log.

  ```

  git log -3
  commit 8fd701601f2cc74170edfd74ef48212795607f94 (HEAD -> main, origin/main, origin/HEAD)
  Author: Infectdream <100120414+Infectdream@users.noreply.github.com>
  Date:   Wed Aug 2 08:57:48 2023 +0300
  Create Readme.md
  commit 188ed0899e14e72f5e07022fe84a262614aa1771
  Author: Infectdream <100120414+Infectdream@users.noreply.github.com>
  Date:   Mon Jul 31 22:03:01 2023 +0300
  Create Readme.md
  commit fb8b100ca544ef0e4d4a544854f08dcd07bd8d2b
  Author: Infectdream <100120414+Infectdream@users.noreply.github.com>
  Date:   Mon Jul 31 22:02:03 2023 +0300
  Update and rename Readme to Readme.md

  ```

## 4. Создать пустой файл README.md и сделать коммит.

  ```

  admin@DESKTOP-G2VZH6VL MINGW64 /d/DevOps/Eugene-stasiukevich/git_homework (main)
  $ echo "# git-practice" >> README.md
  admin@DESKTOP-G2VZH6VL MINGW64 /d/DevOps/Eugene-stasiukevich/git_homework (main)
  $ git add README.md
  warning: LF will be replaced by CRLF in git_homework/README.md.
  The file will have its original line endings in your working directory
  admin@DESKTOP-G2VZH6VL MINGW64 /d/DevOps/Eugene-stasiukevich/git_homework (main)
  $ git commit -m "First commit"
  [main 1ad7bde] First commit
  1 file changed, 1 insertion(+)
  create mode 100644 git_homework/README.md

  ```

## 5. Добавить фразу "Hello, DevOps" в README.md файл и сделать коммит.

  ```

   admin@DESKTOP-G2VZH6VL MINGW64 /d/DevOps/Eugene-stasiukevich/git_homework (main)
   $ nano README.md
   admin@DESKTOP-G2VZH6VL MINGW64 /d/DevOps/Eugene-stasiukevich/git_homework (main)
   $ git commit -a -m "Hello DevOps"
   warning: LF will be replaced by CRLF in git_homework/README.md.
   The file will have its original line endings in your working directory
   [main 265fc81] Hello DevOps
   1 file changed, 1 insertion(+)

  ```

## 6. Сделать реверт последнего коммита. Вывести последние 3 коммитa с помощью git log.

  ```

   admin@DESKTOP-G2VZH6VL MINGW64 /d/DevOps/Eugene-stasiukevich/git_homework (main)
   $ git log -3
   commit 265fc81b83b1b77ea52973c3e33a21088fc1c419 (HEAD -> main)
   Author: Infectdream <estetiquesx@gmail.com>
   Date:   Wed Aug 2 09:56:06 2023 +0300
   Hello DevOps
   commit 1ad7bde138f5618ccdf6d23db788580219952c97
   Author: Infectdream <estetiquesx@gmail.com>
   Date:   Wed Aug 2 09:42:02 2023 +0300
   First commit
   commit 8fd701601f2cc74170edfd74ef48212795607f94 (origin/main, origin/HEAD)
   Author: Infectdream <100120414+Infectdream@users.noreply.github.com>
   Date:   Wed Aug 2 08:57:48 2023 +0300
   Create Readme.md
   admin@DESKTOP-G2VZH6VL MINGW64 /d/DevOps/Eugene-stasiukevich/git_homework (main)
   $ git revert 265fc81b83b1b77ea52973c3e33a21088fc1c419
   [main 8de6047] Revert "Hello DevOps"
   1 file changed, 1 deletion(-)

  ```
## 7. Удалить последние 3 коммита с помощью git reset.

  ```

   admin@DESKTOP-G2VZH6VL MINGW64 /d/DevOps/Eugene-stasiukevich/git_homework (main)
   $ git reset --hard HEAD~3
   HEAD is now at 8fd7016 Create Readme.md

  ```
## 8. Вернуть коммит, где добавляется пустой файл README.md. Для этого найти ID коммита в git reflog, а затем сделать cherry-pick.

  ```

  admin@DESKTOP-G2VZH6VL MINGW64 /d/DevOps/Eugene-stasiukevich/git_homework (main)
  $ git cherry-pick 8fd7016
  [main 7c934a3] Create Readme.md
  Author: Infectdream <100120414+Infectdream@users.noreply.github.com>
  Date: Wed Aug 2 08:57:48 2023 +0300
  1 file changed, 1 insertion(+)
  create mode 100644 HW7/Readme.md

  ```

## 9. Удалить последний коммит с помощью git reset.

  ```

  $ git reset --hard HEAD~1
  HEAD is now at 188ed08 Create Readme.md

  ```

## 10.  Переключиться на ветку main или master. Если ветка называется master, то переименовать её в main.


## 11.  Скопировать файл https://github.com/tms-dos17-onl/_sandbox/blob/main/.github/workflows/validate-shell.yaml, положить его по такому же относительному пути в репозиторий. Создать коммит и запушить его в удаленный репозиторий.
```
User@DESKTOP-R7EM63B MINGW64 /f/Git/Eugene-stasiukevich (main)
$ git commit -m "Homework_7"
[main 2944bd7] Homework_7
 1 file changed, 24 insertions(+)
 create mode 100644 .github/workflows/validate-shell.yaml

User@DESKTOP-R7EM63B MINGW64 /f/Git/Eugene-stasiukevich (main)
$ git push origin main
Enumerating objects: 9, done.
Counting objects: 100% (9/9), done.
Delta compression using up to 12 threads
Compressing objects: 100% (5/5), done.
Writing objects: 100% (7/7), 910 bytes | 910.00 KiB/s, done.
Total 7 (delta 2), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (2/2), completed with 2 local objects.
To https://github.com/tms-dos17-onl/Eugene-stasiukevich.git
   a34e593..07c4ab1  main -> main




```
    
## 12. Создать из ветки main ветку develop. Переключиться на неё и создать README.md в корне репозитория. Написать в этом файле какие инструменты DevOps вам знакомы и с какими вы бы хотели познакомиться больше всего (2-3 пункта).

  ```

   admin@DESKTOP-G2VZH6VL MINGW64 /d/DevOps/Eugene-stasiukevich (main)
   $ git branch develop
   admin@DESKTOP-G2VZH6VL MINGW64 /d/DevOps/Eugene-stasiukevich (main)
   $ git branch -a
   develop
   * main
   remotes/origin/HEAD -> origin/main
   remotes/origin/main
   admin@DESKTOP-G2VZH6VL MINGW64 /d/DevOps/Eugene-stasiukevich (main)
   $ git checkout develop
   Switched to branch 'develop'
   admin@DESKTOP-G2VZH6VL MINGW64 /d/DevOps/Eugene-stasiukevich (develop)
   $ echo "# git-practice" >> README.md
   admin@DESKTOP-G2VZH6VL MINGW64 /d/DevOps/Eugene-stasiukevich (develop)
   $ git add README.md
   warning: LF will be replaced by CRLF in README.md.
   The file will have its original line endings in your working directory
   admin@DESKTOP-G2VZH6VL MINGW64 /d/DevOps/Eugene-stasiukevich (develop)
   $ nano README.md
   admin@DESKTOP-G2VZH6VL MINGW64 /d/DevOps/Eugene-stasiukevich (develop)
   $ git commit -a -m "Add files"
   warning: LF will be replaced by CRLF in README.md.
   The file will have its original line endings in your working directory
   [develop b26119e] Add files
   1 file changed, 8 insertions(+)
   create mode 100644 README.md
   admin@DESKTOP-G2VZH6VL MINGW64 /d/DevOps/Eugene-stasiukevich (develop)
   $ git push origin develop
   Enumerating objects: 4, done.
   Counting objects: 100% (4/4), done.
   Delta compression using up to 4 threads
   Compressing objects: 100% (3/3), done.
   Writing objects: 100% (3/3), 367 bytes | 367.00 KiB/s, done.
   Total 3 (delta 1), reused 0 (delta 0), pack-reused 0
   remote: Resolving deltas: 100% (1/1), completed with 1 local object.
   To https://github.com/tms-dos17-onl/Eugene-stasiukevich.git
   188ed08..b26119e  develop -> develop

  ```

##13. Создать из ветки main ветку support и создать там файл LICENSE с содержимым https://www.apache.org/licenses/LICENSE-2.0.txt. Создать коммит. Вывести последние 3 коммитa.

  ```

   admin@DESKTOP-G2VZH6VL MINGW64 /d/DevOps/Eugene-stasiukevich (main)
   $ git branch support
   admin@DESKTOP-G2VZH6VL MINGW64 /d/DevOps/Eugene-stasiukevich (main)
   $ git branch -a
   develop
  * main
   support
   remotes/origin/HEAD -> origin/main
   remotes/origin/develop
   remotes/origin/main
   admin@DESKTOP-G2VZH6VL MINGW64 /d/DevOps/Eugene-stasiukevich (main)
   $ git checkout support
   Switched to branch 'support'
   admin@DESKTOP-G2VZH6VL MINGW64 /d/DevOps/Eugene-stasiukevich (support)
   $ echo #"License" >> LICENSE.txt
   admin@DESKTOP-G2VZH6VL MINGW64 /d/DevOps/Eugene-stasiukevich (support)
   $ git add LICENSE.txt
   fatal: pathspec 'LICENSE.txt' did not match any files
   admin@DESKTOP-G2VZH6VL MINGW64 /d/DevOps/Eugene-stasiukevich (support)
   $ git add LICENSE
   fatal: pathspec 'LICENSE' did not match any files
   admin@DESKTOP-G2VZH6VL MINGW64 /d/DevOps/Eugene-stasiukevich (support)
   $ echo #"License" > > LICENSE.txt
   admin@DESKTOP-G2VZH6VL MINGW64 /d/DevOps/Eugene-stasiukevich (support)
   $ git add LICENSE
   fatal: pathspec 'LICENSE' did not match any files
   admin@DESKTOP-G2VZH6VL MINGW64 /d/DevOps/Eugene-stasiukevich (support)
   $ echo "# git-practice" >> LICENSE
   admin@DESKTOP-G2VZH6VL MINGW64 /d/DevOps/Eugene-stasiukevich (support)
   $ git add LICENSE
   warning: LF will be replaced by CRLF in LICENSE.
   The file will have its original line endings in your working directory
   admin@DESKTOP-G2VZH6VL MINGW64 /d/DevOps/Eugene-stasiukevich (support)
   $ nano LICENSE
   admin@DESKTOP-G2VZH6VL MINGW64 /d/DevOps/Eugene-stasiukevich (support)
   admin@DESKTOP-G2VZH6VL MINGW64 /d/DevOps/Eugene-stasiukevich (support)
   $ nano LICENSE
   admin@DESKTOP-G2VZH6VL MINGW64 /d/DevOps/Eugene-stasiukevich (support)
   $ git commit -m "Create File"
   [support 03d801b] Create File
   1 file changed, 1 insertion(+)
   create mode 100644 LICENSE
   admin@DESKTOP-G2VZH6VL MINGW64 /d/DevOps/Eugene-stasiukevich (support)
   $ git log -3
   commit 03d801b3c1f4adf2eb269ee0797952b59e60c910 (HEAD -> support)
   Author: Infectdream <estetiquesx@gmail.com>
   Date:   Wed Aug 2 11:43:49 2023 +0300
   Create File
   commit 188ed0899e14e72f5e07022fe84a262614aa1771 (main)
   Author: Infectdream <100120414+Infectdream@users.noreply.github.com>
   Date:   Mon Jul 31 22:03:01 2023 +0300
   Create Readme.md
   commit fb8b100ca544ef0e4d4a544854f08dcd07bd8d2b
   Author: Infectdream <100120414+Infectdream@users.noreply.github.com>
   Date:   Mon Jul 31 22:02:03 2023 +0300
   Update and rename Readme to Readme.md

   ```
 
 ## 14. Переключиться обратно на ветку main и создать там файл LICENSE с содержимым https://github.com/git/git-scm.com/blob/main/MIT-LICENSE.txt. Создать коммит. Вывести последние 3 коммитa.

    

## 15.  Сделать merge ветки support в ветку main и решить конфликты путем выбора содержимого только одной лицензии.

  ```

  admin@DESKTOP-G2VZH6VL MINGW64 /d/DevOps/Eugene-stasiukevich (main|MERGING)
  $ git mergetool
  This message is displayed because 'merge.tool' is not configured.
  See 'git mergetool --tool-help' or 'git help config' for more details.
  'git mergetool' will now attempt to use one of the following tools:
  opendiff kdiff3 tkdiff xxdiff meld tortoisemerge gvimdiff diffuse diffmerge ecmerge p4merge araxis bc codecompare smerge emerge vimdiff nvimdiff
  Merging:
  LICENSE
  Normal merge conflict for 'LICENSE':
  {local}: created file
  {remote}: created file
  Hit return to start merge resolution tool (vimdiff):
  3 files to edit
  admin@DESKTOP-G2VZH6VL MINGW64 /d/DevOps/Eugene-stasiukevich (main|MERGING)
  $ git mergetool
  This message is displayed because 'merge.tool' is not configured.
  See 'git mergetool --tool-help' or 'git help config' for more details.
  'git mergetool' will now attempt to use one of the following tools:
  opendiff kdiff3 tkdiff xxdiff meld tortoisemerge gvimdiff diffuse diffmerge ecmerge p4merge araxis bc codecompare smerge emerge vimdiff nvimdiff
  No files need merging
  admin@DESKTOP-G2VZH6VL MINGW64 /d/DevOps/Eugene-stasiukevich (main|MERGING)
  $ git commit
  [main d0a2e83] Merge branch 'support'

  ```

## 16. Переключиться на ветку develop и сделать rebase относительно ветки main.

  ```
   admin@DESKTOP-G2VZH6VL MINGW64 /d/DevOps/Eugene-stasiukevich (main)
   $ git checkout develop
   Switched to branch 'develop'
   admin@DESKTOP-G2VZH6VL MINGW64 /d/DevOps/Eugene-stasiukevich (develop)
   $ git rebase main
   Successfully rebased and updated refs/heads/develop.

  ```

## 17. Вывести историю последних 10 коммитов в виде графа с помощью команды git log -10 --oneline --graph.

  ```

  admin@DESKTOP-G2VZH6VL MINGW64 /d/DevOps/Eugene-stasiukevich (main)
  $ git log -10 --oneline --graph
  *   7f344e4 (HEAD -> main, origin/main, origin/HEAD) Merge branch 'main' of https://github.com/tms-dos17-onl/Eugene-stasiukevich Merge Homework
  |\
  | * 8fd7016 Create Readme.md
  * |   d0a2e83 Merge branch 'support'
  |\ \
  | * | 03d801b (origin/support, support) Create File
  | |/
  * / e6807d1 Save
  |/
  * 188ed08 Create Readme.md
  * fb8b100 Update and rename Readme to Readme.md
  * 63f6e55 Create Readme
  * 8dadeff Update Readme.md
  * f1f8575 Create Readme

  ```

## 18. Запушить ветку develop. В истории коммитов должен быть мерж support -> main.

  ```
  
   admin@DESKTOP-G2VZH6VL MINGW64 /d/DevOps/Eugene-stasiukevich (develop)
   $ git push origin develop
   Enumerating objects: 5, done.
   Counting objects: 100% (5/5), done.
   Delta compression using up to 4 threads
   Compressing objects: 100% (3/3), done.
   Writing objects: 100% (3/3), 449 bytes | 449.00 KiB/s, done.
   Total 3 (delta 2), reused 0 (delta 0), pack-reused 0
   remote: Resolving deltas: 100% (2/2), completed with 1 local object.
   To https://github.com/tms-dos17-onl/Eugene-stasiukevich.git
   b26119e..247c994  develop -> develop

  ```

## 19. Зайти в свой репозиторий на GitHub и создать Pull Request из ветки develop в ветку main.
    



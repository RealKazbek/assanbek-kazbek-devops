# Готовность к видео защите DevOps

Цель: 15 минут непрерывной записи экрана с собственным голосом. Не вводите пароли в кадре. Docker Desktop, контейнер приложения и Jenkins должны оставаться запущенными.

## Перед записью

В Terminal выполните:

`cd /Users/kazbek/Desktop/DevOps/assanbek_kazbek && ./DEVOPS_VIDEO_COMMANDS.sh`

Ожидаемый результат: проектная папка, две ERROR-строки, права `private.txt` 600 и `public.txt` 644, HTTP-ответ с Kazbek Assanbek, строка `OK`, Docker container `assanbek-kazbek-container`, URL Jenkins. Скрипт только читает данные и ничего не удаляет, не коммитит и не меняет Jenkins.

## 0:00–1:00 Представление

Покажите Finder или Terminal с каталогом проекта и скажите: «Здравствуйте. Я Казбек Ассанбек, группа IT2-2302, Student ID 37765. Это мой индивидуальный DevOps проект `assanbek_kazbek`. Репозиторий называется `assanbek-kazbek-devops`, Docker image — `assanbek-kazbek-devops`, container — `assanbek-kazbek-container`, Jenkins Job — `Assanbek_Kazbek_DevOps`.»

## 1:00–4:00 Linux

Выполните: `pwd`; `ls -la`; `find . -maxdepth 2 -type d | sort`; `find . -name application.log`; `grep ERROR logs/application.log`; `grep WARNING logs/application.log`; `grep -c ERROR logs/application.log`; `tail -n 5 logs/application.log`; `ls -l private.txt public.txt`; `./scripts/Assanbek_Kazbek_system.sh`; `ps aux | head -n 8`.

Скажите: «`find` находит файл, `grep` фильтрует строки, а `grep -c` считает ошибки. Права 600 означают read/write только для owner; 644 — owner может читать и писать, а остальные только читать. Скрипт выводит мои данные и системную информацию. PID — уникальный идентификатор процесса; `ps` показывает снимок процессов, `top` показывает их динамически.»

## 4:00–6:30 Git и GitHub

Выполните: `git status --short --branch`; `git log --oneline -12`; `git branch -a`; `git log --oneline --graph --all -20`; `git remote -v`; `cat .gitignore`.

Откройте GitHub repository и историю commits. Скажите: «Git хранит историю изменений. Ветка `development` была объединена в `main` реальным merge-коммитом. `.gitignore` исключает logs, backup и `.env`, чтобы не добавлять мусор и возможные секреты. GitHub является удалённым источником, откуда Jenkins получает код.»

## 6:30–10:00 Docker

Выполните: `docker images assanbek-kazbek-devops`; `docker ps --filter 'name=assanbek-kazbek'`; `docker logs assanbek-kazbek-container`; `docker exec assanbek-kazbek-container printenv | grep '^STUDENT_'`; `curl http://127.0.0.1:8081/`; `curl http://127.0.0.1:8081/health`; `cat Dockerfile`; `cat docker-compose.yml`; `docker compose config --quiet`.

Ожидаемый результат: image существует, required container имеет статус Up, logs и HTTP показывают Kazbek Assanbek, health возвращает `OK`. Скажите: «Image — неизменяемый шаблон, container — его запущенный экземпляр. STUDENT_NAME, STUDENT_SURNAME, STUDENT_GROUP и STUDENT_ID передаются как environment variables. Docker Compose описывает сервис декларативно; ранее `docker compose up -d --build` и `docker compose down` были успешно проверены.»

## 10:00–13:30 Jenkins

Откройте `http://127.0.0.1:8082/`, войдите через существующую страницу Jenkins самостоятельно, затем покажите Job `Assanbek_Kazbek_DevOps`, свежий Build #6 и его Console Output. На странице pipeline покажите стадии Checkout, Build, Test, Docker Build, Docker Run.

Скажите: «Jenkins получает Git commit из GitHub. В свежем Build #6 был проверен SHA `98c826604803a57096f2b8a36dd66d7f6d7906f5`. Checkout получает исходный код, Build выполняет проверку, Test запускает три теста, Docker Build создаёт image, Docker Run запускает container и проверяет приложение. В Console Output есть мои данные и `Finished: SUCCESS`. Если стадия завершится ошибкой, следующие стадии не должны выполняться, а результат не будет SUCCESS.»

## 13:30–15:00 Итог и PDF

Откройте PDF report и скажите: «Полная цепочка: Linux — среда разработки, Git — история, GitHub — удалённый repository, Jenkins — CI, Docker image — переносимый шаблон, Docker container — запущенное приложение. Технические задания 1–21 проверены. Я могу объяснить каждую команду и стадию pipeline.»

Перед остановкой записи покажите `Finished: SUCCESS`, работающий контейнер и GitHub repository. Сделайте реальные screenshots этих экранов только при необходимости для обновления PDF.

## Финальная готовность

| Component | Status | Evidence |
|---|---|---|
| Docker | PASS | `docker info`: Docker Desktop 29.7.2 |
| Application | PASS | `http://127.0.0.1:8081/health` returned `OK` |
| Jenkins | PASS | Existing controller is live at `127.0.0.1:8082` |
| Pipeline | PASS | Fresh Build #6, SHA `98c8266...`, `Finished: SUCCESS` |
| GitHub | PASS | `origin` is RealKazbek/assanbek-kazbek-devops |
| PDF | PASS | `reports/Assanbek_Kazbek_DevOps_Lab_Report.pdf` exists |
| Terminal commands | PASS | `DEVOPS_VIDEO_COMMANDS.sh` syntax-checked and dry-run successfully |
| Russian script | PASS | This file is ready for the recording |

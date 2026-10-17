# Сценарий видео демонстрации

Длительность: 10–20 минут. Записывайте одним непрерывным видео, со своим голосом и экраном. Показывайте только реальные результаты. Перед записью Docker Desktop должен быть запущен; текущая реальная Jenkins-проверка — build #5 с `Finished: SUCCESS` на SHA `98c826604803a57096f2b8a36dd66d7f6d7906f5`.

## 0:00–1:00 Представление

«Здравствуйте. Меня зовут Казбек Ассанбек, группа IT2-2302, Student ID 37765, курс DevOps. Я демонстрирую индивидуальный проект `assanbek_kazbek`, репозиторий `assanbek-kazbek-devops`, Docker image `assanbek-kazbek-devops`, контейнер `assanbek-kazbek-container` и Jenkins Job `Assanbek_Kazbek_DevOps`.»

## 1:00–4:30 Linux

«В Linux я создал структуру app, scripts, config, logs и backup. В `Assanbek_Kazbek_info.txt` находятся мои персональные данные. Я покажу `pwd`, `ls`, `cd`, `mkdir`, `touch`, `cp`, `mv`, `rm`, `cat`, `head` и `tail`. Файл `logs/application.log` содержит минимум десять сообщений. `find . -name application.log` находит файл; `grep ERROR` показывает ошибки; `grep WARNING` — предупреждения; `grep -c ERROR` считает ошибки; `tail -n 5` показывает последние строки.»

«Права `private.txt` равны 600: читать и писать может только владелец. У `public.txt` права 644: владелец читает и пишет, остальные читают. r, w, x — read, write, execute; права задаются для owner, group и others.»

«Скрипт `scripts/Assanbek_Kazbek_system.sh` исполняемый. Он показывает мои данные, пользователя, hostname, дату, ОС, диск, память и проверяет файл с информацией. На GNU/Linux для памяти используется `free -h`. `ps`, `ps aux` и `top` показывают процессы; PID — идентификатор процесса; `ps` делает снимок, `top` обновляет данные.»

## 4:30–7:00 Git и GitHub

«Я покажу `git status`, Git identity и `git log --oneline --graph --all`. Здесь более пяти содержательных коммитов. Ветка `development` содержит реальное изменение и объединена в `main` merge-коммитом. Ветки позволяют изолировать работу до проверки и merge.»

«В `.gitignore` указаны `*.log`, `backup/` и `.env`. Логи, резервные копии и секреты не должны попадать в историю. `git check-ignore -v` доказывает игнорирование. `git remote -v` показывает GitHub URL; затем я открываю GitHub и показываю main и историю.»

## 7:00–11:00 Docker

«В Dockerfile есть FROM, WORKDIR, COPY, RUN, EXPOSE и CMD. Приложение показывает мои данные и запускает HTTP-сервер. Я запускаю `docker build -t assanbek-kazbek-devops .`, затем `docker images`. Я создаю `assanbek-kazbek-container` и передаю STUDENT_NAME, STUDENT_SURNAME, STUDENT_GROUP и STUDENT_ID через `-e`. Переменные окружения меняют конфигурацию без пересборки image; секреты нельзя хранить в image.»

«Я показываю `docker ps`, `docker ps -a`, `docker logs`, `docker exec`, `docker stop`, `docker start` и удаление только тестового контейнера. Image — неизменяемый шаблон; container — экземпляр image. В `docker-compose.yml` описан сервис. Я выполняю `docker compose up -d --build`, `docker compose ps`, `docker compose logs` и `docker compose down`.»

## 11:00–15:30 Jenkins и итог

«Я открываю Jenkins Job `Assanbek_Kazbek_DevOps`, подключённый к GitHub. В Jenkinsfile пять стадий: Checkout, Build, Test, Docker Build и Docker Run. В environment объявлены четыре персональные переменные.»

«Я запускаю новую сборку и показываю Console Output. Checkout получает SHA из GitHub; Build компилирует код; Test запускает тесты; Docker Build создаёт image; Docker Run запускает container и проверяет приложение. В консоли видны мои имя, группа и Student ID, а в конце `Finished: SUCCESS`. При ошибке любой стадии pipeline останавливается и не будет SUCCESS.»

«Цепочка: Linux — среда разработки; Git — история; GitHub — удалённый источник; Jenkins получает код из GitHub, тестирует его, строит Docker image и запускает container. Спасибо.»

## Обязательные кадры

Покажите: терминал Linux, find/grep, права, скрипт, процессы, Git graph и branch, GitHub, Dockerfile, build/image/container/logs/env/Compose, Jenkins job/stages/console/SHA/`Finished: SUCCESS`. После каждого важного экрана сделайте реальный screenshot для PDF.

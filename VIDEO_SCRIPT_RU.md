# Сценарий видеодемонстрации DevOps Lab 1

Длительность: 15 минут, одна непрерывная запись экрана и голоса. Пароли не показывать.

## 0:00-1:00 Представление

Открыть `Assanbek_Kazbek_info.txt`. Сказать: «Меня зовут Казбек Ассанбек, группа IT2-2302, Student ID 37765. Это моя индивидуальная работа DevOps.»

## 1:00-4:00 Linux

Выполнить: `docker run --rm -it -v "$PWD":/workspace -w /workspace alpine:3.20 sh`; затем `apk add --no-cache bash procps`; `pwd; ls -la; find . -name application.log -print; grep ERROR logs/application.log; grep WARNING logs/application.log; grep -c ERROR logs/application.log; tail -n 5 logs/application.log; chmod +x scripts/Assanbek_Kazbek_system.sh; ./scripts/Assanbek_Kazbek_system.sh; ls -l private.txt public.txt; ps; ps aux | head; top -b -n 1 | head -n 12`.

Сказать: «Это настоящий Linux. find ищет, grep фильтрует, права 600 доступны только владельцу, 644 разрешает чтение. PID идентифицирует процесс; ps — снимок, top обновляется.»

## 4:00-6:00 Git и GitHub

Выполнить: `git status; git log --oneline --graph --decorate --all -12; git branch -avv; git remote -v; git check-ignore -v logs/application.log backup .env; git ls-remote origin refs/heads/main`.

Открыть GitHub repository и commits. Сказать: «Git хранит историю, GitHub публикует remote. development был слит в main. .gitignore защищает логи, backup и .env.»

## 6:00-10:00 Docker и Compose

Открыть Dockerfile. Выполнить: `python3 -m unittest discover -s tests -v`; `docker build -t assanbek-kazbek-devops:demo .`; `docker run -d --name assanbek-kazbek-demo -p 127.0.0.1:18080:8080 -e STUDENT_NAME=Kazbek -e STUDENT_SURNAME=Assanbek -e STUDENT_GROUP=IT2-2302 -e STUDENT_ID=37765 assanbek-kazbek-devops:demo`; `docker images | grep assanbek`; `docker ps -a --filter name=assanbek-kazbek-demo`; `curl -fsS http://127.0.0.1:18080/health`; `docker logs assanbek-kazbek-demo`; `docker exec assanbek-kazbek-demo python -c 'from app.app import application_text; print(application_text())'`; `docker stop assanbek-kazbek-demo; docker start assanbek-kazbek-demo; docker rm -f assanbek-kazbek-demo`; `docker compose up -d --build; docker compose ps; docker compose logs --tail=30; docker compose down`.

Сказать: «Image — неизменяемый шаблон, container — его экземпляр. Переменные окружения меняют конфигурацию без пересборки. Compose делает запуск повторяемым.»

## 10:00-14:00 Jenkins

Открыть `http://127.0.0.1:8082`, Job `Assanbek_Kazbek_DevOps`, build #3, Pipeline Stage View и Console Output. Показать `b1019ec` и `Finished: SUCCESS`.

Сказать: «Jenkins берёт main из GitHub и выполняет Checkout, Build, Test, Docker Build, Docker Run. В Test выполняются три проверки, включая health endpoint. Если стадия падает, последующие normal stages не запускаются.»

## 14:00-15:00 Итог

Открыть `CHECKLIST.md` и `reports/FINAL_VERIFICATION.md`. Сказать: «Поток: Linux, Git, GitHub, Jenkins, test, Docker build, Docker run, SUCCESS. Jenkins построил SHA b1019ec; я могу воспроизвести и объяснить каждый шаг.»

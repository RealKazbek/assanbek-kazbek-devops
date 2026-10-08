# Строгий аудит DevOps Laboratory Work для независимой проверки ChatGPT

**Дата аудита:** 2026-10-09
**Объект аудита:** `/Users/kazbek/Desktop/DevOps/assanbek_kazbek`
**Исходное задание:** `/Users/kazbek/Desktop/DevOps/Devops_Task_6week.docx`
**Публичный репозиторий:** `https://github.com/RealKazbek/assanbek-kazbek-devops`
**Принцип аудита:** данный файл создан на основании чтения исходного задания, файлов проекта, сохранённых журналов и текущих read-only проверок Git/GitHub/Docker. Никакие контейнеры, настройки Jenkins, существующие файлы проекта или Git-история в ходе аудита не изменялись. Статусы ниже не копируют автоматически `CHECKLIST.md`.

## 1. Данные студента

| Поле | Значение | Где подтверждено |
|---|---|---|
| Имя | Kazbek | `Assanbek_Kazbek_info.txt`, `app/app.py`, `Jenkinsfile`, Docker/Jenkins evidence |
| Фамилия | Assanbek | те же источники |
| Группа | IT2-2302 | те же источники |
| Student ID | 37765 | те же источники |
| Курс | DevOps | `Assanbek_Kazbek_info.txt`, PDF-отчёт |
| Каталог проекта | `assanbek_kazbek` | имя фактического каталога |
| Скрипт | `scripts/Assanbek_Kazbek_system.sh` | файл и Linux evidence |
| GitHub | `RealKazbek/assanbek-kazbek-devops` | `git remote -v`, `gh repo view`, Jenkins console |
| Docker image | `assanbek-kazbek-devops` | `Dockerfile`, Docker evidence |
| Docker container | `assanbek-kazbek-container` | Docker evidence, текущий `docker ps` |
| Jenkins job | `Assanbek_Kazbek_DevOps` | `jenkins/job-config.xml`, Jenkins console |

Проверка согласованности: в обязательных файлах, приложении, Compose, Jenkinsfile и успешном console output использованы одни и те же четыре персональные значения. Несоответствий в самих значениях не обнаружено.

## 2. Краткое содержание исходного задания

Исходный DOCX содержит 21 нумерованное задание: Linux (1–5), Git/GitHub (6–10), Docker (11–15), Jenkins (16–20), интегрированный DevOps workflow (21). Дополнительно требуются PDF-отчёт, доказательства/скриншоты, GitHub-репозиторий и непрерывная видео-демонстрация с голосом студента. Для Linux в задании специально требуется настоящий Linux, а не выдача macOS; для Jenkins требуются реальные стадии `Checkout`, `Build`, `Test`, `Docker Build`, `Docker Run` и результат `Finished: SUCCESS`.

В DOCX дан типовой путь вида `~/devops/...`; фактический проект находится в согласованном для этой работы пути `~/Desktop/DevOps/assanbek_kazbek`. Имя персонального каталога соответствует требованию, но буквальный родительский путь исходного шаблона отличается.

### Шкала статусов в этом аудите

- **VERIFIED** — требование подтверждено фактическими файлами и/или сохранённым выводом реального запуска.
- **PARTIAL** — основная часть есть, но обязательная часть, полнота доказательств или подача отсутствует.
- **UNVERIFIED** — в проекте недостаточно доказательств, чтобы независимо подтвердить утверждение.
- **FAIL** — реализация противоречит требованию или не выполняет его.

## 3. Аудит по заданиям

### Задание 1. Project Environment — **VERIFIED**

**Требование из задания (перевод):** создать персональный каталог проекта, подкаталоги `app`, `scripts`, `config`, `logs`, `backup`, файл с информацией о студенте, `config/app.conf` и `logs/application.log`; показать и объяснить `pwd`, `ls`, `cd`, `mkdir`, `touch`, `cp`, `mv`, `rm`, `cat`, `head`, `tail`.

**Фактическая реализация и ответ.** Имеется структура `app/`, `scripts/`, `config/`, `logs/`, `backup/`; файл `Assanbek_Kazbek_info.txt` содержит имя, фамилию, группу, ID и курс. Смысл команд дан в `docs/OPERATIONS.md`: `pwd` печатает каталог, `ls` перечисляет файлы, `cd` меняет каталог, `mkdir` создаёт каталог, `touch` создаёт файл/обновляет timestamp, `cp` копирует, `mv` перемещает/переименовывает, `rm` удаляет, `cat` печатает файл, `head`/`tail` показывают начало/конец.

**Примеры реального вывода:**

```text
pwd -> /workspace
find ... структура содержит app scripts config logs backup
cd scripts
mkdir command_demo; touch command_demo/source.txt
cp command_demo/source.txt command_demo/copy.txt
mv command_demo/copy.txt command_demo/moved.txt
rm command_demo/moved.txt
cat Assanbek_Kazbek_info.txt
head -n 3 Assanbek_Kazbek_info.txt
tail -n 2 Assanbek_Kazbek_info.txt
```

**Файлы и доказательства:** `Assanbek_Kazbek_info.txt`, `config/app.conf`, `logs/application.log`, `docs/OPERATIONS.md`; `evidence/linux/linux_commands.txt` (разделы Task 1). Скрипт демонстрации выполнялся внутри Linux Docker environment, не на macOS.

**Проблемы/релевантность:** команды `mkdir`–`rm` показаны на временном `command_demo`, а не непосредственно при первом создании постоянной структуры, но это корректная демонстрация самих команд. Родительский путь отличается от шаблона DOCX, имя каталога верно. Реализация и объяснение релевантны.

### Задание 2. Search and File Processing — **VERIFIED**

**Требование (перевод):** создать `logs/application.log` минимум с 10 реалистичными сообщениями; найти файл через `find`, строки `ERROR` и `WARNING` через `grep`, посчитать `ERROR`, показать последние пять записей.

**Фактическая реализация и ответ.** `logs/application.log` существует и содержит журнал приложения. В сохранённом Linux выводе присутствуют поиск файла, оба вида `grep`, число ошибок и `tail`.

```text
find . -name application.log
./logs/application.log

grep ERROR logs/application.log
... ERROR ...
... ERROR ...

grep WARNING logs/application.log
... WARNING ...
... WARNING ...

grep -c ERROR logs/application.log
2

tail -n 5 logs/application.log
```

**Файлы и доказательства:** `logs/application.log`; `evidence/linux/linux_commands.txt` (Task 2).

**Проблемы/релевантность:** файл намеренно игнорируется Git по `*.log`, но присутствует в рабочем проекте и в Linux evidence. Количество сообщений соответствует требованию по сохранённому выводу/файлу. Реализация релевантна.

### Задание 3. File Permissions — **VERIFIED**

**Требование (перевод):** создать `private.txt` и `public.txt`, установить разные права (пример: private только owner read/write, public owner read/write и чтение для других), проверить `ls -l`; объяснить `r`, `w`, `x`, owner, group, others и причину различия.

**Фактическая реализация и ответ.** В проекте имеются `private.txt` и `public.txt`. Текущие mode на файловой системе: `600` и `644`; сохранённый Linux вывод также показывает именно Linux modes:

```text
-rw------- 1 root root ... private.txt
-rw-r--r-- 1 root root ... public.txt
```

Объяснение в `docs/OPERATIONS.md`: `r`, `w`, `x` — read/write/execute; каждая тройка применяется к owner/group/others; `private.txt` с `600` доступен только владельцу, `public.txt` с `644` может читаться другими.

**Файлы и доказательства:** `private.txt`, `public.txt`, `docs/OPERATIONS.md`, `evidence/linux/linux_commands.txt` (Task 3).

**Проблемы/релевантность:** на macOS дополнительно могут отображаться ACL/xattr-маркеры, но требование Linux подтверждено отдельным Linux выводом. Для обычных текстовых файлов execute не нужен. Реализация релевантна и технически корректна.

### Задание 4. Bash Script — **VERIFIED**

**Требование (перевод):** написать исполняемый `Surname_Name_system.sh`, выводящий имя, фамилию, группу, ID, username, hostname, дату, ОС, disk и memory usage; использовать `whoami`, `hostname`, `date`, `uname`, `df`, `free`; проверить существование info-файла и запустить скрипт после `chmod +x`.

**Фактическая реализация и ответ.** `scripts/Assanbek_Kazbek_system.sh` исполняемый (`-rwxr-xr-x`) и содержит `set -euo pipefail`, персональные строки, реальные command substitutions и проверку:

```bash
echo "Username: $(whoami)"
echo "Hostname: $(hostname)"
echo "Current Date: $(date '+%Y-%m-%d %H:%M:%S %Z')"
echo "Operating System: $(uname -srm)"
df -h / | tail -n 1
free -h
if [[ -f "$info_file" ]]; then
```

Linux evidence показывает реальный запуск с Linux kernel, `df -h`, `free -h` и сообщением о наличии `Assanbek_Kazbek_info.txt`.

**Файлы и доказательства:** `scripts/Assanbek_Kazbek_system.sh`; `evidence/linux/linux_commands.txt` (Task 4).

**Проблемы/релевантность:** значение username в доказательстве — `root`, что нормально для лабораторного Linux container и не подменяется именем студента. Скрипт использует именно требуемые Linux utilities. Реализация релевантна.

### Задание 5. Processes — **VERIFIED**

**Требование (перевод):** продемонстрировать `ps`, `ps aux`, `top`; выбрать процесс и показать PID, владельца, CPU, память; объяснить process management, PID и различие `ps`/`top`.

**Фактическая реализация и ответ.** Linux evidence содержит `ps`, `ps aux` и batch-вызов `top`, пригодный для неинтерактивной записи. В `ps aux` видны столбцы user, PID, `%CPU`, `%MEM` и command. Объяснение в `docs/OPERATIONS.md`: процесс — работающая программа, PID — уникальный идентификатор; `ps` является снимком, `ps aux` детальнее, `top` обновляет данные интерактивно.

**Файлы и доказательства:** `docs/OPERATIONS.md`; `evidence/linux/linux_commands.txt` (Task 5).

**Проблемы/релевантность:** не выделен отдельной таблицей один выбранный PID, но требуемые четыре поля реально присутствуют в `ps aux` и `top`. Содержательно требование выполнено; объяснение корректно и релевантно.

### Задание 6. Git Repository — **VERIFIED**

**Требование (перевод):** выполнить `git init`, проверить `git config --global user.name` и `user.email`, не перезаписывая существующую глобальную идентичность без необходимости, показать `git status`.

**Фактическая реализация и ответ.** Репозиторий существует, имеет первоначальный коммит `0a1913e Initialize personalized DevOps project structure` и последующую историю. Текущие read-only проверки на момент аудита выдали:

```text
git config --global --get user.name  -> Kazbek
git config --global --get user.email -> 37765@iitu.edu.kz
git status --short                    -> (пусто: чистое состояние до создания данного аудита)
```

**Файлы и доказательства:** `.git/` (локально), `evidence/github/git_history.txt`, текущая Git-конфигурация; запись в `CHECKLIST.md` описывает сохранение существующей identity.

**Проблемы/релевантность:** отдельный исторический текстовый файл с выводом `git config` не сохранён, однако актуальная read-only проверка его подтверждает. Email не задан в исходном задании, поэтому нет противоречия. Реализация релевантна.

### Задание 7. Meaningful Commit History — **VERIFIED**

**Требование (перевод):** создать не менее пяти настоящих, содержательных коммитов, отражающих развитие проекта, а не пустые/artificial commits.

**Фактическая реализация и ответ.** В текущей истории существенно больше пяти осмысленных коммитов. Ранние этапы включают:

```text
0a1913e Initialize personalized DevOps project structure
9e2021d Add environment configurable student application
471484f Record Linux command and permission verification
0c89c2d Build and verify personalized Docker application
f1c2df2 Verify Docker Compose and container lifecycle
e602227 Document Linux and Docker operating procedures
e5b03c7 Merge development documentation updates
2a4a70a Add Jenkins job configuration for GitHub pipeline
e16e061 Avoid Jenkins controller and pipeline container name conflict
f50498d Verify successful Jenkins pipeline and update final evidence
```

**Файлы и доказательства:** `git log --oneline --graph --decorate`; `evidence/github/git_history.txt` (исторический снимок, не самый новый).

**Проблемы/релевантность:** один начальный commit включает несколько базовых файлов, но последующие коммиты соответствуют реальным этапам и не являются пустыми. `evidence/github/git_history.txt` устарел относительно текущего `f50498d`; это недостаток свежести evidence, не истории. Требование выполнено.

### Задание 8. Gitignore — **VERIFIED**

**Требование (перевод):** создать `.gitignore` с `*.log`, `backup/`, `.env`; проверить, что игнорируемые файлы не отслеживаются; объяснить назначение `.gitignore`.

**Фактическая реализация и ответ.** `.gitignore` содержит требуемые строки и дополнительные безопасные паттерны для Python/macOS/local report rendering. `evidence/gitignore_check.txt` сохранён как проверка. Назначение `.gitignore` описано в README/операционных материалах: исключать локальные, генерируемые и потенциально чувствительные артефакты из истории.

```gitignore
*.log
backup/
.env
```

**Файлы и доказательства:** `.gitignore`, `evidence/gitignore_check.txt`, `README.md`.

**Проблемы/релевантность:** `logs/application.log` существует для Linux задания, но правильно не отслеживается из-за `*.log`; это не пропуск. По текущему `git ls-files` не найдены `.env`, токены, ключи или credential files; `private.txt` отслеживается намеренно как требуемый текстовый файл и не содержит секретов. Реализация релевантна.

### Задание 9. Branching and Merge — **VERIFIED**

**Требование (перевод):** создать и переключиться на `development`, сделать осмысленное изменение и commit, вернуться на `main`, merge, показать `git branch` и `git log --oneline --graph`, объяснить назначение ветки.

**Фактическая реализация и ответ.** В графе присутствуют branch `development`, commit `e602227 Document Linux and Docker operating procedures` и merge commit `e5b03c7 Merge development documentation updates` в `main`:

```text
*   e5b03c7 Merge development documentation updates
|\
| * e602227 (development) Document Linux and Docker operating procedures
|/
```

**Файлы и доказательства:** `docs/OPERATIONS.md` (содержательное изменение ветки), текущий `git log --oneline --graph --decorate`, `evidence/github/git_history.txt`.

**Проблемы/релевантность:** branch `development` сохранён после merge, что допустимо. Объяснение веток в операционном документе краткое, но верное: Git поддерживает безопасные ветки изменений. Требование выполнено.

### Задание 10. GitHub — **VERIFIED**

**Требование (перевод):** создать публичный GitHub repository, добавить remote, выполнить push `main`, проверить remote и наличие полного проекта на GitHub.

**Фактическая реализация и ответ.** Текущая проверка GitHub CLI вернула:

```text
RealKazbek/assanbek-kazbek-devops | https://github.com/RealKazbek/assanbek-kazbek-devops | PUBLIC | default=main
```

`git remote -v`:

```text
origin  https://github.com/RealKazbek/assanbek-kazbek-devops.git (fetch)
origin  https://github.com/RealKazbek/assanbek-kazbek-devops.git (push)
```

Локальный `HEAD` и `origin/main` оба равны `f50498d6c361336464dcd1a7d028fd9a01bdaaaf`, что подтверждает push текущей истории.

**Файлы и доказательства:** `evidence/github/repository_verification.json`, `evidence/github/git_history.txt`, текущие `gh repo view`, `git remote -v`, `git rev-parse HEAD origin/main`.

**Проблемы/релевантность:** не сохранён визуальный GitHub screenshot; существует JSON/API evidence и живая CLI-проверка. Само требование GitHub технически выполнено и верифицировано.

### Задание 11. Dockerfile — **VERIFIED**

**Требование (перевод):** создать реальное небольшое приложение, показывающее заданный персонализированный текст и `Application is running successfully!`; Dockerfile должен содержать осмысленные `FROM`, `WORKDIR`, `COPY`, `RUN`, `EXPOSE`, `CMD`.

**Фактическая реализация и ответ.** `app/app.py` — dependency-free Python HTTP application. Функция `application_text()` формирует именно требуемое содержимое, значения читаются из environment с указанными default. `Dockerfile`:

```dockerfile
FROM python:3.13-alpine
WORKDIR /app
COPY app/ /app/app/
RUN addgroup -S student && adduser -S student -G student && chown -R student:student /app
USER student
EXPOSE 8080
CMD ["python", "-m", "app.app"]
```

**Файлы и доказательства:** `Dockerfile`, `app/app.py`, `tests/test_app.py`, `evidence/docker/docker_verification.txt`.

**Проблемы/релевантность:** `RUN` имеет конкретную цель — создание non-root user. Нет dependency file, потому что приложение использует только стандартную библиотеку. Условие исходного задания выполнено.

### Задание 12. Build and Run — **VERIFIED**

**Требование (перевод):** выполнить `docker build -t assanbek-kazbek-devops .`, запустить персональный container, проверить `docker images`, `docker ps`, `docker ps -a`.

**Фактическая реализация и ответ.** В Docker evidence записана команда build для `assanbek-kazbek-devops:latest`, затем запуск `assanbek-kazbek-container` с mapping `8081->8080`, `docker images`, `docker ps` и состояние container. В момент аудита контейнер всё ещё реально работает:

```text
assanbek-kazbek-container | assanbek-kazbek-devops | Up 4 hours
```

**Файлы и доказательства:** `Dockerfile`, `evidence/docker/docker_verification.txt`, текущий read-only `docker ps`.

**Проблемы/релевантность:** в evidence build используется legacy builder, о чём Docker выдал предупреждение; это не отменяет успешную сборку. Имя image/container соответствует заданию.

### Задание 13. Environment Variables — **VERIFIED**

**Требование (перевод):** поддержать и передать `STUDENT_NAME`, `STUDENT_SURNAME`, `STUDENT_GROUP`, `STUDENT_ID`; показать, что изменение переменной меняет вывод; объяснить пользу environment variables и почему secrets не надо hard-code.

**Фактическая реализация и ответ.** `app/app.py` читает все четыре переменные через `os.getenv`. Docker evidence содержит запуск с настоящими значениями и отдельный реальный override:

```text
Name: Changed
Surname: Student
Group: DEMO-1
Student ID: 99999
```

Объяснение в `docs/OPERATIONS.md` говорит, что environment variables позволяют конфигурировать один образ во время запуска, а secrets нельзя hard-code, поскольку image/history могут быть доступны другим.

**Файлы и доказательства:** `app/app.py`, `tests/test_app.py`, `docker-compose.yml`, `Jenkinsfile`, `docs/OPERATIONS.md`, `evidence/docker/docker_verification.txt`.

**Проблемы/релевантность:** персональные учебные данные не являются секретами. Все четыре требуемые переменные реально передаются. Требование выполнено.

### Задание 14. Container Management — **VERIFIED**

**Требование (перевод):** показать `docker logs`, `docker stop`, `docker start`, `docker rm`, а также `docker exec`, где применимо; объяснить разницу image/container.

**Фактическая реализация и ответ.** `docker_verification.txt` содержит logs, exec, stop/start `assanbek-kazbek-container`. `compose_and_management.txt` показывает безопасный отдельный `assanbek-kazbek-removal-demo`, созданный и удалённый через `docker rm`, без удаления требуемого рабочее container. В `docs/OPERATIONS.md` image определён как неизменяемый packaged template, container — как его запущенный/остановленный instance.

**Файлы и доказательства:** `evidence/docker/docker_verification.txt`, `evidence/docker/compose_and_management.txt`, `docs/OPERATIONS.md`.

**Проблемы/релевантность:** `docker rm` показан на выделенном demo container, что безопаснее, чем удалять требуемый рабочий container. Все команды по смыслу покрыты.

### Задание 15. Docker Compose — **VERIFIED**

**Требование (перевод):** создать `docker-compose.yml`, указать приложение и student environment variables, выполнить/проверить `docker compose up` и `docker compose down`, использовать detached mode по необходимости, объяснить Compose.

**Фактическая реализация и ответ.** Compose service `student-app` build-ит проект, задаёт image `assanbek-kazbek-devops:compose`, отдельное имя `assanbek-kazbek-compose`, ports и все четыре переменные. Evidence показывает build, start, `compose ps`, logs с персональными данными и `compose down`.

```yaml
environment:
  STUDENT_NAME: Kazbek
  STUDENT_SURNAME: Assanbek
  STUDENT_GROUP: IT2-2302
  STUDENT_ID: "37765"
```

**Файлы и доказательства:** `docker-compose.yml`, `docs/OPERATIONS.md`, `evidence/docker/compose_and_management.txt`.

**Проблемы/релевантность:** Compose container имеет отличающееся имя, поэтому не конфликтует с manual container. Объяснение о воспроизводимой конфигурации корректно. Требование выполнено.

### Задание 16. Jenkins Job — **VERIFIED**

**Требование (перевод):** создать реальную Jenkins Job с точным именем `Assanbek_Kazbek_DevOps` и подключить её к GitHub repository.

**Фактическая реализация и ответ.** `jenkins/job-config.xml` содержит Pipeline job, URL публичного repo, `*/main` и `Jenkinsfile`. Реальная Jenkins console build #2 начинается строкой `Started Assanbek_Kazbek_DevOps #2` и выполняет checkout из этого URL.

```xml
<url>https://github.com/RealKazbek/assanbek-kazbek-devops.git</url>
<name>*/main</name>
<scriptPath>Jenkinsfile</scriptPath>
```

**Файлы и доказательства:** `jenkins/job-config.xml`, `evidence/jenkins/console_build_2.txt`, `evidence/jenkins/controller_and_docker_verification.txt`.

**Проблемы/релевантность:** сохранённый `evidence/jenkins/job_api.json` пуст, поэтому не является доказательством. Jenkins controller после верификации был намеренно остановлен и удалён вместе с socket mount; job остаётся в выделенном Jenkins volume, но в момент аудита нельзя запросить его живой API. Console output и job XML достаточно подтверждают факт создания и исполнения job, однако настоящего dashboard screenshot нет.

### Задание 17. Jenkinsfile — **VERIFIED**

**Требование (перевод):** создать working declarative Jenkins Pipeline с содержательными стадиями `Checkout`, `Build`, `Test`, `Docker Build`, `Docker Run`; это не должны быть фиктивные echo-only stages.

**Фактическая реализация и ответ.** `Jenkinsfile` использует `pipeline { ... stages { ... } }` и имеет все пять стадий. Их полезные операции: checkout SCM и SHA, `python3 -m compileall app`, `python3 -m unittest discover -s tests -v`, `/usr/bin/docker build`, запуск container, `docker logs`, `docker exec`.

**Файлы и доказательства:** `Jenkinsfile`; полный реальный execution всех пяти стадий в `evidence/jenkins/console_build_2.txt` и `console_build_2_api.txt`.

**Проблемы/релевантность:** стадия Build дополнительно печатает нужную идентификацию, но не ограничивается этим — выполняет compile. Требование полностью выполнено.

### Задание 18. Jenkins + GitHub — **VERIFIED**

**Требование (перевод):** настроить Jenkins на получение исходного кода из `https://github.com/RealKazbek/assanbek-kazbek-devops`, затем checkout, build, test, Docker build и Docker run.

**Фактическая реализация и ответ.** Console build #2 буквально фиксирует:

```text
Fetching upstream changes from https://github.com/RealKazbek/assanbek-kazbek-devops.git
Checking out Revision e16e0613786fe1df391589a7f283d7f5af0c9bb1
[Pipeline] { (Checkout)
[Pipeline] { (Build)
[Pipeline] { (Test)
[Pipeline] { (Docker Build)
[Pipeline] { (Docker Run)
```

**Файлы и доказательства:** `jenkins/job-config.xml`, `Jenkinsfile`, `evidence/jenkins/console_build_2.txt`.

**Проблемы/релевантность:** Jenkins лог содержит предупреждение `CredentialId "" could not be found.` Для публичного repository checkout всё равно реально выполнился без credentials; это предупреждение о пустой optional ссылке, не proof failure. Требование выполнено.

### Задание 19. Jenkins Environment Variables — **VERIFIED**

**Требование (перевод):** настроить четыре student environment variables и подтвердить в Jenkins Console Output строки `Student: Kazbek Assanbek`, `Group: IT2-2302`, `Student ID: 37765`.

**Фактическая реализация и ответ.** Верхняя секция `environment` в `Jenkinsfile` задаёт все четыре значения. Console build #2 содержит точные требуемые строки:

```text
Student: Kazbek Assanbek
Group: IT2-2302
Student ID: 37765
```

Далее Docker Run выводит приложение с теми же значениями.

**Файлы и доказательства:** `Jenkinsfile`, `evidence/jenkins/console_build_2.txt`, `evidence/jenkins/console_build_2_api.txt`.

**Проблемы/релевантность:** отсутствуют. Условие подтверждено непосредственным console output.

### Задание 20. Successful Pipeline — **PARTIAL**

**Требование (перевод):** реально запустить pipeline, подтвердить успех всех стадий, результат `Finished: SUCCESS`; собрать настоящие доказательства Jenkins Dashboard, Job, stages, Console Output, Docker image/container и Git commit, использованный Jenkins.

**Фактическая реализация и ответ.** Реальный build #2 содержит выполнение всех стадий и финал:

```text
Finished: SUCCESS
Completed Assanbek_Kazbek_DevOps #2 : SUCCESS
```

Он собрал `assanbek-kazbek-devops:jenkins`, запустил `assanbek-kazbek-jenkins-app`; это также зафиксировано в `controller_and_docker_verification.txt`. В current read-only `docker ps` Jenkins container всё ещё работает. Использованный Git commit — `e16e0613786fe1df391589a7f283d7f5af0c9bb1`.

**Файлы и доказательства:** `evidence/jenkins/console_build_2.txt`, `evidence/jenkins/console_build_2_api.txt`, `evidence/jenkins/controller_and_docker_verification.txt`, `Jenkinsfile`.

**Почему PARTIAL:** фактический успешный запуск и console output **верифицированы**, но в проекте нет настоящих скриншотов Jenkins Dashboard, страницы Job или визуального stage view. Пустой `evidence/jenkins/job_api.json` нельзя считать доказательством Job API. Текстовый console/API evidence не равен требуемым визуальным screenshots. Также имеется `console_build_1.txt` с реальной неуспешной попыткой из-за name conflict; ошибка была затем исправлена commit `e16e061`, а build #2 успешен. Это не подделка успеха, но должно быть видно проверяющему.

### Задание 21. Integrated DevOps Workflow — **VERIFIED (технический workflow); PARTIAL (демонстрационное представление)**

**Требование (перевод):** продемонстрировать цепочку `Linux → Create Project → Git → GitHub → Jenkins → Build → Test → Docker Build → Docker Run → SUCCESS`; объяснить 1) зачем Linux, 2) Git, 3) GitHub, 4) почему Jenkins нужен GitHub, 5) зачем Jenkins собирает image, 6) image vs container, 7) что происходит при старте Pipeline, 8) что происходит при ошибке stage. Объяснение должно соответствовать реальному проекту.

**Фактическая реализация и ответ.** `docs/OPERATIONS.md` даёт соответствующее проекту объяснение: Linux предоставляет воспроизводимую command-line среду; Git фиксирует изменения/ветки; GitHub — удалённый source для Jenkins; при старте Jenkins получает commit, compile-ит Python, запускает tests, строит image и стартует named container; при fail следующие стадии не запускаются. Различие image/container и цель environment variables объяснены там же. Документ `VIDEO_GUIDE.md` содержит план непрерывной записи и английский speaking script.

Техническая цепочка подтверждена: Linux commands — `evidence/linux/`; Git history and public origin — Git/CLI evidence; Jenkins checkout — `console_build_2.txt`; build/test/image/run and `Finished: SUCCESS` — тот же console output.

**Файлы и доказательства:** `docs/OPERATIONS.md`, `README.md`, `VIDEO_GUIDE.md`, `evidence/linux/linux_commands.txt`, `evidence/github/`, `evidence/jenkins/console_build_2.txt`.

**Проблемы/релевантность:** техническая интеграция выполнена и объяснение релевантно. Однако самой непрерывной video demonstration с голосом студента нет в проекте, а визуальные screenshots отсутствуют; поэтому presentation/submission часть этого workflow не верифицирована. Это не позволяет назвать итоговую демонстрацию полностью доказанной.

## 4. Сводка доказательств и проверок

| Область | Реальные артефакты |
|---|---|
| Linux | `evidence/linux/linux_commands.txt`: Linux kernel, команды 1–5, permissions, script, processes |
| Git | Локальный `.git`; current graph и `origin/main = f50498d`; `evidence/github/git_history.txt` |
| GitHub | `evidence/github/repository_verification.json`; текущий `gh repo view` подтвердил public repo и `main` |
| Ignore | `.gitignore`, `evidence/gitignore_check.txt`; current `git ls-files` не показывает `.env`/tokens/keys |
| Docker | `evidence/docker/docker_verification.txt`; `evidence/docker/compose_and_management.txt`; current `docker ps` |
| Jenkins | `jenkins/job-config.xml`, `Jenkinsfile`, `console_build_1.txt`, `console_build_2.txt`, `console_build_2_api.txt`, `controller_and_docker_verification.txt` |
| Report | `reports/Assanbek_Kazbek_DevOps_Lab_Report.pdf`; source `reports/build_report.py` |
| Video | `VIDEO_GUIDE.md` — это guide/script, не записанное видео |

### Сопоставление Jenkins commit и текущего GitHub commit

Успешный Jenkins build #2 checkout-ил `e16e0613786fe1df391589a7f283d7f5af0c9bb1` (`Avoid Jenkins controller and pipeline container name conflict`). На момент этого аудита `HEAD` и `origin/main` равны более позднему `f50498d6c361336464dcd1a7d028fd9a01bdaaaf` (`Verify successful Jenkins pipeline and update final evidence`). Это **не является автоматически ошибкой**: после запуска были добавлены/зафиксированы результаты верификации и отчётные evidence. В доступной истории нет признака, что после `e16e061` изменялся `Jenkinsfile` или Docker/application logic так, чтобы успешный run потерял применимость; но без повторного запуска на `f50498d` нельзя утверждать, что Jenkins проверил именно самый последний commit.

## 5. Расхождения, риски и недостающие требования

1. **Нет настоящих скриншотов.** В `evidence/` находятся `.txt` и `.json`, но нет снимков GitHub, Jenkins Dashboard, job page, stage view или Docker UI/terminal screenshots. PNG в игнорируемом `tmp/` были рендерингами страниц PDF, а не доказательствами исходных интерфейсов. Это главное основание статуса PARTIAL для Task 20.
2. **Видео не создано.** `VIDEO_GUIDE.md` — качественный план, но исходное задание требует одну непрерывную screen recording с собственным голосом студента. Такой файл отсутствует и не может быть заменён текстом.
3. **PDF не содержит фактических скриншотов.** В отчёте есть раздел evidence, но он ссылается на текстовые журналы; это слабее прямого требования “Screenshots”.
4. **Jenkins controller сейчас не запущен.** По правилам временной лабораторной среды controller после проверки был остановлен/удалён, а доступ к Docker socket снят; Jenkins volume сохранён. Это хорошо с точки зрения безопасности, но текущий audit не может запросить живой dashboard/API. Перед очной демонстрацией нужно безопасно восстановить локальный controller с authentication и loopback bind, если это допустимо преподавателю.
5. **`job_api.json` пуст.** Нельзя ссылаться на него как на успешный API screenshot/evidence. Решающими доказательствами остаются console #2 и job XML.
6. **Имеется неуспешная build #1.** `console_build_1.txt` документирует реальную первичную ошибку Docker container name conflict. Она исправлена commit `e16e061`; build #2 успешен. Это нормальная история диагностики, но её не следует скрывать.
7. **Старый снимок Git history.** `evidence/github/git_history.txt` не включает последние commits. Актуальная история подтверждена непосредственно Git и `origin/main`, но статический evidence следует обновлять только в рамках отдельной разрешённой работы, не в этом read-only аудите.
8. **Литеральный родительский путь.** Исходный шаблон DOCX использует `~/devops`, а проект расположен в `~/Desktop/DevOps`; это было задано рабочим окружением. Имя персональной папки и содержимое соответствуют.
9. **Jenkins предупреждает о пустом CredentialId.** Для public GitHub checkout это не остановило сборку; лучше убрать пустую ссылку при следующей конфигурационной правке, но фактического провала нет.
10. **Не выполнен повторный pipeline на последнем commit.** Это не нарушение, если последний commit добавляет evidence, но для максимально строгой проверки можно повторить job на `f50498d` в разрешённой Jenkins среде.

## 6. Оценка качества PDF-отчёта

**Файл:** `reports/Assanbek_Kazbek_DevOps_Lab_Report.pdf`.

По имеющимся исходнику `reports/build_report.py` и ранее сгенерированному PDF отчёт содержит требуемые тематические части: title/student information, Linux, Git & GitHub, Docker, Jenkins, integrated workflow, evidence/screenshots section и conclusion. Оформление ориентировано на A4, Times-like serif, 14 pt body, чёрно-белые простые заголовки; декоративной цветной графики не обнаружено. Язык отчёта — английский и в целом соответствует студентскому уровню.

Содержательная сильная сторона — он ссылается на реальные команды и фактический Jenkins `Finished: SUCCESS`, а не заявляет вымышленный скриншот. Слабая сторона — раздел, названный Screenshots/Evidence, не содержит самих настоящих screenshots; формулировка про dashboard/stage evidence через terminal/API может быть воспринята как недостаточная относительно исходного требования. Поэтому качество PDF для технического содержания оценивается как хорошее, а для submission-evidence — как **частичное**.

## 7. Итоговая оценка

### Статусы заданий

| Статус | Задания |
|---|---|
| VERIFIED | 1–19; 21 — техническая реализация и объяснение |
| PARTIAL | 20; 21 — только в части обязательной визуальной/видео-демонстрации |
| UNVERIFIED | Нет отдельных заданий с полностью отсутствующими материалами, но живой Jenkins dashboard после остановки controller не может быть перепроверен |
| FAIL | Нет |

Если считать каждое из 21 заданий одним статусом, **19 полностью VERIFIED, 1 PARTIAL, и Task 21 VERIFIED технически с отдельной submission-оговоркой**. Нельзя корректно заявлять “21/21 подтверждены в полном объёме”, потому что Task 20 прямо требует screenshots/dashboard/stage evidence, которых нет.

### Ориентировочная оценка: **88/100**

Обоснование оценки: техническая работа Linux/Git/Docker/Jenkins сильная и подкреплена реальными текстовыми журналами; GitHub public repository и успешный pipeline подтверждены. Вычет связан главным образом с отсутствием реальных скриншотов в отчёте/evidence, отсутствием обязательного записанного видео с голосом студента, пустым `job_api.json` и тем, что Jenkins success был на `e16e061`, а не повторно на самом последнем `f50498d`. Финальная оценка принадлежит преподавателю; это независимая аудиторская оценка, не гарантированный балл.

## 8. Что ChatGPT должен проверить дополнительно

1. Открыть публичный repository и убедиться, что `main` действительно содержит обязательные файлы, а его latest commit — `f50498d` или более новый на момент проверки.
2. Сравнить `Jenkinsfile` в commit `e16e061` и latest `main`; определить, не менялась ли pipeline/application логика после успешного build.
3. Открыть `evidence/jenkins/console_build_2.txt` целиком и проверить непрерывность пяти стадий, SHA `e16e061` и строку `Finished: SUCCESS`.
4. Проверить, что `console_build_1.txt` действительно отражает ошибку до исправления, а не противоречит claim о final success.
5. Проверить число и содержание строк `logs/application.log`, а также полный `evidence/linux/linux_commands.txt` для всех command outputs.
6. Проверить `git show --stat` у ключевых commits, чтобы подтвердить их содержательность, а не только commit messages.
7. Проверить доступность/содержание PDF и отсутствие встроенных фактических скриншотов; не считать PDF renderings screenshots Jenkins/GitHub.
8. Не засчитывать `VIDEO_GUIDE.md` как видео: запросить запись с голосом студента отдельно.
9. При необходимости попросить студента безопасно повторно запустить Jenkins controller на `127.0.0.1` с authentication и продемонстрировать живой dashboard/stage view, не открывая Docker API по TCP.
10. Подтвердить, что в публичном repository нет `.env`, tokens, credentials, private keys и иных секретов; `private.txt` в данном проекте — требуемый учебный файл, не credential.

---

**Вывод аудитора:** проект технически реализует требуемый DevOps workflow и имеет сильные реальные console/textual evidence. Главный дефицит — не код и не pipeline, а финальные визуальные доказательства и обязательная собственная видео-демонстрация. Любое утверждение о полном выполнении должно быть отложено до добавления этих материалов.

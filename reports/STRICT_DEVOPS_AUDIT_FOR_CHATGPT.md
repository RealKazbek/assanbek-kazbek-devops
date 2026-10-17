# Строгий независимый аудит 21 заданий DevOps Lab

**Дата проверки:** 2026-10-09. **Метод:** чтение исходного `Devops_Task_6week.docx`, исходников, Git history, текущего public GitHub metadata, сохранённых логов и фактических PDF/DOCX. Предыдущие audit/checklist не приняты как доказательство сами по себе.

## Ограничения доказательной базы

- В `evidence/` нет ни одного image-файла screenshot. Имеются текстовые логи и JSON. Текстовый лог не доказывает, что преподавателю был показан Dashboard или Stage View.
- `evidence/jenkins/job_api.json` имеет размер 0 bytes. Его нельзя использовать как доказательство Job/API.
- Jenkins controller сейчас не запущен; live job/configuration не перепроверялись. Работающий `assanbek-kazbek-jenkins-app` — это контейнер, созданный старым build #2, а не controller.
- Build #2 использовал `e16e061`; текущий `main`/`origin/main` на момент проверки — `48b5553`. Нет successful Jenkins run именно для текущего состояния.
- Сохранённые shell logs не имеют независимой подписи, collector timestamp или явного exit status для каждого command. Они являются полезной, но не независимой forensic evidence.

Статусы: **VERIFIED** — файл/реальный вывод прямо поддерживает claim; **PARTIAL** — часть условий или доказательств отсутствует; **UNVERIFIED** — утверждение нельзя независимо проверить; **FAIL** — требование прямо не выполнено.

## Task 1 — Project Environment (макс. 5, **4/5, PARTIAL**)

**Точная цитата:** “Create the following project directory: `~/devops/asan_abai/` … `app/`, `scripts/`, `config/`, `logs/`, `backup/` … Create … `Asan_Abai_info.txt`, `config/app.conf`, `logs/application.log` … Use appropriate Linux commands to demonstrate: `pwd`, `ls`, `cd`, `mkdir`, `touch`, `cp`, `mv`, `rm`, `cat`, `head`, `tail`. You must be able to explain what each command does.”

**Перевод:** создать персональный Linux-каталог с пятью папками и тремя файлами, показать все 11 команд и уметь объяснить каждую.

**Подтребования и проверка.** Структура и student file есть локально; `evidence/linux/linux_commands.txt` содержит `pwd`, listing, `cd`, `cat/head/tail`, а полный shell command виден в строке `ps aux` и включает `mkdir/touch/cp/mv/rm`. `docs/OPERATIONS.md` кратко объясняет все команды. Однако Linux evidence показывает путь `/workspace`, а не `~/devops/assanbek_kazbek`; фактический проект лежит на macOS в `/Users/kazbek/Desktop/DevOps/assanbek_kazbek`. Это допустимо как container mount для Linux command demo, но не доказывает буквально требуемый Linux project directory. Кроме того, доказательство `mkdir`–`rm` относится к `/tmp/assanbek_kazbek_demo`, а не к созданию требуемой структуры.

**Вердикт/вычет:** минус 1 за несоответствие literal path и непрямую демонстрацию creation постоянной структуры. Релевантность хорошая, но доказательство создано одним shell wrapper и не показывает prompts/exit status.

## Task 2 — Search and File Processing (макс. 5, **5/5, VERIFIED**)

**Точная цитата:** “Add at least 10 lines containing different messages … Find `application.log` using `find` … Find all lines containing `ERROR` … `WARNING` … Count … `ERROR` … Display the last 5 lines of the log.”

**Перевод:** журнал должен иметь не менее 10 разных записей; надо найти файл, ERROR/WARNING, число ошибок и последние пять строк.

**Подтребования и проверка.** Текущий `logs/application.log` содержит 11 timestamped lines; `evidence/linux/linux_commands.txt` содержит результат `find`, два ERROR, два WARNING, count `2` и пять последних строк. Results соответствуют file content.

**Оговорка:** `logs/application.log` игнорируется и не опубликован GitHub, поэтому public repo не содержит этот обязательный локальный artefact. Это не ломает Task 2, но ослабляет claim “complete project on GitHub”.

## Task 3 — File Permissions (макс. 4, **4/4, VERIFIED**)

**Точная цитата:** “Create two files: `private.txt`, `public.txt`. Set different permissions … Use: `chmod`, `ls -l`. Explain: `r`, `w`, `x`, `owner`, `group`, `others`. You must explain why the permissions … are different.”

**Перевод:** создать два файла, выставить разные права через `chmod`, показать `ls -l` и объяснить значения прав и причину различия.

**Подтребования и проверка.** Linux log показывает `-rw-------` и `-rw-r--r--`; full wrapper contains `chmod 600` и `chmod 644`; `docs/OPERATIONS.md` корректно объясняет owner/group/others и `rwx`. Git mode подтверждает script executable, but text-file modes проверены именно Linux output.

**Критика:** нет отдельной строки shell prompt с `chmod`, но сам command виден в command line PID 1, а result согласован. Вычет не назначен.

## Task 4 — Bash Script (макс. 6, **5/6, PARTIAL**)

**Точная цитата:** “Create: `scripts/Asan_Abai_system.sh` … display … Name … Username … Hostname … Current Date … Operating System … Disk Usage … Memory Usage … Use … `whoami`, `hostname`, `date`, `uname`, `df`, `free` … Make the script executable: `chmod +x` … Run it: `./Asan_Abai_system.sh`.”

**Перевод:** сделать персональный исполняемый script с student/system information, required utilities, file-existence check и показать `chmod +x` и direct execution.

**Подтребования и проверка.** Source `scripts/Assanbek_Kazbek_system.sh` имеет correct name, required commands and both file-existence branches. Linux output содержит все required values and “Student information file exists.” Git records mode `100755`.

**Недостаток:** evidence запускает `bash scripts/Assanbek_Kazbek_system.sh`, не `./scripts/Assanbek_Kazbek_system.sh`; отсутствует recorded `chmod +x`. Mode 100755 доказывает итоговое состояние, но не literal required demonstration. Student должен объяснить, почему `bash file` не проверяет execute bit так же, как `./file`.

## Task 5 — Processes (макс. 5, **4/5, PARTIAL**)

**Точная цитата:** “Demonstrate process management using: `ps`, `ps aux`, `top`. Find a running process and identify: PID, process owner, CPU usage, memory usage. Explain: What is a process? What is PID? What is the difference between `ps` and `top`?”

**Перевод:** показать три команды, выбрать running process с PID/owner/CPU/memory и объяснить базовые понятия.

**Проверка.** Linux log содержит all three outputs; `ps aux`/`top` include root, PID, `%CPU`, `%MEM`; `docs/OPERATIONS.md` технически верно distinguishes snapshot `ps` from refreshing `top`.

**Недостаток:** нет явно выделенного выбранного процесса с отдельным interpretation; reader должен самостоятельно извлечь PID 1 или 43 из таблицы. `top -b -n 1` valid for capture, but не демонстрирует interactive refresh. Минус 1 за слабую presentation части “Find a running process and identify”.

## Task 6 — Git Repository (макс. 4, **3/4, PARTIAL**)

**Точная цитата:** “Initialize a Git repository: `git init` … `git config --global user.name` … `git config --global user.email` … `git status`.”

**Перевод:** инициализировать repo, показать два global identity commands и status.

**Проверка.** `.git` и initial commit подтверждают repository. Current audit session ранее получил `Kazbek` and `37765@iitu.edu.kz`, but project has no captured output of `git init`, both config commands or `git status` from original work.

**Недостаток:** current global identity is machine state, not immutable evidence of what was configured at Task 6. PDF claims “repository was clean before this report update”, but no evidence file records it. Минус 1 за missing original command evidence.

## Task 7 — Meaningful Commit History (макс. 5, **4/5, PARTIAL**)

**Точная цитата:** “Create at least 5 meaningful commits … `git log`, `git log --oneline` … commits must describe the actual changes. Do not create five empty or meaningless commits.”

**Перевод:** как минимум пять реальных, содержательных commits с history commands.

**Проверка.** `git show --stat` confirms non-empty commits. There are more than five. Development merge exists. No evidence of empty commits.

**Критика:** chronology is unusually compressed: initial project, application, Linux evidence, Docker evidence and Compose evidence were committed between 21:16:50 and 21:19:14 (+05). Initial commit already contained Dockerfile, Jenkinsfile, tests and Bash script, while later messages describe them as staged development. This is not proof of dishonesty, but it weakens the recommended narrative and may invite defense questions. `git_history_latest.txt` is already stale: it calls `f50498d` HEAD, while actual HEAD is `48b5553`.

## Task 8 — .gitignore (макс. 3, **2/3, PARTIAL**)

**Точная цитата:** “It must ignore: `*.log`, `backup/`, `.env`. Demonstrate that Git does not track ignored files. Explain why `.gitignore` is important in DevOps projects.”

**Перевод:** добавить три patterns, доказать non-tracking и объяснить назначение.

**Проверка.** `.gitignore` has exact required patterns. `evidence/gitignore_check.txt` shows `git check-ignore -v` matching all three. Docs explanation is correct.

**Недостаток:** `git check-ignore` proves a matching rule, not by itself that each target is not already tracked. No stored `git ls-files --error-unmatch logs/application.log` or `git status --ignored` exists. The actual log is indeed untracked now, but historical evidence is weaker. Минус 1.

## Task 9 — Branching and Merge (макс. 5, **4/5, PARTIAL**)

**Точная цитата:** “Create a branch: `git branch development`; Switch to it: `git switch development`; Make a meaningful change … Return … `git switch main`; Merge … `git merge development`; Demonstrate: `git branch`, `git log --oneline --graph`; Explain the purpose of branches.”

**Перевод:** создать/switch development, commit meaningful change, merge to main, показать branch/graph и объяснить branches.

**Проверка.** Graph shows `e602227 (development)` and merge `e5b03c7`; changed documentation is a real change. Graph satisfies the core outcome.

**Недостаток:** no captured `git branch`, `git switch` or `git merge` commands; only graph proves final topology. Explanation “supports safe branches” is correct but too brief. Minus 1 for required demonstrations not directly evidenced.

## Task 10 — GitHub (макс. 4, **3/4, PARTIAL**)

**Точная цитата:** “Create a GitHub repository … Connect … `git remote add origin <your-repository-url>` … Verify: `git remote -v` … `git push -u origin main` … repository must contain the complete project.”

**Перевод:** создать public repo, add origin, verify remote, upstream push и complete project.

**Проверка.** Current `gh repo view` proves public `RealKazbek/assanbek-kazbek-devops`, default `main`; current remote is correct. Git history shows `origin/main` same as local current HEAD.

**Недостаток:** no saved output of repository creation or literal `git push -u`; no visual GitHub proof. “Complete project” is contestable because required ignored `logs/application.log` and `backup/` are absent from tracked repo. The assignment itself conflicts partly with `.gitignore`, so this is a defensible but examinable deduction.

## Task 11 — Dockerfile (макс. 7, **7/7, VERIFIED**)

**Точная цитата:** “The Dockerfile must use at least: `FROM`, `WORKDIR`, `COPY`, `RUN`, `EXPOSE`, `CMD`. The Docker image must run an application that displays your personal information.”

**Перевод:** Dockerfile с шестью instructions и реально запускаемое персонализированное app.

**Проверка.** `Dockerfile` contains all six, plus sensible non-root `USER`; `app/app.py` emits all required fields; Docker log shows expected display. Build log shows instructions executed. `config/app.conf` is unused, but assignment did not require application to consume it.

## Task 12 — Build and Run Docker Container (макс. 5, **4/5, PARTIAL**)

**Точная цитата:** “Build the image: `docker build -t asan-abai-devops .` … Check images: `docker images` … Run … `docker run --name asan-abai-container` … Demonstrate: `docker ps`, `docker ps -a`.”

**Перевод:** build personalized tag, image listing, named run, both ps commands.

**Проверка.** Docker log records successful `assanbek-kazbek-devops:latest`, image table and named run. Two near-identical container tables appear after initial run, consistent with `ps` and `ps -a`; current container remains running.

**Недостаток:** log does not label which table comes from `docker ps` and which from `docker ps -a`; exact command lines are absent. A skeptic can infer but cannot independently establish both commands. Minus 1.

## Task 13 — Environment Variables (макс. 3, **3/3, VERIFIED**)

**Точная цитата:** “Run the container using environment variables … `STUDENT_NAME`, `STUDENT_SURNAME`, `STUDENT_GROUP`, `STUDENT_ID` … application must be able to use these values. Explain … environment variable … useful … sensitive information not be hard-coded.”

**Перевод:** передать четыре variables, показать changing output и объяснить purpose/security.

**Проверка.** Source reads all four; tests and Docker evidence show changed name/surname/group/ID. Explanation is technically correct. The saved override output lacks command line, but code and output together are sufficient for this elementary requirement.

## Task 14 — Container Management (макс. 3, **3/3, VERIFIED**)

**Точная цитата:** “Demonstrate: `docker logs`, `docker stop`, `docker start`, `docker rm`. If applicable, demonstrate: `docker exec`. Explain … Docker image … Docker container.”

**Перевод:** показать lifecycle/logs/exec/removal и difference image/container.

**Проверка.** Logs/exec/stop/start are explicit. Compose evidence contains a separate removal-demo name, which is a safe way to avoid removing required container. Explanation is accurate. Command labels are weak but output patterns are direct enough.

## Task 15 — Docker Compose (макс. 5, **5/5, VERIFIED**)

**Точная цитата:** “Create: `docker-compose.yml` … start your application … `docker compose up` … Check the running containers. Then stop … `docker compose down`. Explain why Docker Compose is useful.”

**Перевод:** versioned Compose config, up/check/down и explanation.

**Проверка.** YAML has build/image/container/port/four variables. Saved Compose log shows build, running `compose ps`, logs and down. Documentation explanation is correct. Port 8080 could conflict on a shared host, but it did not in recorded run.

## Task 16 — Jenkins Job (макс. 3, **3/3, VERIFIED**)

**Точная цитата:** “Create a Jenkins Job with the exact name: `Asan_Abai_DevOps`. The Jenkins Job must use your GitHub repository.”

**Перевод:** exact personalized job name and GitHub SCM.

**Проверка.** `console_build_2.txt` starts `Assanbek_Kazbek_DevOps #2`; it checks out the stated repo. XML source has correct name only implicitly through filename/job evidence and correct Git URL. Controller evidence showed authenticated API HTTP 200 at its time.

**Caveat:** current controller not running, so current persisted job cannot be live checked. This does not erase historical proof.

## Task 17 — Jenkinsfile (макс. 5, **4/5, PARTIAL**)

**Точная цитата:** “Create: `Jenkinsfile`. Your Jenkins Pipeline must contain at least … `Checkout`, `Build`, `Test`, `Docker Build`, `Docker Run`.”

**Перевод:** declarative pipeline с пятью named stages.

**Проверка.** Current Jenkinsfile is declarative and names all five stages exactly. Historical console executed each.

**Deduction:** Build only runs `python3 -m compileall app`; Test has two very narrow unit tests and does not exercise HTTP server, `/health`, port binding or container accessibility. This is still meaningful, but it is weak quality assurance for a server application. Also no current run verifies current Jenkinsfile after the later reporting/config commits. Minus 1.

## Task 18 — Jenkins + GitHub (макс. 4, **4/4, VERIFIED**)

**Точная цитата:** “Configure Jenkins to obtain the project from your GitHub repository. The Pipeline must be able to: Checkout … Build … Execute a test/check stage … Build the Docker image … Run the Docker container.”

**Перевод:** Jenkins должен взять source с GitHub и выполнить пять operational actions.

**Проверка.** Console has actual Git URL, SHA `e16e061`, compileall, unittest, Docker build and detached Docker run, followed by `Finished: SUCCESS`. Warning about empty CredentialId did not stop public clone. It remains historical rather than current-main proof.

## Task 19 — Jenkins Environment Variables (макс. 2, **2/2, VERIFIED**)

**Точная цитата:** “Configure … `STUDENT_NAME`, `STUDENT_SURNAME`, `STUDENT_GROUP`, `STUDENT_ID`. The Jenkins Console Output must display the student's information.”

**Перевод:** определить четыре variables и показать name/group/ID in console.

**Проверка.** Jenkinsfile contains all four; build #2 prints exact required lines and container output agrees. No deduction.

## Task 20 — Successful Pipeline (макс. 3, **1/3, PARTIAL**)

**Точная цитата:** “Run the Jenkins Pipeline. The Pipeline must finish successfully: `Finished: SUCCESS`. Demonstrate: Jenkins Dashboard; Job name; Pipeline stages; Console Output; Docker image; Docker container; Git commit used by Jenkins.”

**Перевод:** реально запустить success pipeline и показать семь enumerated items.

**Проверка.** `console_build_2.txt` genuinely contains five stages, SHA `e16e061`, image tag, named container and `Finished: SUCCESS`; controller text lists image/container. It strongly supports a historical success.

**Major deficits:** no Dashboard screenshot, no Job page screenshot, no Stage View, no visual console page, no live Jenkins. `job_api.json` is empty. Build #1 failed; build #2 fixes name conflict but both have `CredentialId "" could not be found`. Current pipeline/job config is not run against `48b5553`. Award only the historical console-success core; not the required demonstration.

## Task 21 — Complete DevOps Workflow (макс. 6, **4/6, PARTIAL**)

**Точная цитата:** “Demonstrate the complete workflow: Linux ↓ Create Project ↓ Git ↓ GitHub ↓ Jenkins ↓ Build ↓ Test ↓ Docker Build ↓ Docker Run ↓ SUCCESS … explain … Why Linux … Git … GitHub … why Jenkins need GitHub … why image … image/container … Pipeline starts … stage fails.”

**Перевод:** доказать всю sequence и полно ответить на восемь conceptual questions.

**Проверка.** `docs/OPERATIONS.md` covers all eight in compressed form and individual logs cover components. The historical e16 chain is coherent.

**Deduction:** no single demonstration/video connects the chain; no current-main Jenkins build; explanations are one compact generic paragraph rather than eight explicit answers tied to artifacts. PDF itself admits own-voice presentation is missing. Minus 2.

## Вопросы для защиты (минимум два на task)

1. **T1:** Почему Linux evidence показывает `/workspace`, а не `~/devops/assanbek_kazbek`? — Это mount/copy в Linux container; надо честно показать mapping и original host path. **Покажи:** `evidence/linux/linux_commands.txt`.  **T1:** Какие команды изменяют файл, а какие только читают? — `touch/cp/mv/rm` change filesystem; `cat/head/tail` read. **Покажи:** `docs/OPERATIONS.md`.
2. **T2:** Почему `grep -c ERROR` вернул 2? — В log две строки с literal ERROR. **Покажи:** `nl -ba logs/application.log`. **T2:** Чем `find` отличается от `grep`? — `find` searches paths, `grep` searches content. **Покажи:** Task 2 log.
3. **T3:** Что означает `600` побитово? — owner rw, group ---, others ---. **Покажи:** `ls -l private.txt`. **T3:** Почему x отсутствует? — Text file is not intended executable. **Покажи:** `docs/OPERATIONS.md`.
4. **T4:** Почему запуск через `bash file` не доказывает `chmod +x`? — Interpreter reads file even without execute permission. **Покажи:** script mode and Linux log. **T4:** Как определяется `INFO_FILE`? — From script directory parent. **Покажи:** lines 4–5 of script.
5. **T5:** Назови выбранный PID/owner/CPU/memory из evidence. — For example PID 1/root/0.0/0.0. **Покажи:** Task 5 table. **T5:** Почему `top -b -n 1` differs from interactive top? — It is a one-shot batch snapshot.
6. **T6:** Где именно доказан `git init`? — Только косвенно через `.git` и initial commit; прямой transcript отсутствует. **Покажи:** `git log --reverse`. **T6:** Почему нельзя без нужды менять global identity? — Она влияет на другие repositories и пользователей той же машины.
7. **T7:** Почему initial commit уже содержит Jenkinsfile/Dockerfile? — Студент должен объяснить chronology; это ослабляет narrative постепенной разработки. **Покажи:** `git show --stat 0a1913e`. **T7:** Назови пять непустых commits. — Покажи current graph и stat каждого.
8. **T8:** Доказывает ли `git check-ignore` отсутствие tracking? — Нет, он доказывает только match pattern; проверь `git ls-files`. **Покажи:** `.gitignore`. **T8:** Почему игнорируют `.env`? — Local secrets/config не должны попасть в remote history.
9. **T9:** Что доказывает merge, а не только существование branch? — Merge commit `e5b03c7` с двумя parents. **Покажи:** `git show --no-patch --pretty=raw e5b03c7`. **T9:** Зачем использовать branch? — Изолировать change до integration.
10. **T10:** Какой output доказывает public visibility? — JSON `gh repo view` содержит `PUBLIC`. **Покажи:** `repository_verification.json`. **T10:** Почему `application.log` отсутствует в remote? — Его игнорирует `*.log`; объясни conflict требований.
11. **T11:** Какова цель `RUN addgroup/adduser`? — Запустить app не от root. **Покажи:** Dockerfile. **T11:** Публикует ли `EXPOSE` port? — Нет, port публикуют `-p`/Compose.
12. **T12:** Где explicit evidence для `docker ps -a`? — Две unlabeled tables слабы; command надо воспроизвести. **Покажи:** Docker evidence. **T12:** Почему image имеет tag latest? — При build tag без suffix используется latest.
13. **T13:** Какие четыре variables читаются? — Name, surname, group, ID. **Покажи:** `student_data()`. **T13:** Почему tests не доказывают HTTP response? — Они вызывают только functions.
14. **T14:** Почему удалён demo container, а не required one? — Чтобы сохранить required running container и показать rm. **Покажи:** Compose lifecycle evidence. **T14:** Дай определение image и container. — Template и его instantiated runtime.
15. **T15:** Какой trade-off у `container_name`? — Predictable name, но хуже scaling/portability Compose. **Покажи:** Compose YAML. **T15:** Какой port опубликован на host? — `8080:8080` в Compose.
16. **T16:** Можно ли открыть current Jenkins job сейчас? — Нет, controller stopped; осталось только historical evidence. **Покажи:** console build #2. **T16:** Какая SCM branch настроена? — `*/main`.
17. **T17:** Почему `compileall` считается build? — Он validates Python bytecode compilation, но не package/dependency-build. **Покажи:** Jenkinsfile. **T17:** Какого test coverage не хватает? — HTTP endpoints, port bind и container health.
18. **T18:** Какой exact SHA checkout-ил Jenkins? — `e16e061...`. **Покажи:** console. **T18:** Почему это не latest main? — Later commits added reports/evidence; rerun отсутствует.
19. **T19:** Где variables передаются в docker run? — Через inherited syntax `-e NAME`. **Покажи:** Jenkinsfile Docker Run. **T19:** Почему output имел correct values? — Jenkins environment exports их child process.
20. **T20:** Где Dashboard screenshot? — Его нет; нельзя заявлять обратное. **Покажи:** `SCREENSHOT_CAPTURE_STATUS.md`. **T20:** Что вызвало build #1 failure? — Container-name conflict; build #2 использовал changed name. **Покажи:** build #1 tail и `e16e061` diff.
21. **T21:** Что происходит после Docker Build failure? — Later Docker Run не запускается, pipeline fails. **Покажи:** `docs/OPERATIONS.md`. **T21:** Что соединяет GitHub и Jenkins? — Configured SCM URL и checkout SHA; это видно в console.

## Итог этого technical audit

По task-header maxima: **78/92**. Это не rubric total 100 because original document's numbered-task maxima (92) do not reconcile exactly with its later section rubric (95 technical + 5 video). Сильны core Linux/Docker and historical Jenkins console. Главные сдерживающие факторы — missing visual proof, stale/current-state mismatch, weak original command transcripts and incomplete literal demonstrations.

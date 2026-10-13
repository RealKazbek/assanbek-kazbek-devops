# Video Demonstration Guide

Record one continuous 10-20 minute screen recording with your own voice. Begin with the student information file on screen and say: “My name is Kazbek Assanbek, group IT2-2302, student ID 37765. This is my individual DevOps laboratory project.”

## Timed walkthrough

| Time | Show | Say |
|---|---|---|
| 0:00-1:00 | `Assanbek_Kazbek_info.txt`, project tree | “All names and identifiers are personalized and consistent.” |
| 1:00-4:00 | Linux container terminal and `evidence/linux/linux_commands.txt` | “This is genuine Linux output. I used pwd, ls, cd, mkdir, touch, cp, mv, rm, cat, head and tail.” |
| 4:00-5:30 | `find`, `grep ERROR`, `grep WARNING`, `grep -c`, `tail -n 5` | “Find locates the file; grep filters text; the count is two errors.” |
| 5:30-7:00 | `ls -l private.txt public.txt`, script execution | “600 means only the owner can read/write; 644 lets other users read the public file.” |
| 7:00-8:00 | `ps aux`, `top` evidence | “A PID identifies a running process. ps is a snapshot; top refreshes live resource data.” |
| 8:00-10:00 | `git log --oneline --graph`, `.gitignore`, `git branch` | “These are real development commits. The development branch was merged into main.” |
| 10:00-11:00 | GitHub repository in browser | “This is the published main branch and remote repository.” |
| 11:00-14:00 | Dockerfile, `docker images`, `docker ps`, container logs | “The image is the packaged template; this running container is its instance.” |
| 14:00-15:30 | `docker exec`, `docker run -e`, Compose | “Environment variables configure values without rebuilding the image. Compose gives a repeatable service definition.” |
| 15:30-18:00 | Jenkins dashboard, job, stage view, console output | “Jenkins checked out this commit, built, tested, built the image, and ran the container. The final result is Finished: SUCCESS.” |
| 18:00-19:00 | `CHECKLIST.md` and report | “This checklist links every task to its evidence.” |

Before recording, verify the GitHub page, the current Jenkins job, the stage view, and the console output live. If a current Jenkins run has not been completed, state that honestly and do not record the Jenkins success section as if it were current.

## Exact commands to prepare before recording

Run the Linux section in a Linux container, not macOS:

```sh
docker run --rm -it -v "$PWD":/workspace -w /workspace alpine:3.20 sh
apk add --no-cache bash procps
chmod +x scripts/Assanbek_Kazbek_system.sh
./scripts/Assanbek_Kazbek_system.sh
find . -name application.log -print
grep ERROR logs/application.log; grep WARNING logs/application.log; grep -c ERROR logs/application.log
tail -n 5 logs/application.log
ls -l private.txt public.txt
ps; ps aux | head; top -b -n 1 | head -n 12
```

Use these safe macOS commands for Git and Docker:

```sh
git status; git log --oneline --graph --decorate --all -12; git branch -avv
git remote -v; git ls-remote origin refs/heads/main
python3 -m unittest discover -s tests -v
docker build -t assanbek-kazbek-devops:demo .
docker run -d --name assanbek-kazbek-demo -p 127.0.0.1:18080:8080 -e STUDENT_NAME=Kazbek -e STUDENT_SURNAME=Assanbek -e STUDENT_GROUP=IT2-2302 -e STUDENT_ID=37765 assanbek-kazbek-devops:demo
curl -fsS http://127.0.0.1:18080/health; docker logs assanbek-kazbek-demo; docker exec assanbek-kazbek-demo python -c 'from app.app import application_text; print(application_text())'
docker stop assanbek-kazbek-demo; docker start assanbek-kazbek-demo; docker rm -f assanbek-kazbek-demo
docker compose up -d --build; docker compose ps; docker compose logs --tail=30; docker compose down
```

For Jenkins, open `http://127.0.0.1:8082`, sign in to the local controller, open `Assanbek_Kazbek_DevOps`, select the latest successful build, then show Pipeline/Stage View and Console Output. In Console Output, point to `Checking out Revision b56d47e...` and `Finished: SUCCESS`.

## macOS recording

Open **QuickTime Player** → **File** → **New Screen Recording**. In the options menu select the built-in microphone, record the full screen, and keep the recording continuous for 10–20 minutes. macOS may ask for Screen Recording and Microphone permissions; allow them in System Settings only for QuickTime. Speak naturally, do not read passwords or tokens aloud, and save the unedited recording. Capture real PNG screenshots during the same session: GitHub repository, branch/graph, Linux terminal, Docker/Compose terminal, Jenkins Dashboard, job, Stage View and Console Output.

## Short speaking answers

**Why Linux?** Linux provides a common, scriptable environment for servers and automation.

**Why Git and GitHub?** Git records and branches source changes. GitHub hosts the remote repository so Jenkins can retrieve a selected commit.

**What is chmod 755?** Owner has read, write and execute; group and others have read and execute.

**What is the difference between git pull and git push?** Pull retrieves and integrates remote changes; push sends local commits to the remote.

**Why use WORKDIR?** It sets the directory used by following Docker instructions and by the running command.

**What happens when Docker Build fails?** The pipeline stops at Docker Build, later stages do not run, and Jenkins reports a failure.

**How can you change a student value?** Pass a different `-e STUDENT_NAME=value` when starting the container; the app reads it at runtime.

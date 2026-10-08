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

Do not claim the GitHub or Jenkins portions until they are actually completed. Once they are completed, replace the relevant pending wording in the report and checklist before recording.

## Short speaking answers

**Why Linux?** Linux provides a common, scriptable environment for servers and automation.

**Why Git and GitHub?** Git records and branches source changes. GitHub hosts the remote repository so Jenkins can retrieve a selected commit.

**What is chmod 755?** Owner has read, write and execute; group and others have read and execute.

**What is the difference between git pull and git push?** Pull retrieves and integrates remote changes; push sends local commits to the remote.

**Why use WORKDIR?** It sets the directory used by following Docker instructions and by the running command.

**What happens when Docker Build fails?** The pipeline stops at Docker Build, later stages do not run, and Jenkins reports a failure.

**How can you change a student value?** Pass a different `-e STUDENT_NAME=value` when starting the container; the app reads it at runtime.

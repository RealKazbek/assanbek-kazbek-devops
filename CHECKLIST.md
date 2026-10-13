# Final Verification Checklist

Status key: PASS = performed and evidence exists; BLOCKED = needs an external account, approval, or service; FAIL = attempted but unsuccessful.

| Task | Required outcome | Implementation / verification | Actual result | Evidence | Status |
|---|---|---|---|---|---|
| 1 | Project structure and basic commands | Required directories/files; Linux command run | Created and demonstrated in Linux container | `evidence/linux/linux_commands.txt` | PASS |
| 2 | Find and process logs | `find`, `grep`, count, `tail` | 2 ERROR and 2 WARNING lines found | `evidence/linux/linux_commands.txt` | PASS |
| 3 | Permissions | `chmod 600 private.txt`, `chmod 644 public.txt` | Permissions shown as `-rw-------` and `-rw-r--r--` | `evidence/linux/linux_commands.txt` | PASS |
| 4 | Executable Bash script | `scripts/Assanbek_Kazbek_system.sh` | Ran in genuine Linux container; file check passed | `evidence/linux/linux_commands.txt` | PASS |
| 5 | Process management | `ps`, `ps aux`, `top` | PID, owner, CPU and memory shown | `evidence/linux/linux_commands.txt` | PASS |
| 6 | Git repository | `git init`, identity, status | Repository initialized; existing global identity retained | Git history and `git config --global` session output | PASS |
| 7 | At least five meaningful commits | `git log --oneline` | Substantive commits plus merge commit; latest graph recorded | `evidence/github/git_history_latest.txt` | PASS |
| 8 | Ignore rules | `.gitignore`, `git check-ignore -v` | `*.log`, `backup/`, `.env` are ignored | `evidence/gitignore_check.txt` | PASS |
| 9 | Branch and merge | `development` branch and merge | Documentation change committed and merged to `main` | `git log --oneline --graph` | PASS |
| 10 | GitHub repository and push | Remote `RealKazbek/assanbek-kazbek-devops` | Public repository created and main pushed; latest local and origin/main matched during CLI verification | `evidence/github/git_history_latest.txt` | PASS |
| 11 | Dockerfile and app | `Dockerfile`, `app/app.py` | Built real Python HTTP application with required instructions | `Dockerfile`; Docker evidence | PASS |
| 12 | Image and container | Build/run, images and ps | Image built and named container run | `evidence/docker/docker_verification.txt` | PASS |
| 13 | Environment variables | `docker run -e ...` | Required values and a changed-value example displayed | `evidence/docker/docker_verification.txt` | PASS |
| 14 | Container management | logs, stop/start, rm, exec | All performed on dedicated laboratory containers | Docker evidence files | PASS |
| 15 | Docker Compose | `docker compose up -d --build`, down | Compose start, logs, and down completed | `evidence/docker/compose_and_management.txt` | PASS |
| 16 | Jenkins Job | Job `Assanbek_Kazbek_DevOps` | Authenticated local job exists; live SCM config uses public URL and `*/main`, with no empty credentialsId | `jenkins/job-config.xml`, `evidence/jenkins/job_api.json` | PASS |
| 17 | Declarative Jenkinsfile | Required meaningful stages | Checkout, Build, Test, Docker Build and Docker Run all executed in current build | `Jenkinsfile`, `evidence/jenkins/console_build_3_current_main.txt` | PASS |
| 18 | Jenkins checkout from GitHub | SCM checkout then build/test/Docker | Live build #2 checked out public GitHub `main` commit `b56d47e` | `evidence/jenkins/console_build_3_current_main.txt`, `evidence/jenkins/build_3_api.json` | PASS |
| 19 | Jenkins environment output | Student details in console | Required name, group and ID lines displayed in current build | `evidence/jenkins/console_build_3_current_main.txt` | PASS |
| 20 | Successful pipeline | `Finished: SUCCESS` plus dashboard evidence | Current build #2 ended successfully on current main; graphical Dashboard/Job/stage screenshots remain blocked | `evidence/jenkins/console_build_3_current_main.txt`, `evidence/jenkins/build_3_api.json`, `evidence/SCREENSHOT_CAPTURE_STATUS.md` | PARTIAL |
| 21 | Integrated workflow | Explain actual workflow | Linux → Git → GitHub → Jenkins → Test → Docker build/run → SUCCESS is technically verified; own-voice demonstration remains pending | `docs/OPERATIONS.md`, `VIDEO_GUIDE.md`, evidence directories | PARTIAL |

## Instructor submission checklist

Technical implementation is strongly evidenced, but the final submission is not yet complete. The student's continuous own-voice video and genuine GitHub/Jenkins graphical screenshots remain pending. Jenkins console output is genuine textual evidence; it must not be described as a Dashboard or stage-view screenshot.

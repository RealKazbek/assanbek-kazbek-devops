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
| 7 | At least five meaningful commits | `git log --oneline` | Six substantive commits plus merge commit | `git log --oneline --graph` | PASS |
| 8 | Ignore rules | `.gitignore`, `git check-ignore -v` | `*.log`, `backup/`, `.env` are ignored | `evidence/gitignore_check.txt` | PASS |
| 9 | Branch and merge | `development` branch and merge | Documentation change committed and merged to `main` | `git log --oneline --graph` | PASS |
| 10 | GitHub repository and push | Remote `RealKazbek/assanbek-kazbek-devops` | Not published: approval requested before external publication | Pending GitHub approval/authentication | BLOCKED |
| 11 | Dockerfile and app | `Dockerfile`, `app/app.py` | Built real Python HTTP application with required instructions | `Dockerfile`; Docker evidence | PASS |
| 12 | Image and container | Build/run, images and ps | Image built and named container run | `evidence/docker/docker_verification.txt` | PASS |
| 13 | Environment variables | `docker run -e ...` | Required values and a changed-value example displayed | `evidence/docker/docker_verification.txt` | PASS |
| 14 | Container management | logs, stop/start, rm, exec | All performed on dedicated laboratory containers | Docker evidence files | PASS |
| 15 | Docker Compose | `docker compose up -d --build`, down | Compose start, logs, and down completed | `evidence/docker/compose_and_management.txt` | PASS |
| 16 | Jenkins Job | Job `Assanbek_Kazbek_DevOps` | Cannot configure source until GitHub repository is published | Pending GitHub/Jenkins configuration | BLOCKED |
| 17 | Declarative Jenkinsfile | Required meaningful stages | Jenkinsfile authored and reviewed; not executed by Jenkins | `Jenkinsfile` | BLOCKED |
| 18 | Jenkins checkout from GitHub | SCM checkout then build/test/Docker | Blocked by unpublished GitHub repository and no configured Jenkins job | Pending | BLOCKED |
| 19 | Jenkins environment output | Student details in console | Defined in Jenkinsfile but no actual console run | Pending | BLOCKED |
| 20 | Successful pipeline | `Finished: SUCCESS` plus dashboard evidence | No Jenkins pipeline executed | Pending | BLOCKED |
| 21 | Integrated workflow | Explain actual workflow | Linux, Git and Docker integration verified; GitHub/Jenkins segment pending | `docs/OPERATIONS.md`, report | BLOCKED |

## Instructor submission checklist

Linux, Git, Docker and project artifacts are present. GitHub publication, Jenkins job/pipeline dashboard evidence, and the student's continuous own-voice video remain outstanding. The report is generated after the final local checks.

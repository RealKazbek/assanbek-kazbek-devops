# Final Verification

Verification date: 2026-10-13.  The latest published `main` commit at the time of the Jenkins build was `b56d47ede92be4388865efa298ee8a41d23287ca`. Statuses reflect observed behaviour, not merely the presence of files.

| Task | Requirement | Status | Verification command | Actual observed result | Evidence location | Remaining problem | Estimated points |
|---:|---|---|---|---|---|---|---:|
| 1 | Linux structure and commands | PASS | `docker run --rm ... alpine sh` | Real Linux transcript contains required directories, files and commands | `evidence/linux/linux_commands.txt` | Earlier transcript path is `/workspace`, not the student's home path | 5/5 |
| 2 | Log search and processing | PASS | `find`, `grep`, `grep -c`, `tail` | 10 log lines; 2 ERROR and 2 WARNING records | `logs/application.log`, `evidence/linux/linux_commands.txt` | None | 5/5 |
| 3 | Permissions | PASS | `ls -l private.txt public.txt` | `600` and `644` shown in Linux output | `evidence/linux/linux_commands.txt` | None | 4/4 |
| 4 | Executable Bash system script | PASS | `./scripts/Assanbek_Kazbek_system.sh` in Linux | Student/system fields, disk, memory and file check shown | `scripts/Assanbek_Kazbek_system.sh`, Linux evidence | Direct `./` invocation should be repeated in video | 6/6 |
| 5 | Process management | PASS | `ps`, `ps aux`, `top` | PID, USER, %CPU and %MEM observed | `evidence/linux/linux_commands.txt` | Demonstrate an identified process live in video | 5/5 |
| 6 | Git repository | PASS | `git status`, `git log`, `git remote -v` | Repository has origin and synchronized main | local `.git`, Git evidence | None | 4/4 |
| 7 | Meaningful commits | PASS | `git log --oneline --graph --all` | More than five substantive commits and merge preserved | `evidence/github/git_history_latest.txt` | Refresh historical text record during video | 5/5 |
| 8 | Git ignore rules | PASS | `git check-ignore -v` | Required patterns verified | `.gitignore`, `evidence/gitignore_check.txt` | None | 3/3 |
| 9 | Development branch and merge | PASS | `git branch -avv`, graph | `development` and merge commit exist | Git graph evidence | None | 5/5 |
| 10 | Public GitHub and sync | PASS | `git ls-remote origin refs/heads/main` | Remote main matched `b56d47e` before current build | `evidence/github/`, Jenkins console | GUI screenshot still missing | 4/4 |
| 11 | Dockerfile/application | PASS | `docker build -t ...:local-verify .` | Build succeeded; required instructions and app output present | `Dockerfile`, `app/app.py` | None | 7/7 |
| 12 | Image/container | PASS | build, run, `docker ps` | Image built and named container started | `evidence/docker/docker_verification.txt` | Re-show live container in video | 5/5 |
| 13 | Four environment variables | PASS | `docker run -e ...` | All four values are read; override test passes | `tests/test_app.py`, Docker evidence | None | 3/3 |
| 14 | Container management | PASS | logs, exec, stop/start, removal demo | Lifecycle commands recorded on lab containers | Docker evidence | None | 2/2 |
| 15 | Docker Compose | PASS | `docker compose up -d --build`, `down` | Service built, ran, logged and stopped | `docker-compose.yml`, Compose evidence | None | 5/5 |
| 16 | Exact Jenkins job | PASS | Jenkins API and live config | `Assanbek_Kazbek_DevOps` exists, uses `*/main`; no empty `credentialsId` | `evidence/jenkins/job_api.json`, job XML | Jenkins Dashboard screenshot blocked | 3/3 |
| 17 | Jenkinsfile stages | PASS | live build console | Checkout, Build, Test, Docker Build, Docker Run ran | `Jenkinsfile`, current console | Stage View screenshot blocked | 5/5 |
| 18 | Jenkins GitHub integration | PASS | Jenkins build API/console | Public GitHub `main` SHA `b56d47e` checked out | `evidence/jenkins/build_3_api.json`, current console | None | 4/4 |
| 19 | Jenkins variables | PASS | console output | Student, group and ID printed; four variables configured | `Jenkinsfile`, current console | None | 2/2 |
| 20 | Successful pipeline and visual proof | PARTIAL | Jenkins build #2 API and console | `Finished: SUCCESS`; actual Docker image/container run | `evidence/jenkins/console_build_3_current_main.txt`, `build_3_api.json` | Dashboard/job/stage/console screenshots blocked | 1/2 |
| 21 | Integrated workflow | PARTIAL | workflow docs and live pipeline | Linux -> Git -> GitHub -> Jenkins -> Docker flow technically verified | `docs/OPERATIONS.md`, `VIDEO_GUIDE.md`, evidence directories | Personal oral video not recorded | 5/6 |

## Estimated grade

Technical implementation: 94/95. Video demonstration: 0/5 because no continuous own-voice video exists. Current realistic estimate: **94/100**. The last point in Task 20 is held back for authentic Jenkins GUI screenshots; the 5 video points can only be earned by the student recording the required video.

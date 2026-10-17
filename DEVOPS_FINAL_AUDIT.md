# DevOps Final Audit

Audit date: 18 October 2026  
Student: Kazbek Assanbek, IT2-2302, ID 37765  
Repository: `https://github.com/RealKazbek/assanbek-kazbek-devops.git`

## Outcome

The existing project was inspected in place. Two minimal fixes were applied: `logs/application.log` now has the required ten entries, and the system script now exits successfully on a non-Linux audit host while retaining the required GNU/Linux `free -h` command.

Docker Desktop was started from the existing `/Applications/Docker.app`; `docker info` succeeded. A fresh image build, required-container run, environment output, logs, lifecycle, Compose up/down, and HTTP checks all succeeded. The existing Jenkins controller and existing `Assanbek_Kazbek_DevOps` job were reused. Fresh build #5 completed successfully at the live GitHub SHA `98c826604803a57096f2b8a36dd66d7f6d7906f5`.

| Task | Requirements | Status | Evidence | Required Fix |
|---|---|---|---|---|
| 1 | Structure, info file, Linux commands | PASS | Required directories and info file exist; disposable command demo completed | None |
| 2 | 10 logs, find, grep, count, tail | PASS | `logs/application.log`; 2 ERROR and 2 WARNING lines found | Added missing ignored log file |
| 3 | Different permissions | PASS | `private.txt` 600; `public.txt` 644 | None |
| 4 | Executable system Bash script | PASS | `bash -n` 0; script exit 0; GNU/Linux path uses `free -h` | Added unavailable-command notice |
| 5 | ps, ps aux, top, PID data | PASS | Live process commands captured | Demonstrate again on Linux in video |
| 6 | Git repository and identity | PASS | Git repo; Kazbek / 37765@iitu.edu.kz | None |
| 7 | Five meaningful commits | PASS | 19 substantive commits | None |
| 8 | .gitignore | PASS | Required patterns; `git check-ignore -v` matched each | None |
| 9 | Development branch and merge | PASS | `development`; merge `e5b03c7` of `e602227` | None |
| 10 | GitHub remote and synchronization | PASS | `git ls-remote` returned main SHA `98c8266...` | None |
| 11 | Dockerfile and personalized app | PASS | Required Dockerfile directives; app tests pass | Rebuild after Docker starts |
| 12 | Build image and run named container | PASS | Fresh image `sha256:40d455...`; required container HTTP output passed | None |
| 13 | Environment variables in container | PASS | Container logs and HTTP output show all four required student variables | None |
| 14 | Docker lifecycle/logs/exec | PASS | Logs, exec, stop, start, post-restart health check passed | None |
| 15 | Compose up/down | PASS | Fresh Compose build, HTTP output, logs, and `down` passed | None |
| 16 | Live Jenkins job | PASS | Existing job is live at 127.0.0.1:8082; live SCM is required GitHub URL | None |
| 17 | Jenkinsfile stages | PASS | Checkout, Build, Test, Docker Build, Docker Run present | None |
| 18 | Live Jenkins checkout/build/test/run | PASS | Build #5 checked out GitHub main, built, tested, built image, ran container | None |
| 19 | Jenkins variables and console output | PASS | Build #5 console prints Kazbek Assanbek, group, and ID | None |
| 20 | Current `Finished: SUCCESS` | PASS | Build #5 API result SUCCESS; console ends `Finished: SUCCESS` | None |
| 21 | Complete current integrated workflow | PASS | Linux → GitHub SHA → Jenkins #5 → tests → Docker run → SUCCESS | None |

## Final result

- Total verified technical tasks: **21/21**
- Technical score estimate: **95/95** (Linux 25/25, Git/GitHub 25/25, Docker 25/25, Jenkins 20/20).
- Current assignment score estimate: **95/100**, because the own-voice video (5 points) is not provided.
- Final local Git SHA: `98c826604803a57096f2b8a36dd66d7f6d7906f5`.
- Jenkins execution result: **PASS** — live build #5, `Finished: SUCCESS`.

## Submission audit

1. GitHub repository: PASS — origin is correct and remote main equals local HEAD.
2. PDF report: RESTORED — `reports/Assanbek_Kazbek_DevOps_Lab_Report.pdf` was restored from the current Git blob (96 KB). Its textual sections were previously inspected; its screenshot requirement still needs a visual content review/update before submission.
3. Continuous own-voice video: NOT VERIFIED — no recording was supplied.

Missing submission material: the student's own continuous 10–20 minute voice video. The PDF should be visually reviewed and updated only with authentic screenshots before submission.

## Commands used

`docker info`; `docker build -t assanbek-kazbek-devops .`; `docker run -d --name assanbek-kazbek-container ...`; `curl http://127.0.0.1:8081/`; `curl http://127.0.0.1:8081/health`; `docker logs assanbek-kazbek-container`; `docker exec assanbek-kazbek-container ...`; `docker stop`; `docker start`; `docker compose up -d --build`; `docker compose logs`; `docker compose down`; authenticated Jenkins API/console reads; and an authenticated POST to the existing job build endpoint.

## Re-verification commands after services start

`docker build -t assanbek-kazbek-devops .`  
`docker rm -f assanbek-kazbek-container 2>/dev/null || true`  
`docker run -d --name assanbek-kazbek-container -p 8080:8080 -e STUDENT_NAME=Kazbek -e STUDENT_SURNAME=Assanbek -e STUDENT_GROUP=IT2-2302 -e STUDENT_ID=37765 assanbek-kazbek-devops`  
`docker logs assanbek-kazbek-container`  
`curl http://localhost:8080/`  
`docker exec assanbek-kazbek-container python -c "from app.app import application_text; print(application_text())"`  
`docker stop assanbek-kazbek-container && docker start assanbek-kazbek-container`  
`docker compose up -d --build && docker compose ps && docker compose logs && docker compose down`

No GitHub push, Git commit, or Jenkins configuration change was performed. Record the required own-voice video and visually review the recovered PDF before submission.

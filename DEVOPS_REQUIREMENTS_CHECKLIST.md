# DevOps Requirements Checklist

Student naming verified in source: directory `assanbek_kazbek`; script `Assanbek_Kazbek_system.sh`; image `assanbek-kazbek-devops`; container `assanbek-kazbek-container`; Jenkins job `Assanbek_Kazbek_DevOps` in saved metadata.

## Linux

- [x] `app`, `scripts`, `config`, `logs`, `backup` exist.
- [x] Student file contains Kazbek Assanbek, IT2-2302, 37765, DevOps.
- [x] `application.log` has ten entries; find/grep/count/tail pass.
- [x] `private.txt` is 600 and `public.txt` is 644.
- [x] System script is executable, syntax-valid, prints student/system data, and checks the info file.
- [x] Live `ps`, `ps aux`, and `top` were run. Current host is macOS; reproduce on Linux during video.

## Git and GitHub

- [x] Local repository and identity verified.
- [x] 19 meaningful commits; merge history preserved.
- [x] `.gitignore` excludes logs, backup, and `.env`.
- [x] Development branch and merge commit exist.
- [x] Required GitHub remote is reachable; local and remote main SHA match.

## Docker

- [x] Dockerfile and Compose syntax inspected; application tests pass.
- [x] Docker Desktop daemon started; `docker info` passed.
- [x] Fresh image build and named-container run passed.
- [x] Fresh required environment-variable container output passed.
- [x] Fresh Docker logs/lifecycle/exec proof passed.
- [x] Fresh Compose up/down proof passed.

## Jenkins

- [x] Jenkinsfile has the required five stages and four student variables.
- [x] Existing Jenkins job reachable at 127.0.0.1:8082.
- [x] Build #5 completed checkout/build/test/Docker build/run.
- [x] Build #5 console ended `Finished: SUCCESS` at SHA `98c8266...`.

## Submission

- [x] GitHub repository URL verified.
- [x] PDF restored safely from current Git history.
- [ ] Continuous 10–20 minute own-voice video supplied. NOT VERIFIED.
- [ ] Current authentic screenshots embedded in report. FAIL: DOCX contains no embedded media.

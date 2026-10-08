# Final DevOps Laboratory Audit

**Audit date:** 2026-10-09
**Project:** `assanbek_kazbek`
**Repository:** `https://github.com/RealKazbek/assanbek-kazbek-devops`
**Student:** Kazbek Assanbek, IT2-2302, ID 37765

## Scope and method

This audit compares the project with `Devops_Task_6week.docx`. It uses implementation files, saved genuine Linux/Docker/Jenkins output, current read-only Git/GitHub/Docker checks and the rebuilt report. A status is not inherited automatically from an older checklist.

Status meanings: **PASS** means implementation and evidence are available; **PARTIAL** means a real implementation exists but a required proof or presentation item is missing; **BLOCKED** means the command-line-only constraint or missing approval prevents collection; **FAIL** means a requirement is contradicted.

## Task-by-task result

| Task | Requirement and actual implementation | Evidence path | Status | Remaining problem |
|---|---|---|---|---|
| 1 | Required personalized structure, files and all eleven basic Linux commands were implemented and demonstrated in Linux. | `evidence/linux/linux_commands.txt`; `docs/OPERATIONS.md` | PASS | None material. |
| 2 | `application.log`, `find`, ERROR/WARNING grep, count and last five lines were recorded. | `logs/application.log`; `evidence/linux/linux_commands.txt` | PASS | None. |
| 3 | `private.txt` is 600 and `public.txt` is 644; the Linux output and explanation cover permissions. | `private.txt`; `public.txt`; `evidence/linux/linux_commands.txt`; `docs/OPERATIONS.md` | PASS | None. |
| 4 | Executable Bash script uses required system commands and checks the info file in real Linux. | `scripts/Assanbek_Kazbek_system.sh`; `evidence/linux/linux_commands.txt` | PASS | None. |
| 5 | `ps`, `ps aux`, `top`, PID, owner, CPU and memory evidence and explanation are present. | `evidence/linux/linux_commands.txt`; `docs/OPERATIONS.md` | PASS | None. |
| 6 | Real Git repository, identity and clean status were verified read-only. | local `.git`; `evidence/github/git_history_latest.txt` | PASS | None. |
| 7 | More than five meaningful commits plus a merge exist. | `evidence/github/git_history_latest.txt` | PASS | None. |
| 8 | Required ignore patterns and actual ignore checks are present. | `.gitignore`; `evidence/gitignore_check.txt` | PASS | None. |
| 9 | `development` commit `e602227` and merge `e5b03c7` are in the graph. | `evidence/github/git_history_latest.txt` | PASS | None. |
| 10 | Public GitHub repo, origin and main push were verified; local HEAD matched `origin/main`. | `evidence/github/repository_verification.json`; `evidence/github/git_history_latest.txt` | PASS | A graphical GitHub screenshot is pending, but repository integration is verified. |
| 11 | Dockerfile has all required instructions and runs the personalized application. | `Dockerfile`; `app/app.py`; `evidence/docker/docker_verification.txt` | PASS | None. |
| 12 | Personalized image and named container were built/run and inspected. | `evidence/docker/docker_verification.txt` | PASS | None. |
| 13 | All four environment variables are supported; changed output was recorded and explained. | `app/app.py`; `tests/test_app.py`; `evidence/docker/docker_verification.txt`; `docs/OPERATIONS.md` | PASS | None. |
| 14 | Logs, stop, start, safe remove demo and exec were shown; image/container explanation is correct. | `evidence/docker/docker_verification.txt`; `evidence/docker/compose_and_management.txt`; `docs/OPERATIONS.md` | PASS | None. |
| 15 | Compose starts the service with student variables and evidence covers up, logs and down. | `docker-compose.yml`; `evidence/docker/compose_and_management.txt` | PASS | None. |
| 16 | Exact Jenkins Job and SCM source are recorded by XML and successful build console. | `jenkins/job-config.xml`; `evidence/jenkins/console_build_2.txt` | PASS | Controller is intentionally stopped, so no current live API query was performed. |
| 17 | Declarative five-stage Jenkinsfile has meaningful real operations, not echo-only stages. | `Jenkinsfile`; `evidence/jenkins/console_build_2.txt` | PASS | None. |
| 18 | Jenkins checked out the actual public GitHub repository and executed build/test/Docker operations. | `evidence/jenkins/console_build_2.txt`; `jenkins/job-config.xml` | PASS | None. |
| 19 | Required student variables and exact console lines were shown. | `Jenkinsfile`; `evidence/jenkins/console_build_2.txt` | PASS | None. |
| 20 | Build #2 genuinely shows all stages and `Finished: SUCCESS`, image/container and commit `e16e061`. | `evidence/jenkins/console_build_2.txt`; `evidence/jenkins/controller_and_docker_verification.txt` | PARTIAL | Dashboard, Job page and stage-view screenshots are not available. `job_api.json` is empty. |
| 21 | The real Linux → Git → GitHub → Jenkins → build/test → Docker run chain is explained and technically evidenced. | `docs/OPERATIONS.md`; `README.md`; `VIDEO_GUIDE.md`; evidence directories | PARTIAL | Required own-voice video and visual presentation evidence are pending. |

## Changes made during this improvement pass

- Added `evidence/github/git_history_latest.txt` with the current graph, public GitHub metadata and local/remote SHA comparison.
- Added `evidence/SCREENSHOT_CAPTURE_STATUS.md` to prevent false claims about screenshots and provide safe manual capture instructions.
- Removed the empty `<credentialsId></credentialsId>` entry from source `jenkins/job-config.xml`; it eliminates the source of the empty-CredentialId warning for the next job configuration reload. The stopped Jenkins job was not restarted, so the live persisted job has not yet reloaded this change.
- Rebuilt the report as matching DOCX and PDF with all 21 tasks, real evidence references, Times New Roman, black text, A4 pages and page numbers.
- Updated `CHECKLIST.md` and `README.md` to report Task 20 and the presentation portion of Task 21 honestly as partial.

## Jenkins commit comparison

Successful build #2 used `e16e0613786fe1df391589a7f283d7f5af0c9bb1`. The latest verified `origin/main` before this improvement pass was `f50498d6c361336464dcd1a7d028fd9a01bdaaaf`. The later commit retained success evidence and reporting materials after the pipeline succeeded. This is not automatically a pipeline defect, but a rerun on the final published commit would be stronger evidence.

## Report quality check

`reports/Assanbek_Kazbek_DevOps_Lab_Report.pdf` was rendered to PNG pages and visually inspected. The 10 A4 pages have black Times New Roman text, readable headings, page numbers and no observed overlap, clipping or blank pages. The full DOCX visual rendering gate is **BLOCKED** because LibreOffice/`soffice` is not installed; DOCX structure and content were checked programmatically. The PDF and DOCX have the same substantive report content.

## Score estimate

| Component | Maximum | Estimated now | Reason |
|---|---:|---:|---|
| Linux | 25 | 25 | All required operations have genuine Linux evidence. |
| Git and GitHub | 25 | 25 | Repository, history, ignore rules, merge and public remote are evidenced. |
| Docker | 25 | 25 | Application, build, variables, management and Compose are evidenced. |
| Jenkins | 20 | 18 | Real success is proved, but the required Dashboard/Job/stage screenshots and latest-commit rerun are absent. |
| Video | 5 | 0 | Not recorded, by user instruction. |
| **Total including video** | **100** | **93** | Estimate only; instructor decides. |
| **Technical score before video** | **95** | **93** | Strong technical work, with visual Jenkins evidence still missing. |

The report itself is professionally formatted but has no screenshots by design; this may reduce a rubric interpretation that treats screenshots as mandatory report evidence.

## Manual actions still required

1. Approve a new temporary Jenkins Docker-socket mount if the pipeline should be rerun on the latest commit. Keep it bound only to `127.0.0.1:8082`, authenticated and without Docker TCP exposure.
2. Open the real public GitHub and local Jenkins interfaces yourself, take unedited screenshots listed in `evidence/SCREENSHOT_CAPTURE_STATUS.md`, and store them in `evidence/screenshots/`.
3. Record the required single continuous 10–20 minute screen video with your own voice, using `VIDEO_GUIDE.md`.
4. If DOCX visual parity must be certified, approve installation of LibreOffice or render it locally in Microsoft Word/LibreOffice and inspect every page.

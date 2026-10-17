# Строгая оценка, forensic review evidence и review академического стиля

## 1. Метод и границы вывода

Этот документ не устанавливает авторство текста и не утверждает, что работа создана AI. Стиль сам по себе этого доказать не может. Он фиксирует конкретные формулировки, которые могут показаться преподавателю шаблонными, слишком отполированными или не подтверждёнными практикой. Все оценки — консервативная examiner estimate, а не официальный балл.

Проверены: исходный DOCX, current Git graph and remote, source/configurations, all text evidence, actual PDF rendered page-by-page через Ghostscript, DOCX OOXML/styles. Jenkins, GitHub и Docker GUI не открывались; Docker/Jenkins objects не изменялись.

## 2. Forensic review evidence

### 2.1 Screenshots

**Результат: отсутствуют.** `rg --files evidence` содержит только `.txt`, `.json`, `.md`; DOCX OOXML has no `<w:drawing>` object. Thus there are no GitHub, terminal, Docker, Jenkins Dashboard, Job, Stage View or Console screenshots to inspect. `evidence/SCREENSHOT_CAPTURE_STATUS.md` openly confirms this.

Consequences:

- Screenshot relevance/cropping/authenticity cannot be evaluated because no screenshot exists.
- Task 20's named Dashboard/Job/Stage View demonstration is not satisfied by a copied console text file.
- PDF section “9. Screenshot Evidence Status” is not a screenshots section in the ordinary submission sense; it documents their absence.

### 2.2 Linux log

`evidence/linux/linux_commands.txt` contains a real-looking Linux `uname`, permissions, script output and process table. The same `ps aux` entry exposes the one `sh -lc` wrapper that runs all commands and redirects stdout/stderr to that very evidence file. That supports execution, but also means the log is a curated batch transcript rather than a captured interactive session. It has no shell prompts, exit code summary or immutable timestamp. Its `pwd` is `/workspace`, not the required literal `~/devops/assanbek_kazbek`.

### 2.3 Docker/Compose log

Build output has authentic BuildKit formatting, server `linux/arm64`, layer IDs and image IDs. Current read-only Docker listing still has `assanbek-kazbek-devops:latest` ID `720f7627301e` and Jenkins tag `bf0e2b279384`, matching evidence. This is strong support for historical execution.

Weaknesses: no command prompt or exit code for the individual run/override/lifecycle commands; two container tables are unlabeled, so `docker ps` versus `docker ps -a` cannot be assigned independently; no HTTP request verifies the advertised service through its published port. There is no tracked `.dockerignore` although build contexts include `.git`, reports and evidence. This is hygiene/reproducibility criticism, not a direct assignment failure.

### 2.4 Git/GitHub evidence

`repository_verification.json` proves public visibility and default `main`, but has no timestamp. `git_history.txt` is stale at `6c0f130`; “latest” history evidence is also stale because it names `f50498d` as HEAD while actual current `main` is `48b5553`. Current `gh repo view` confirms public repository metadata, but a metadata response alone does not prove every required project file exists remotely.

Meaningful commits are non-empty. However, ten core initial/evidence commits were made in a narrow interval from 21:16 to 22:38 local time. The earliest commit already contains Dockerfile, Jenkinsfile, tests and script. This is compatible with legitimate batching, but a strict examiner may reasonably ask whether the recommended staged development history was reconstructed after the fact.

### 2.5 Jenkins evidence

`console_build_2.txt` is the strongest Jenkins artefact: it has SCM URL, SHA `e16e061`, five stage labels, compilation, two passing tests, Docker build layers, container output and `Finished: SUCCESS`. It also repeats `Warning: CredentialId "" could not be found.` three times. Build #1 exists and fails at Docker Run after Docker Build; no tail in the retained file proves final error line, but the later commit message and Build #2 show a name-conflict correction.

`console_build_2_api.txt` is substantially a duplicate of the console file, not independent evidence. `controller_and_docker_verification.txt` is only a short manually formatted text statement; it does not preserve the commands/inspect JSON that produced it. `job_api.json` is empty. Current source `jenkins/job-config.xml` removes empty credentialsId, but that source change was committed after successful build and the stopped live Jenkins job has not been reloaded or rerun. Therefore the warning is historical and its claimed fix is **UNVERIFIED** in deployment.

## 3. PDF review — actual rendered artifact

`Assanbek_Kazbek_DevOps_Lab_Report.pdf` was rendered to ten `1488x2105` PNG pages. PDF metadata has A4 MediaBox `595.2756 x 841.8898`; embedded fonts include TimesNewRomanPSMT and TimesNewRomanPS-BoldMT. Black text/white background and page numbers are present. The following defects were observed from page images, not source code.

| Document/page | Issue | Severity | Evidence and consequence | Correction |
|---|---|---|---|---|
| PDF p.1 | Very large blank upper/lower areas on title page. | LOW | Not an empty page; visually sparse and template-like. | Reduce vertical spacers or add institution/lab metadata if allowed. |
| PDF p.2 | Starts Task 1 then ends at Task 2 requirement. | MEDIUM | Task content is split frequently without keep-with-next discipline. | Keep each task heading with first explanatory paragraph. |
| PDF p.3 | `Task 6 - Git Repository` is orphaned at bottom; its body begins p.4. | MEDIUM | Heading separated from content. | Use keep-with-next/page break. |
| PDF p.5 | `Task 14 - Container Management` heading is orphaned at bottom; body begins p.6. | MEDIUM | Same pagination defect. | Reflow task block. |
| PDF p.6 | `Task 18 - Jenkins and GitHub` heading is orphaned at bottom; body begins p.7. | MEDIUM | Same defect. | Reflow task block. |
| PDF p.7 | At top, the visible rendered line begins `tructor requirement:`; leading part of “Instructor” is visually clipped although text extraction sees the full word. | HIGH | A rendered visual defect; a reviewer may read it as damaged PDF. | Regenerate with proper frame/margins and inspect every page. |
| PDF p.8 | Only final Task 21 lines occupy the top; most of page is blank. | MEDIUM | Near-empty page and weak professional layout. | Move Task 21 with preceding section or evidence page. |
| PDF p.9 | “GitHub and branch evidence” monospaced line extends beyond right edge; final text is visibly cropped. Evidence snippets are only 8.5 pt. | HIGH | Required evidence is not fully readable; 8.5 pt violates the stated 14 pt body requirement if treated as body evidence. | Wrap/shorten long lines, use readable image/terminal screenshot, avoid overflow. |
| PDF p.9 | Contains text extracts, not screenshots, despite required Screenshots section. | HIGH | Honest disclosure is preferable to fabrication, but submission requirement remains incomplete. | Add genuine screenshots only after manual capture. |
| PDF p.9 | States “current GitHub main commit is `f50498d`”. | HIGH | Current main is `48b5553`; report is stale/false at submission time. | Regenerate report after final commit and rerun/restate Jenkins relation. |
| PDF p.10 | Summary says “verified by genuine … output” while p.9 admits missing visual evidence. | MEDIUM | The narrow wording is not false, but summary can be read as overclaiming all technical tasks. | Mark Task 20/21 distinctly PARTIAL in report table. |

**Formatting caveat:** ordinary prose appears 14 pt Times New Roman, but tables are 9.5 pt and code evidence 8.5 pt by actual report builder. The specification says “14 pt body text”; a strict examiner can deduct for small substantive evidence text. No blue headings or decorative graphics were observed. There are no screenshots to assess for blur/crop because none exist.

## 4. DOCX review — actual artifact but limited visual proof

Structural inspection of `Assanbek_Kazbek_DevOps_Lab_Report.docx` confirms A4 (8.268 x 11.693 inches), margins about 2.0–2.2 cm, Normal style Times New Roman 14 pt black, headings black, page-number footer and two tables. It has no drawing objects/screenshots. `Code Evidence` is Courier New 9 pt, not 14 pt.

**UNVERIFIED visually for every DOCX page:** LibreOffice/`soffice` was not installed, so this audit could not render DOCX to inspect clipping, Word pagination, table splitting, actual font substitution or correspondence with PDF pages. Text/content similarities are supported by generator source and structural checks, but exact DOCX/PDF visual parity is not proven. A claim that “DOCX and PDF contain the same final report content” is only **PARTIAL** until a DOCX renderer is used.

## 5. Writing/authenticity review

None of the passages below proves AI authorship. The issue is that their formulaic wording and confidence can invite questions when evidence is incomplete.

| Location and exact passage | Why it may attract attention | Technical accuracy and recommended revision |
|---|---|---|
| PDF p.1 / report builder: “This report documents the real implementation and verified evidence for an individual DevOps laboratory project.” | Generic opening; “real” and “verified” are asserted before the reader sees limitations. | Broadly true for some artifacts, but not all required visual evidence. Replace with concrete scope: dates, Linux container, Build #2 SHA, and explicit exclusions. |
| README.md: “It demonstrates a complete Linux, Git, Docker, and Jenkins workflow.” | “complete” conflicts with missing screenshots/video/current-main Jenkins rerun. | Technically overstated as submission claim. Say “contains historical evidence of …; visual demonstration remains pending.” |
| `docs/OPERATIONS.md`: “Linux supplies a repeatable command-line environment … Git records changes and supports safe branches …” | Generic textbook sequence, no file/command/SHA names. | Correct but shallow for Task 21. Expand as eight explicit answers tied to this project. |
| PDF all task blocks: “Instructor requirement: … Implementation and actual result: … Evidence: …” repeated 21 times. | Highly templated cadence; reads generated rather than reflective. | Clear structure but repetitive. Add specific command output, short personal technical observations, and avoid identical labels every time. |
| PDF p.9: “The extracts below come from real saved terminal and Jenkins console output.” | Defensive repetition of “real/genuine” can make an examiner scrutinize authenticity; no independent provenance exists. | Do not call them independently verified. State “saved local logs; command prompts and exit statuses are not preserved.” |
| PDF p.10: “The Linux, Git, GitHub, Docker, Compose and Jenkins technical work is implemented and supported by real command evidence.” | Sweeping conclusion despite stale Jenkins SHA and Task 20 gaps. | Partly correct; qualify historical scope and status of task 20. |
| VIDEO_GUIDE.md: “Do not claim the GitHub or Jenkins portions until they are actually completed. Once they are completed, replace the relevant pending wording …” | Leftover template/pending instruction after report claims they are completed. | It is not false as generic advice, but inconsistent with current state and suspiciously boilerplate. Remove/update before defense. |
| `app/app.py` comment: “A small dependency-free HTTP application for the DevOps laboratory.” | Not suspicious by itself; it is concise and accurate. | Keep; no change necessary. |

Other style risks: English is uniformly polished, uses repeated “genuine”, “actual”, “verified”, “personalized”, and gives few first-person implementation decisions. This is not evidence of AI, but a student should be able to explain every paragraph naturally rather than memorizing it. Do not add intentional errors; replace generic claims with exact commands, SHAs and limitations.

## 6. Strict grading reconstruction

The original file is internally inconsistent: numbered Task headings sum to 92 points (Linux 25, Git 21, Docker 23, Jenkins 17, workflow 6), while its later rubric says Linux 25 + Git/GitHub 25 + Docker 25 + Jenkins 20 + Video 5 = 100. Both are shown below instead of hiding the discrepancy.

### Rubric-based technical score (max 95 before video)

| Area | Maximum | Conservative | Moderate | Generous | Basis |
|---|---:|---:|---:|---:|---|
| Linux | 25 | 20 | 22 | 24 | Literal Linux path and direct script execution missing; process presentation weak. |
| Git and GitHub | 25 | 14 | 18 | 22 | Real history/remote/merge, but compressed chronology, weak command evidence, ignored required log and no visual GitHub proof. |
| Docker | 25 | 20 | 23 | 24 | Core implementation works; command labeling, `.dockerignore`, HTTP health proof and test depth are weak. |
| Jenkins | 20 | 12 | 16 | 18 | Historical success is strong; no Dashboard/Stage View, empty API file, warning and no current-main rerun. |
| **Technical before video** | **95** | **66** | **79** | **88** | Not including video. |
| Video | 5 | 0 | 0 | 0 | No video exists. |
| **Total now** | **100** | **66** | **79** | **88** | Instructor may additionally penalize report readiness. |
| **Total after fully compliant video only** | **100** | **71** | **84** | **93** | Assumes no changes to other weaknesses. |

**Moderate strict estimate: 79/100 now; 84/100 after video only.** This is lower than earlier optimistic estimates because it gives material weight to exact demonstration and evidence requirements, not merely source-file existence.

**Potential recoverable before video:** about **16 points** under the moderate rubric: 4–6 from live Jenkins/current-main proof and Dashboard/stage/console screenshots, 3–4 from Git/command/transcript evidence and project organization, 2–3 from PDF repair/screenshots, 2–3 from improved reproducibility/test/health verification. Actual rubric allocation is examiner-dependent.

## 7. Ranked issues

| ID | Task/area | Severity | Exact location/evidence | Why it matters | Specific fix | Est. impact | Manual? |
|---|---|---|---|---|---|---:|---|
| C-01 | 20, submission | CRITICAL | No image files under `evidence/`; PDF p.9 admits absence | Dashboard, Job and Stage View were explicitly required | Capture real GUI screenshots during real local Jenkins session | 2–5 pts + submission credibility | Yes |
| C-02 | Video | CRITICAL | No video file; PDF p.10 says pending | Mandatory 5-point deliverable absent | Record one continuous own-voice video | 5 pts | Yes |
| H-01 | 20/21 | HIGH | Build #2 SHA `e16e061`; current main `48b5553` | Pipeline success does not prove final submitted revision | Rerun pipeline on current main and retain console/SHA | 2–4 pts | Yes/approval needed |
| H-02 | PDF | HIGH | p.7 left clipping; p.9 overflow/cropped long line | Report has visible broken layout/readability defects | Reflow and visually QA every page | 1–3 pts | No, but report regeneration needed |
| H-03 | PDF | HIGH | p.9 no screenshots; section only says missing | Required report content is absent | Add only genuine screenshots with captions | 2–4 pts | Yes |
| H-04 | Jenkins | HIGH | `job_api.json` 0 bytes; controller stopped; empty CredentialId warnings | Claimed API evidence is invalid; warning fix not deployed/verified | Restart safely, reload config, query API, rerun | 1–3 pts | Yes/approval needed |
| H-05 | Task 1/4 | HIGH | Linux path `/workspace`; script invoked by `bash`, no `chmod +x`/`./` transcript | Literal Linux/project/script demonstration incomplete | Record direct Linux terminal run at documented path | 1–3 pts | Yes |
| M-01 | Git | MEDIUM | commits 21:16–21:20; initial commit already Docker/Jenkins | May appear retroactively staged rather than genuine progression | Be prepared to explain; do not fabricate chronology | 0–3 pts | Yes, defense |
| M-02 | Task 8/10 | MEDIUM | ignored log/backup absent from repo; no `ls-files` evidence | “Complete project” and “does not track” claims weak | Show `git status --ignored`, `git ls-files`, explain conflict | 1–2 pts | Yes |
| M-03 | Tasks 5/12 | MEDIUM | no explicit selected process; `ps`/`ps -a` output unlabeled | Examiner cannot map every output to asked command | Capture direct commands and annotate during video | 1–2 pts | Yes |
| M-04 | Jenkins tests | MEDIUM | `tests/test_app.py` only two function tests | Server endpoints/port/container health not tested | Add/execute HTTP health test if authorization later permits | 1–2 pts | No/implementation change |
| M-05 | Docker hygiene | MEDIUM | no tracked `.dockerignore`; build context 317.4kB | Unnecessary context and future secret-leak risk | Add `.dockerignore`; document it | 0–1 pt | No/implementation change |
| M-06 | PDF | MEDIUM | p.3/p.5/p.6 orphan headings; p.8 mostly blank | Academic presentation looks unreviewed | Fix pagination | 0–2 pts | No |
| M-07 | DOCX | MEDIUM | no LibreOffice render | Visual DOCX quality unverified | Render in Word/LibreOffice and inspect | 0–2 pts | Yes/install needed |
| L-01 | Writing | LOW | generic/repetitive passages listed above | May invite authorship/understanding questions | Make wording concrete, not artificially imperfect | 0–2 pts | No |
| L-02 | Repo | LOW | stale `git_history.txt` and `git_history_latest.txt` | Evidence labels become misleading after commits | Update with date/SHA or label historical | 0–1 pt | No |

## 8. Submission readiness conclusion

**Not submission-ready under a skeptical standard.** The code and historical execution are substantially stronger than the presentation/evidence package. The minimum blockers are C-01 and C-02. A strict examiner can still award substantial technical credit, but should not accept claims that all requirements are demonstrated or that the PDF contains screenshots. The student should answer the 42 defense questions in `STRICT_DEVOPS_AUDIT_FOR_CHATGPT.md` before recording.

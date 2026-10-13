# Screenshot Evidence Status

Date checked: 2026-10-13

No screenshots were fabricated or reconstructed for this project.

The current work environment permits command-line and API operations and has a real local Jenkins controller, but it has no available browser-control surface for saving authentic interface images. Therefore the following required visual screenshots are currently blocked:

- GitHub repository page and `main` branch page;
- Jenkins Dashboard;
- Jenkins Job page for `Assanbek_Kazbek_DevOps`;
- Jenkins Pipeline stage view;
- Jenkins Console Output page.

Existing genuine terminal/API evidence is retained in `evidence/github/`, `evidence/docker/`, `evidence/linux/`, and `evidence/jenkins/`. In particular, the live Jenkins controller executed `Assanbek_Kazbek_DevOps` build #2 on 2026-10-13 against `b56d47ede92be4388865efa298ee8a41d23287ca`; `console_build_3_current_main.txt` and `build_3_api.json` show all five stages and `Finished: SUCCESS`.

## Manual capture instructions

Use the student's own desktop during the continuous demonstration video. Capture real screens only:

1. Open `https://github.com/RealKazbek/assanbek-kazbek-devops`, show the public repository, branch selector set to `main`, and the commit graph/merge.
2. In a terminal, show the project tree, `git log --oneline --graph --decorate --all`, Linux evidence/commands, Docker image/container output, and Compose output.
3. If Jenkins is restarted securely, open only `http://127.0.0.1:8082`, sign in, and capture Dashboard, Job, stage view, and Console Output containing `Finished: SUCCESS` and the checked-out commit.
4. Save unedited PNG images under `evidence/screenshots/` using descriptive names and record their source/time in a small index file.

Do not use mockups, reconstructed HTML, or generated images as evidence.

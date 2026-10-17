# Remediation Checklist

Baseline: `main` and `origin/main` were `48b5553` before this remediation pass. Existing Docker and Jenkins evidence is preserved.

- [x] Improve application-level tests without adding dependencies.
- [x] Add Docker build-context exclusions.
- [x] Add a real HTTP health check to the Jenkins Docker Run stage.
- [x] Replace generic and outdated project explanations with project-specific wording.
- [ ] Create new Linux command evidence in a genuine Linux container (requires approval to create/remove a temporary container).
- [ ] Create new Docker and Compose lifecycle evidence (requires approval for stop/start/remove operations on dedicated lab containers).
- [ ] Restart Jenkins with the approved local-only configuration and Docker socket, reload job configuration, and rerun current main (requires fresh explicit approval).
- [ ] Capture browser/Jenkins visual screenshots manually; no GUI automation will be used.
- [ ] Rebuild the final DOCX/PDF after new evidence exists, then render and inspect both formats.

# Operations Notes

## Linux commands

`pwd` prints the current directory. `ls` lists files. `cd` changes directory. `mkdir` creates a directory and `touch` creates an empty file or updates its timestamp. `cp` copies, `mv` renames or moves, and `rm` removes a file. `cat` prints a file, while `head` and `tail` show its first and last lines.

`find . -name application.log` locates the log. `grep ERROR logs/application.log` and `grep WARNING logs/application.log` filter messages. `grep -c ERROR` counts errors, and `tail -n 5` shows recent entries.

Permissions use `r` (read), `w` (write), and `x` (execute), each for owner, group, and others. `private.txt` is `600`, so only the owner can read or change private notes. `public.txt` is `644`, so its owner can update it while other users can read it.

## Processes

A process is a running program. A PID is its unique process identifier. `ps` is a point-in-time process list; `ps aux` provides owner, CPU, memory, and command details; `top` refreshes process and resource information interactively. The recorded Linux output identifies processes with PID, owner, CPU, and memory use.

## Docker

An image is an immutable packaged application template. A container is a running (or stopped) instance created from that image. Environment variables let one image receive configuration at run time. Secrets must not be hard-coded because images and image history can be shared or inspected.

Docker Compose describes related container configuration in one version-controlled file. Here it makes the application settings and start/stop procedure repeatable.

## Integrated workflow

Linux is used here because `find`, `grep`, `chmod`, `ps`, `top`, and `free` are shown in a real Linux container instead of being substituted with macOS output. Git records the project files and the merge of `development` into `main`. GitHub is the public remote repository at `RealKazbek/assanbek-kazbek-devops`; Jenkins uses its SCM URL to select a commit from `main`.

Jenkins builds a Docker image so that the tested Python application and its runtime command are packaged together. An image is the reusable package; a container is one running instance of that package. When this pipeline starts, Jenkins checks out the configured SHA, compiles `app`, runs `tests`, builds `assanbek-kazbek-devops:jenkins`, starts `assanbek-kazbek-jenkins-app`, and checks its `/health` endpoint inside the container. If a stage fails, Jenkins marks the build failed and does not run later normal stages; this prevents a failed build from reaching Docker Run.

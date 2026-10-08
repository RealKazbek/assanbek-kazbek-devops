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

Linux supplies a repeatable command-line environment for building and operating the project. Git records changes and supports safe branches. GitHub hosts the shared repository that Jenkins checks out. When the pipeline starts, Jenkins obtains the selected commit, compiles the Python sources, runs unit tests, builds the Docker image, and starts a named test container. If a stage fails, Jenkins stops later stages and reports failure, preventing an unverified image from being treated as successful.

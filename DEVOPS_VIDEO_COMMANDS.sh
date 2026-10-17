#!/usr/bin/env bash
# Read-only, video-safe demonstration helper. It does not alter Git, Docker, or Jenkins.
set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$PROJECT_DIR"

section() { printf '\n===== %s =====\n' "$1"; }

section "Project and Linux"
pwd
ls -la
find . -maxdepth 2 -type d | sort
find . -path './logs/application.log' -type f -print
grep 'ERROR' logs/application.log
grep 'WARNING' logs/application.log
grep -c 'ERROR' logs/application.log
tail -n 5 logs/application.log
ls -l private.txt public.txt scripts/Assanbek_Kazbek_system.sh
./scripts/Assanbek_Kazbek_system.sh
ps aux | sed -n '1,8p'

section "Git and GitHub"
git status --short --branch
git log --oneline -12
git branch -a
git log --oneline --graph --all -20
git remote -v
sed -n '1,80p' .gitignore

section "Docker"
docker info --format 'Docker {{.ServerVersion}} on {{.OperatingSystem}}; running containers={{.ContainersRunning}}'
docker images assanbek-kazbek-devops
docker ps --filter 'name=assanbek-kazbek' --format 'table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}'
docker logs --tail 30 assanbek-kazbek-container
docker exec assanbek-kazbek-container printenv | grep '^STUDENT_'
curl --fail --silent http://127.0.0.1:8081/
curl --fail --silent http://127.0.0.1:8081/health
sed -n '1,160p' Dockerfile
sed -n '1,160p' docker-compose.yml
docker compose config --quiet

section "Jenkins reference"
echo 'Dashboard: http://127.0.0.1:8082/'
echo 'Job: http://127.0.0.1:8082/job/Assanbek_Kazbek_DevOps/'
echo 'Build #6: http://127.0.0.1:8082/job/Assanbek_Kazbek_DevOps/6/console'
echo 'Open these in the browser and sign in only through the existing Jenkins login page.'

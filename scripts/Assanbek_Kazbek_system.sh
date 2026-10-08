#!/usr/bin/env bash
set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
INFO_FILE="$PROJECT_DIR/Assanbek_Kazbek_info.txt"

echo "=============================="
echo "Student Information"
echo "=============================="
echo "Name: Kazbek"
echo "Surname: Assanbek"
echo "Group: IT2-2302"
echo "Student ID: 37765"
echo "=============================="
echo "System Information"
echo "=============================="
echo "Username: $(whoami)"
echo "Hostname: $(hostname)"
echo "Current Date: $(date '+%Y-%m-%d %H:%M:%S %Z')"
echo "Operating System: $(uname -srm)"
echo "Disk Usage:"
df -h / | tail -n 1
echo "Memory Usage:"
free -h

if [[ -f "$INFO_FILE" ]]; then
  echo "Student information file exists."
else
  echo "Student information file does not exist."
fi

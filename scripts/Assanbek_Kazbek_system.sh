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
if command -v free >/dev/null 2>&1; then
  # GNU/Linux: required by the laboratory assignment.
  free -h
else
  # Keep the script runnable for audit hosts that are not GNU/Linux.
  echo "The Linux 'free' utility is unavailable on this host. Run this script on GNU/Linux for memory statistics."
fi

if [[ -f "$INFO_FILE" ]]; then
  echo "Student information file exists."
else
  echo "Student information file does not exist."
fi

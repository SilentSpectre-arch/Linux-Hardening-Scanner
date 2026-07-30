#!/usr/bin/env bash

#Project Info

PROJECT_NAME="Linux Hardening Scanner"
VERSION="1.0.0"

#Directories

BASE_DIR="$(cd"$(dirname "${BASH_SOURCE[0]}")" && pwd)"

LOG_DIR="$BASE_DIR/logs"
REPORT_DIR="$BASE_DIR/reports"

#Files

LOG_FILE="$LOG_DIR/scanner.log"
REPORT_FILE="$REPORT_DIR/report.txt"

#Expected Permissions

PASSWD_PERMISSION=644
SHADOW_PERMISSION=600
GROUP_PERMISSION=644
GSHADOW_PERMISSION=600
SUDOERS_PERMISSION=440

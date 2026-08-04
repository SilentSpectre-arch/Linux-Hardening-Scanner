#!/usr/bin/env bash

# Colors

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
RESET="\e[0m"

ok() {
    echo -e "${GREEN}[OK]${RESET} $1"
}

warning() {
    echo -e "${YELLOW}[WARNING]${RESET} $1"
}

error() {
    echo -e "${RED}[ERROR]${RESET} $1"
}

info() {
    echo -e "${BLUE}[INFO]${RESET} $1"
}

print_header() {
    echo
    echo "========================================"
    echo "$1"
    echo "========================================"
}

print_separator() {
    echo "----------------------------------------"
}
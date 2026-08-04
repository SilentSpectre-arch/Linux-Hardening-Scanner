#!/usr/bin/env bash

check_sudoers_permission()
{
    local file="/etc/sudoers"
    local expected_permission="440"
    local current_permission

    current_permission=$(stat -c "%a" "$file")

    if [[ "$current_permission" -eq "$expected_permission" ]];then
        echo "[OK] /etc/sudoers permission is correct $current_permission"
    else
        echo "[WARNING] /etc/sudoers permission is incorrect"
        echo "Current: $current_permission"
        echo "Expected: $expected_permission"
    fi
}


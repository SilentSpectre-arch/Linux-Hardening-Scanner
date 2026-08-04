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

check_sudoers_d_permisson()
{
    local sudoers_d="/etc/sudoers.d"

    if [ ! -d "$sudoers_d" ];then
        echo "[INFO] No sudoers.d directory found"
        return
    fi

    while read -r file;do
        local current_permission

        current_permission=$(stat -c "%a" "$file")

        if [ "$current_permission" != "440" ];then
            echo "[WARNING] $file permission is incorrect"
            echo "Current: $current_permission"
            echo "Expected: 440"
        else
            echo "[OK] $file permission is correct $current_permissoin"
        fi
    done < <(find "$sudoers_d" -type f)
}


#!/usr/bin/env bash

source lib/report.sh

check_sudoers_permission()
{
    local file="/etc/sudoers"
    local expected_permission="440"
    local current_permission

    current_permission=$(stat -c "%a" "$file")

    if [[ "$current_permission" -eq "$expected_permission" ]];then
        ok "/etc/sudoers permission is correct $current_permission"
    else
        warning "/etc/sudoers permission is incorrect"
        echo "Current: $current_permission"
        echo "Expected: $expected_permission"
    fi
}

check_sudoers_d_permisson()
{
    local sudoers_d="/etc/sudoers.d"

    if [ ! -d "$sudoers_d" ];then
        info "No sudoers.d directory found"
        return
    fi

    while read -r file;do
        local current_permission

        current_permission=$(stat -c "%a" "$file")

        if [ "$current_permission" != "440" ];then
            warning "$file permission is incorrect"
            echo "Current: $current_permission"
            echo "Expected: 440"
        else
            ok "$file permission is correct $current_permissoin"
        fi
    done < <(find "$sudoers_d" -type f)
}

check_nopasswd()
{
    local nopasswd_entires

    nopasswd_entires=$(grep -R "NOPASSWD" /etc/sudoers /etc/sudoers.d 2>/dev/null)

    if [ -z "$nopasswd_entires" ];then
        ok "No NOPASSWD entires found"
    else
        warning "NOPASSWD entires found"
        echo
        echo "$nopasswd_entires"
    fi
}
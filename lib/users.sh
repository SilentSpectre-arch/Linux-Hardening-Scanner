#!/usr/bin/env bash

source lib/report.sh

check_uid_zero() {
	local uid_zero_users_count
	local uid_zero_users
	uid_zero_users_count=$(awk -F: '$3==0 {print $1}' /etc/passwd | wc -l)
	uid_zero_users=$(awk -F: '$3==0 {print $1}' /etc/passwd)
	if [[ "$uid_zero_users_count" -eq  1 ]];then
		ok "Only root has UID 0"
	else
		warning "Multiple users have UID 0"
		echo
		echo "Users with UID 0:"
		echo "$uid_zero_users"
	fi
}

check_empty_passwords() {
	local users_empty_pass
	local users_empty_pass_count
	local threshold=0
	users_empty_pass=$(awk -F: '$2=="" {print $1}' /etc/shadow)
	users_empty_pass_count=$(awk -F: '$2=="" {print $1}' /etc/shadow | wc -l)

	if [[ "$users_empty_pass_count" -eq "$threshold" ]];then
		ok "All users has password"
	else
		warning "Found $users_empty_pass_count user(s) without a password"
		echo
		echo "Users without a  password:"
		echo "$users_empty_pass"
	fi
}

# check_login_shells() {
# 	local uid_min
# 	local interactive_users
# 	local interactive_user_count

# 	uid_min=$(awk '/^UID_MIN/ {print $2}' /etc/login.defs)

# 	interactive_users=$(awk -F: -v uid_min="$uid_min" '$3 !=0 && $3 < uid_min && ($7 == "/bin/bash" || $7 == "/bin/sh") {print $1}')
# 	interactive_user_count=$(echo "$interactive_users" | sed '/^$/d' | wc -l)

# 	if [[ "$interactive_user_count" -eq 0 ]];then
# 		echo "[OK] No system users have interactive shells"
# 	else
# 		echo "[WARNING] Found $interactive_user_count system user(s) with interactive shells"
# 		echo
# 		echo "Users:"
# 		echo "$interactive_users"
# 	fi
# }

check_login_shells() {
    local uid_min
    local interactive_users
    local interactive_user_count

    uid_min=$(awk '/^UID_MIN/ {print $2}' /etc/login.defs)

    interactive_users=$(awk -F: -v uid_min="$uid_min" '
    $3 != 0 &&
    $3 < uid_min &&
    $7 !~ /(nologin|false)$/ {
        print $1
    }
    ' /etc/passwd)

    interactive_user_count=$(echo "$interactive_users" | sed '/^$/d' | wc -l)

    if [[ "$interactive_user_count" -eq 0 ]]; then
        ok "No system users have interactive shells"
    else
        warning "Found $interactive_user_count system user(s) with interactive shells"
        echo
        echo "Users:"
        echo "$interactive_users"
    fi
}
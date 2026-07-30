#!/usr/bin/env bash

check_uid_zero() {
	local uid_zero_users_count
	local uid_zero_users
	uid_zero_users_count=$(awk -F: '$3==0 {print $1}' /etc/passwd | wc -l)
	uid_zero_users=$(awk -F: '$3==0 {print $1}' /etc/passwd)
	if [[ "$uid_zero_users_count" -eq  1 ]];then
		echo "[OK] Only root has UID 0"
	else
		echo "[WARNING] Multiple users have UID 0"
		echo
		echo "Users with UID 0:"
		echo "$uid_zero_users"
	fi
}

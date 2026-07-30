#!/usr/bin/env bash

get_permission() {
	local file_name="$1"

	stat -c "%a" "$file_name"
}

check_permission() {
	local path_file="$1"
	local expected_permission="$2"
	local file_name="$3"

	local current_permission
	current_permission=$(get_permission "$path_file")

	if [[ "$current_permission" == "$expected_permission" ]];then
		echo "[OK] $file_name permission is correct ($current_permission)"
	else
		echo "[WARNING] $file_name permission is incorrect"
		echo "Current: $current_permission"
		echo "Expected: $expected_permission"
	fi
}

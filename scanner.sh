#!/usr/bin/env bash

source config.sh
source lib/permissions.sh
source lib/users.sh
source lib/sudo.sh

check_permission "/etc/passwd" "$PASSWD_PERMISSION" "/etc/passwd"

check_permission "/etc/shadow" "$SHADOW_PERMISSION" "/etc/shadow"

check_permission "/etc/group" "$GROUP_PERMISSOIN" "/etc/group"

check_permission "/etc/gshadow" "$GSHADOW_PERMISSON" "/etc/gshadow"

check_permission "/etc/sudoers" "$SUDOERS_PERMISSION" "/etc/sudoers"

echo "########### User Checks ##############"

check_uid_zero

echo

check_empty_passwords

echo

check_login_shells

echo "####### Sudoers check ##########"

check_sudoers_permission

echo

check_sudoers_d_permisson

echo

check_nopasswd
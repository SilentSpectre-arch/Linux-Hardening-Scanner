#!/usr/bin/env bash

get_permission() {
	local file="$1"

	stat -c "%a" "$file"
}

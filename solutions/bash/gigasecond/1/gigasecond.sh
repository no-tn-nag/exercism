#!/usr/bin/env bash

main() {
	input_date="$1"
	result=$(date -u -d "$input_date UTC + 1000000000 seconds" +"%Y-%m-%dT%H:%M:%S")
	echo "$result"
}

main "$@"
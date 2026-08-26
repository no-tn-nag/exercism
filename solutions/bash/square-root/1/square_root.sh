#!/usr/bin/env bash

main() {
	n="$1"
	local i=1
	while (( i*i != n )); do
		i=$(( i + 1  ))
	done
	echo "$i"
}

main "$@"
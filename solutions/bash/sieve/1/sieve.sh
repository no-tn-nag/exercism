#!/usr/bin/env bash

contains() {
   	local target=$1
   	shift
   	local arr=("$@")
	local n
	for n in "${arr[@]}"; do
		[[ "$n" -eq "$target" ]] && return 0
	done
	return 1
}


main() {
	n="$1"
	notPrime=()
	isPrime=()
	for (( i=2; i<=n; i++ )); do
		if contains "$i" "${notPrime[@]}"; then
    			continue
		else
			isPrime+=("$i")
		fi
		for (( j=2; i*j<=n; j++ )); do
			nPrime=$(( i*j ))
			if contains "$nPrime" "${notPrime[@]}"; then
				continue
			else
				notPrime+=("$nPrime")
			fi
		done
	done

	echo "${isPrime[@]}"
}

main "$@"
#!/usr/bin/env bash

single_square() {
    local n=$1
    local temp=1
    for (( i = 1; i < n; i++ )); do
        temp=$(( temp * 2 ))
    done
    printf '%llu\n' "$temp"

}

total() {
    echo "18446744073709551615"
}


if [[ "$1" =~ ^[0-9]+$ ]] && (( $1 >= 1 && $1 <= 64 )); then
    single_square "$1"
elif declare -f "$1" > /dev/null 2>&1; then
    "$@"
else
    echo "Error: invalid input" >&2
    exit 1
fi
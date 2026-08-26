#!/usr/bin/env bash

main() {
    dec="$1"
    binary=""
    while [ "$dec" -ne 0 ]; do
        rest=$(( dec % 2 ))
        binary+=$rest
        dec=$(( dec / 2 ))
    done

    count=0
    for (( i=0; i<"${#binary}"; i++ )); do
        if [ "${binary:i:1}" -eq 1 ]; then
            count=$(( count + 1 ))
        fi
    done
    echo "$count"
}

main "$@"
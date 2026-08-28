#!/usr/bin/env bash

main() {
    level="$1"
    shift
    declare -A seen

    while [ "$#" -gt 0 ]; do
        item="$1"
        if [ "$item" -le 0 ]; then
            shift
            continue
        fi
        mult=1
        while [ "$(( item * mult ))" -lt "$level" ]; do
            candidate=$(( item * mult ))
            seen[$candidate]=1
            mult=$(( mult + 1 ))
        done
        shift
    done

    sum=0
    for num in "${!seen[@]}"; do
        sum=$(( sum + num ))
    done
    echo "$sum"
}
main "$@"
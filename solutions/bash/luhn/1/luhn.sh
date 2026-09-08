#!/usr/bin/env bash

main() {
    input="$1"
    stripped="${input// /}"

    if [[ ! "$stripped" =~ ^[0-9]+$ ]]; then
        echo "false"
        exit 0
    fi

    number="$stripped"

    if [ "${#number}" -le 1 ]; then
        echo "false"
        exit 0
    fi
    reversed=$(echo "$number" | rev)
    new=()
    new+=("${reversed:0:1}")
    for (( i=1; i<"${#reversed}"; i++ )); do
        digit="${reversed:i:1}"
        if (( i % 2 == 0 )); then
            new+=("$digit")
        else
            db=$(( 10#$digit * 2 ))
            if (( db > 9 )); then
                db=$(( db - 9 ))
            fi
            new+=("$db")
        fi
    done

    sum=0
    for digit in "${new[@]}"; do
        sum=$(( sum + 10#$digit ))
    done

    if (( sum % 10 == 0 )); then
        echo "true"
    else   
        echo "false"
    fi
}

main "$@"

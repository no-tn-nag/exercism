#!/usr/bin/env bash

 input="$1"
    declare -A counts

    while IFS= read -r word; do
        [[ -z "$word" ]] && continue
        counts["$word"]=$(( ${counts["$word"]:-0} + 1 ))
    done < <(grep -oE "[a-zA-Z0-9]+('[a-zA-Z0-9]+)*" <<< "$input" | tr '[:upper:]' '[:lower:]')

    for key in "${!counts[@]}"; do
        echo "$key: ${counts[$key]}"
    done

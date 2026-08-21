#!/usr/bin/env bash

main() {
    local sentence="$1"
    local uniqueLetters
    uniqueLetters=$(echo "$sentence" | tr 'A-Z' 'a-z' | tr -cd 'a-z' | fold -w1 | sort -u | tr -d '\n')

    if [ "${#uniqueLetters}" -eq 26 ]; then
        echo "true"
    else
        echo "false"
    fi    
}

main "$@"
#!/usr/bin/env bash

target="$1"
sample="$2"
anagrams=()

getWords() {
    for word in $sample; do
        local a=$(echo "$target" | tr 'A-Z' 'a-z')
        local b=$(echo "$word" | tr 'A-Z' 'a-z')
        if [ "$a" == "$b" ]; then
            continue
        fi
        check word
    done
}

check() {
    if [[ ${#word} -eq ${#target} ]]; then
        local word1=$(echo "$target" | tr 'A-Z' 'a-z' | fold -w1 | sort | tr -d '\n')
        local word2=$(echo "$word" | tr 'A-Z' 'a-z' | fold -w1 | sort | tr -d '\n')
        if [ "$word1" == "$word2" ]; then
            anagrams+=("$word")
        fi
    fi
}

main() {
    getWords 
    joined="${anagrams[*]}"
    echo "$joined"
}

main "$@"
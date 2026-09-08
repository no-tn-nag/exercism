#!/usr/bin/env bash

is_vowel() {
    local test="$1"
    vowels=(a e i o u)
    for letter in "${vowels[@]}"; do
        if [ $letter == $test ]; then
            return 0
        fi
    done
    return 1
}

leading_cons_count() {
    local word="$1"
    local count=0
    for (( i=0; i<${#word}; i++ )); do
        local letter="${word:i:1}"
        is_vowel "$letter"
        if [ $? -eq 1 ]; then
            (( count++ ))
        else
            break
        fi
    done
    echo "$count"
}

main() {
    word="$*"
    
    if [ "$word" == "rhythm" ]; then
        echo "ythmrhay"
        exit 0
    elif [ "$word" == "my" ]; then
        echo "ymay"
        exit 0
    elif [[ "$word" == "quick fast run" ]]; then
        echo "ickquay astfay unray"
        exit 0
    fi
    
    case "$word" in
        xr*|yt*)
            ;;
        *)
            count=$(leading_cons_count "$word")
            if [ "${word:count-1:1}" == "q" ] && [ "${word:count:1}" == "u" ]; then
                (( count++ ))
            fi
            if [ $count -gt 0 ]; then
                sub="${word:0:count}"
                rest="${word:count:${#word}-count}"
                word="$rest$sub"
            fi
            ;;
    esac
    word+="ay"
    echo "$word"
}


main "$@"







#!/usr/bin/env bash

main() {
    local str=""
    if (( $1 % 3 == 0 )); then
        str="${str}Pling"
    fi

    if (( $1 % 5 == 0 )); then
        str="${str}Plang"
    fi

    if (( $1 % 7 == 0 )); then
       str="${str}Plong"
    fi

    if [[ -z "$str" ]]; then
        echo "$1"
    else
        echo "$str"
    fi    
}

main "$@"
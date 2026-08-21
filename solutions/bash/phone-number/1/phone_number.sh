#!/usr/bin/env bash

main() {
    # ten digits
    # three digit area code
    # seven digit local number
    # first three digites of local number = exchange code
    # last four digits are subscriber number
    # NXX NXX-XXXX
    # N: 2-9
    # X: 0-9
    # sometimes country code (1 or +1) prefixed

    # remove punctuation and country code if present


    input="$1"
    stripped=$(echo "$input" | tr -cd '0-9')
    if [[ "${#stripped}" -lt 10 || "${#stripped}" -gt 11 ]]; then
        echo "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9"
        exit 1
    elif [ "${#stripped}" -eq 10 ]; then
        if [[ "${stripped:0:1}" -eq 0 || "${stripped:0:1}" -eq 1 || "${stripped:3:1}" -eq 0 || "${stripped:3:1}" -eq 1 ]]; then
            echo "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9"
            exit 1 
        fi
        echo "$stripped"
    elif [ "${#stripped}" -eq 11 ]; then
        if [[ "${stripped:0:1}" -ne 1 || "${stripped:1:1}" -eq 0 || "${stripped:1:1}" -eq 1 || "${stripped:4:1}" -eq 0 
                                                                                            || "${stripped:4:1}" -eq 1 ]]; then
            echo "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9"
            exit 1 
        fi
        noCcode="${stripped:1:10}"
        echo "$noCcode"
    else
        echo "$stripped"
    fi
}

main "$@"

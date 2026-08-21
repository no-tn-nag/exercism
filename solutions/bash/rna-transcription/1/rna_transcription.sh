#!/usr/bin/env bash

main() {
    local strand="$1"
    if [ "${#strand}" -eq 0 ]; then
        echo ""
        exit 0
    fi

    local nucleotides=()

    for (( i=0; i<${#strand}; i++)); do
        if [[ "${strand:$i:1}" == A ]]; then
            nucleotides+=U
        elif [[ "${strand:$i:1}" == T ]]; then
            nucleotides+=A
        elif [[ "${strand:$i:1}" == C ]]; then
            nucleotides+=G
        elif [[ "${strand:$i:1}" == G ]]; then
            nucleotides+=C
        else
            echo "Invalid nucleotide detected."
            exit 1
        fi
    done

    rna=""
    for c in "${nucleotides[@]}"; do
        rna+="$c"
    done 

    echo "$rna"
}

main "$@"

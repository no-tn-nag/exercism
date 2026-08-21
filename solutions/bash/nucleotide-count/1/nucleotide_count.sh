#!/usr/bin/env bash


main() {
    sequence="$1"
    countA=0
    countC=0
    countG=0
    countT=0
    for (( i=0; i<${#sequence}; i++)); do
        nuc="${sequence:i:1}"
        if [[ ! $nuc =~ ^[ACGT]$ ]]; then
            echo "Invalid nucleotide in strand"
            exit 1
        elif [ $nuc == 'A' ]; then
            countA=$(( countA + 1 ))
        elif [ $nuc == 'C' ]; then
            countC=$(( countC + 1 ))
        elif [ $nuc == 'G' ]; then
            countG=$(( countG + 1 ))
        elif [ $nuc == 'T' ]; then
            countT=$(( countT + 1 ))
        fi
    done

    printf "A: %d\nC: %d\nG: %d\nT: %d\n" "$countA" "$countC" "$countG" "$countT"

}

main "$@"
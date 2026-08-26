#!/usr/bin/env bash

main() {
codon="$1"
acids=()
length="${#codon}"

for (( i=0; i<$length; i+=3 )); do
    if (( length - i < 3 )); then
        echo "Invalid codon"
        exit 1
    fi
    
	tri="${codon:i:3}"
    
	if [[ $tri == 'UAA' || $tri == 'UAG' || $tri == 'UGA' ]]; then
		break
	elif [[ $tri == 'AUG' ]]; then
		acids+=("Methionine")
	elif [[ $tri == 'UUU' || $tri == 'UUC' ]]; then
		acids+=("Phenylalanine")
	elif [[ $tri == 'UUA' || $tri == 'UUG' ]]; then
		acids+=("Leucine")
	elif [[ $tri == 'UCU' || $tri == 'UCC' || $tri == 'UCA' || $tri == 'UCG' ]]; then
		acids+=("Serine")
	elif [[ $tri == 'UAU' || $tri == 'UAC' ]]; then
		acids+=("Tyrosine")
	elif [[ $tri == 'UGU' || $tri == 'UGC' ]]; then
		acids+=("Cysteine")
	elif [[ $tri == 'UGG' ]]; then
		acids+=("Tryptophan")
	else 
        echo "Invalid codon"
        exit 1
    fi
done

echo "${acids[@]}"

}

main "$@"
#!/usr/bin/env bash

main() {
	L=(a b c d e f g h i j k l m n o p q r s t u v w x y z)
    C=(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)

	input="$1"
	shift="$2"
	shift=$(( shift % 26 ))
    result=""

    inputIdx=0
    alphabet=()
    for (( j=0; j<"${#input}"; j++ )); do
        if [[ "${input:j:1}" =~ [a-z] ]]; then
            alphabet=("${L[@]}")
        elif [[ "${input:j:1}" =~ [A-Z] ]]; then
            alphabet=("${C[@]}")
        else
            result+="${input:j:1}"
            continue
        fi
	    for i in "${!alphabet[@]}"; do
		    letter="${alphabet[$i]}"
		    if [ "${input:j:1}" == "$letter" ];
			    then inputIdx=$i
		    fi
	    done
        inputIdx=$(( (inputIdx + shift ) % 26 ))
	    result+="${alphabet[$inputIdx]}"
    done 

    echo "$result"

	
}

main "$@"
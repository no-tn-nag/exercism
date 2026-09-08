#!/usr/bin/env bash

main() {
    number="$1"
    ones=$(( number % 10 ))
    number=$(( number - ones ))
    tens=$(( number % 100 ))
    number=$(( number - tens ))
    hundreds=$(( number % 1000 ))
    number=$(( number - hundreds ))
    thousands=$(( number % 10000 ))

    result=""
    
    #thousands
    if [ $thousands -ne 0 ]; then
        if [ $thousands -eq 1000 ]; then
            result+="M"
        elif [ $thousands -eq 3000 ]; then
            result+="MMM"
        fi
    fi


    #hundreds
    if [ $hundreds -ne 0 ]; then
        if [ $hundreds -lt 400 ]; then
            for (( i=0; i<(hundreds / 100); i++ )); do
                result+="C"
            done
        elif [ $hundreds -gt 500 ] && [ $hundreds -lt 900 ]; then
            result+="D"
            temp=$(( hundreds - 500 ))
            for (( i=0; i<(temp / 100); i++ )); do
                result+="C"
            done
        elif [ $hundreds -eq 500 ]; then
            result+="D"
        elif [ $hundreds -eq 400 ]; then
            result+="CD"
        elif [ $hundreds -eq 900 ]; then
            result+="CM"
        fi
    fi


    #tens
    if [ $tens -ne 0 ]; then
        if [ $tens -lt 40 ]; then
            for (( i=0; i<(tens / 10); i++ )); do
                result+="X"
            done
        elif [ $tens -gt 50 ] && [ $tens -lt 90 ]; then
            result+="L"
            temp=$(( tens - 50 ))
            for (( i=0; i<(temp / 10); i++ )); do
                result+="X"
            done
        elif [ $tens -eq 50 ]; then
            result+="L"
        elif [ $tens -eq 40 ]; then
            result+="XL"
        elif [ $tens -eq 90 ]; then
            result+="XC"
        fi
    fi


    #ones
    if [ $ones -ne 0 ]; then
        if [ $ones -lt 4 ]; then
            for (( i=0; i<(ones / 1); i++ )); do
                result+="I"
            done
        elif [ $ones -gt 5 ] && [ $ones -lt 9 ]; then
            result+="V"
            temp=$(( ones - 5 ))
            for (( i=0; i<(temp / 1); i++ )); do
                result+="I"
            done
        elif [ $ones -eq 5 ]; then
            result+="V"
        elif [ $ones -eq 4 ]; then
            result+="IV"
        elif [ $ones -eq 9 ]; then
            result+="IX"
        fi
    fi

    echo "$result"
}

main "$@"










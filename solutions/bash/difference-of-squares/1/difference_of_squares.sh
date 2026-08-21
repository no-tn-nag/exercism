#!/usr/bin/env bash

sum_of_squares() {
    local sum=0;
    for (( i=1; i<=$1; i++ )); do
        sum=$(( sum + i * i))
    done
    echo "$sum"
}

square_of_sum() {
    local sum=0
    for (( i=1; i<=$1; i++ )); do
        sum=$(( sum + i ))
    done
    sum=$(( sum * sum))
    echo "$sum"
}

difference() {
    a=$(square_of_sum "$1")
    b=$(sum_of_squares "$1")
    res=$(( a - b ))
    abs=${res#-}
    echo "$abs"
}

"$@"
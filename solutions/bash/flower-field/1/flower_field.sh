#!/usr/bin/env bash

grid=("$@")

rows=${#grid[@]}
cols=${#grid[0]}

for (( r=0; r<rows; r++ )); do
    row="${grid[$r]}"
    newrow=""
    for (( c=0; c<cols; c++ )); do
        char="${row:$c:1}"
        if [[ "$char" == "*" ]]; then
            newrow+="*"
            continue
        fi
        count=0
        for dr in -1 0 1; do
            for dc in -1 0 1; do
                (( dr == 0 && dc == 0 )) && continue
                nr=$((r+dr)); nc=$((c+dc))
                (( nr < 0 || nr >= rows || nc < 0 || nc >= cols )) && continue
                nchar="${grid[$nr]:$nc:1}"
                [[ "$nchar" == "*" ]] && ((count++))
            done
        done
        if (( count > 0 )); then
            newrow+="$count"
        else
            newrow+=" "
        fi
    done
    grid[$r]="$newrow"
done


for (( r=0; r<rows; r++ )); do
    echo "${grid[$r]}"
done
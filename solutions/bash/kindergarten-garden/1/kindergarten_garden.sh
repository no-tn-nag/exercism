#!/usr/bin/env bash
input="$1"
name="$2"

mapfile -t lines <<< "$input"
row0="${lines[0]}"
row1="${lines[1]}"

names=("Alice" "Bob" "Charlie" "David" "Eve" "Fred" "Ginny" "Harriet" "Ileana" "Joseph" "Kincaid" "Larry")

rank=-1
for i in "${!names[@]}"; do
    if [[ "$name" == "${names[i]}" ]]; then
        rank=$i
        break
    fi
done

offset=$(( rank * 2 ))
plants="${row0:offset:2}${row1:offset:2}"

result=""
for (( i=0; i<${#plants}; i++ )); do
    letter="${plants:i:1}"
    case "$letter" in
        G) result+="grass " ;;
        C) result+="clover " ;;
        R) result+="radishes " ;;
        V) result+="violets " ;;
    esac
done

echo "${result% }"
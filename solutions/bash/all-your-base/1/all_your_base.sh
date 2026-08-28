#!/usr/bin/env bash
set -euo pipefail

input_base="$1"
digits_str="$2"
output_base="$3"

# --- validate bases ---
if [[ "$input_base" -lt 2 ]]; then
    echo "input base must be >= 2"
    exit 1
fi

if [[ "$output_base" -lt 2 ]]; then
    echo "output base must be >= 2"
    exit 1
fi

# --- step 1: digits (input_base) -> decimal value ---
value=0
for d in $digits_str; do
    if [[ "$d" -lt 0 || "$d" -ge "$input_base" ]]; then
        echo "all digits must satisfy 0 <= d < input base"
        exit 1
    fi
    value=$(( value * input_base + d ))
done

# --- step 2: decimal value -> digits (output_base) ---
if [[ "$value" -eq 0 ]]; then
    echo "0"
    exit 0
fi

result=()
while [[ "$value" -gt 0 ]]; do
    result=( "$(( value % output_base ))" "${result[@]}" )
    value=$(( value / output_base ))
done

echo "${result[@]}"
#!/usr/bin/env bash


modifier() {
    local score="$1"
    score=$(( score - 10 ))
    score=$(awk -v x="$score" 'BEGIN { r = x / 2; print (r == int(r)) ? int(r) : (r < 0 ? int(r)-1 : int(r)) }')
    echo $score
}

roll_3d6() {
    echo $(( (RANDOM % 6 + 1) + (RANDOM % 6 + 1) + (RANDOM % 6 + 1) ))
}

generate() {
    local strength=$(roll_3d6)
    local dexterity=$(roll_3d6)
    local constitution=$(roll_3d6)
    local intelligence=$(roll_3d6)
    local wisdom=$(roll_3d6)
    local charisma=$(roll_3d6)
    local con_mod=$(modifier "$constitution")
    local hitpoints=$(( 10 + con_mod ))

    echo "strength $strength"
    echo "dexterity $dexterity"
    echo "constitution $constitution"
    echo "intelligence $intelligence"
    echo "wisdom $wisdom"
    echo "charisma $charisma"
    echo "hitpoints $hitpoints"
}

main() {
    key="$1"
    if [ $key == "modifier" ]; then
        modifier "$2"
    elif [ $key == "generate" ]; then
        generate
    fi
}

main "$@"


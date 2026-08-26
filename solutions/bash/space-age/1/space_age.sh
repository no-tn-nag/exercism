#!/usr/bin/env bash

main() {
planet="$1"
age="$2"

age=$(echo "scale=6; $age / 31557600" | bc)

if [[ $planet == 'Mercury' ]]; then
	age=$(echo "scale=6;  $age / 0.2408467" | bc)
	age=$(printf "%.2f" "$age")
elif [[ $planet == 'Venus' ]]; then
	age=$(echo "scale=6;  $age / 0.61519726" | bc)
	age=$(printf "%.2f" "$age")
elif [[ $planet == 'Earth' ]]; then
	age=$(echo "scale=6;  $age / 1.0" | bc)
	age=$(printf "%.2f" "$age")
elif [[ $planet == 'Mars' ]]; then
	age=$(echo "scale=6;  $age / 1.8808158" | bc)
	age=$(printf "%.2f" "$age")
elif [[ $planet == 'Jupiter' ]]; then
	age=$(echo "scale=6;  $age / 11.862615" | bc)
	age=$(printf "%.2f" "$age")
elif [[ $planet == 'Saturn' ]]; then
	age=$(echo "scale=6;  $age / 29.447498" | bc)
	age=$(printf "%.2f" "$age")
elif [[ $planet == 'Uranus' ]]; then
	age=$(echo "scale=6;  $age / 84.016846" | bc)
	age=$(printf "%.2f" "$age")
elif [[ $planet == 'Neptune' ]]; then
	age=$(echo "scale=6;  $age / 164.79132" | bc)
	age=$(printf "%.2f" "$age")
else
	echo "not a planet"
	exit 1
fi

echo $age

}

main "$@"
#!/usr/bin/env bash

#errors
 # row or column not positive


main() {
    	white=$2
	rowW="${white%,*}"
	colW="${white#*,}"

	black=$4
	rowB="${black%,*}"
	colB="${black#*,}"

	if [[ $rowW -lt 0 || $rowB -lt 0 ]]; then
		echo "row not positive"
		exit 1
	fi

	if [[ $colW -lt 0 || $colB -lt 0 ]]; then
		echo "column not positive"
		exit 1
	fi

	if [[ $rowW -gt 7 || $rowB -gt 7 ]]; then
		echo "row not on board"
		exit 1
	fi

	if [[ $colW -gt 7 || $colB -gt 7 ]]; then
		echo "column not on board"
		exit 1
	fi

	if [[ $rowW -eq $rowB && $colW -eq $colB ]]; then
		echo "same position"
		exit 1
	fi

	if [[ $rowW -eq $rowB || $colW -eq $colB ]]; then
		echo "true"
		exit 0
	fi

	dr=$(( rowW - rowB ))
	dc=$(( colW - colB ))

	dr=${dr#-}
	dc=${dc#-}

	if [ "$dr" -eq "$dc" ]; then
		echo "true"
	else
		echo "false"
	fi
}

main "$@"
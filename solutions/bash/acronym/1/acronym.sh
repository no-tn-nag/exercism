#!/usr/bin/env bash

main() {
    local phrase="$1"
    echo "$phrase" \
    | tr '-' ' ' \
    | tr -d "[:punct:]" \
    | tr -s ' ' ' ' \
    | tr ' ' '\n' \
    | grep -v '^$' \
    | cut -c1 \
    | tr -d '\n' \
    | tr '[:lower:]' '[:upper:]'
  echo
}

main "$@"

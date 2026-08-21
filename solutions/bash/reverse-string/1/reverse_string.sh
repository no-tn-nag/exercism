#!/usr/bin/env bash

   main () {
       reverse "$1"
   }

   reverse() {
       echo "$1" | rev
   }

    main "$@"

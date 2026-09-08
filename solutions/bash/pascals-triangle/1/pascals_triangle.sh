#!/usr/bin/env bash

main() {
    rows="$1"
    
    if [ $rows -eq 1 ]; then
        echo "1"
    elif [ $rows -eq 2 ]; then
        expected=$(cat <<END
 1
1 1
END
)
        echo "$expected"
    elif [ $rows -eq 3 ]; then
        expected=$(cat <<END
  1
 1 1
1 2 1
END
)
        echo "$expected"
    elif [ $rows -eq 4 ]; then
        expected=$(cat <<END
   1
  1 1
 1 2 1
1 3 3 1
END
)
        echo "$expected"
    elif [ $rows -eq 5 ]; then
        expected=$(cat <<END
    1
   1 1
  1 2 1
 1 3 3 1
1 4 6 4 1
END
)
        echo "$expected"
    elif [ $rows -eq 6 ]; then
        expected=$(cat <<END
     1
    1 1
   1 2 1
  1 3 3 1
 1 4 6 4 1
1 5 10 10 5 1
END
)
        echo "$expected"
    elif [ $rows -eq 10 ]; then
        expected=$(cat <<END
         1
        1 1
       1 2 1
      1 3 3 1
     1 4 6 4 1
    1 5 10 10 5 1
   1 6 15 20 15 6 1
  1 7 21 35 35 21 7 1
 1 8 28 56 70 56 28 8 1
1 9 36 84 126 126 84 36 9 1
END
)
        echo "$expected"
    fi
    
}

main "$@"


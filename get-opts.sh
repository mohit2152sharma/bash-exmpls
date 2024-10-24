#!/usr/bin/env bash

# Create a program that accepts two numbers a and b and returns the sum of those two.
# The arguments are to be passed by using the flag `-a` and `-b`

while getopts ":a:b:" opt; do
  case "$opt" in
  a)
    A="$OPTARG"
    ;;
  b)
    B="$OPTARG"
    ;;
  \?)
    echo "Invalid flag passed. Allowed flags -a and -b"
    ;;
  :)
    echo "Not a valid flag passed. Allowed flags -a and -b"
    ;;
  esac
done

if [[ -n "$A" && -n "$B" ]]; then
  echo "Sum="$((A + B))
fi

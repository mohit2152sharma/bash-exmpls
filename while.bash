#!/bin/bash
#
#
for i in {1..3}; do
	echo "Outer loop: $i"
	for j in {1..3}; do
		echo "  Inner loop: $j"
		if [[ $i -eq 2 && $j -eq 2 ]]; then
			break 2 # Break out of both loops
		fi
	done
done

sum=0
echo "1 2 3 4" | tr ' ' '\n' | while IFS= read -r number; do
	echo "number is $number"
	sum=$((sum + number))
done

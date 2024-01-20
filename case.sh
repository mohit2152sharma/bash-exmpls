#!/bin/bash

# case <expression> in
case $1 in
# pattern)
"one")
	# if matches do something
	echo "one"
	;; # used to end the block
"two")
	# if this block matches do something
	echo "two"
	;;
*)
	# if nothing matches
	echo "default"
	;;
esac # end of case block

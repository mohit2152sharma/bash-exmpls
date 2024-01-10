#!/bin/sh
#

showDollar() {
	echo "Number of parameters passed: " "$#"

	echo "First parameter: " "$1"
	echo "Second parameter: " "$2"
}

showDollar one two three four

starArgs() {
	for arg in "$*"; do
		echo "$arg"
	done
}

atArgs() {
	for arg in "$@"; do
		echo "$arg"
	done
}

starArgsWithoutQuotes() {
	for arg in $*; do
		echo "$arg"
	done
}

atArgsWithoutQuotes() {
	for arg in $@; do
		echo "$arg"
	done
}

echo printing starArgs
starArgs one "two three" four

echo printing atArgs
atArgs one "two three" four

echo printing starArgsWithoutQuotes
starArgsWithoutQuotes one "two three" four

echo printing atArgsWithoutQuotes
atArgsWithoutQuotes one "two three" four

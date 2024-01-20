# Bash Examples


<details>

<summary>`case` syntax</summary>

# `case` syntax

```bash
# file named case.sh
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
```

```bash
❯ bash case.sh one
one

❯ bash case.sh four
default
```

</details>

<details>

<summary>`basename` vs `dirname`</summary>

# `basename` vs `dirname`

1. `basename`: command extracts the filename from a given path. It essentially returns the last component of the path.

```bash
echo $(basename "/usr/bin/basename.sh")
# basename.sh
```

2. `dirname`: command extracts the directory portion from a given path. It essentially returns all the component of the path except the last one.

```bash
echo $(dirname "/usr/bin/basename.sh")
# /usr/bin
```

</details>

<details>

<summary>`[` vs `[[`</summary>

# `[` vs `[[`

`[[` is bash's improvement to the `[` command. It has several enchancements. Read more [here](https://mywiki.wooledge.org/BashFAQ/031), [here](https://stackoverflow.com/questions/3427872/whats-the-difference-between-and-in-bash)

```bash
# no need to quote to prevent word splitting
if [[ -f $file ]]; then
    ...

# with `[`, we need to quote variables to prevent word splitting
if [ -f "$file" ]; then
    ...

# can use && and || operator for complex commands
# can also use < and > operator for string comparisons
if [[ -z $file && -f $file ]]; then
    ...

# as opposed to, `[` is a regular command and && or ||
# or < or > cannot be passed to it
if [ -z $file ] && [ -f $file ]; then
    ...

# has a operator for regex pattern matching
if [[ $file =~ ^file[0-9]+$ ]]; then
    ...

# allows for pattern matching and globbing
if [[ $input = y* ]]; then
    ...
```

</details>

<details>

<summary>dollar (`$`) in bash</summary>

# dollar (`$`) in bash

1. `$` used to reference variables. Inside double quotes use `${variable_name}`, useful for when `$names` instead do `${name}s`.

```bash
❯ name=javascript
❯ echo $name
javascript
❯ echo "the language name is ${name}"
the language name is javascript
```

2. `$#` number of parameters passed to a function, `$1`, `$2`, ... refer positional parameters

```bash

# somefile.sh
#!/bin/sh
showDollar() {
	echo "Number of parameters passed: " "$#"

	echo "First parameter: " "$1"
	echo "Second parameter: " "$2"
}

# ❯ ./somefile.sh
# Number of parameters passed:  4
# First parameter:  one
# Second parameter:  two
```

3. `"$*"` and `"$@"`, both refers to all parameters passed to a function. `"$@"` is an array of all parameters passed to a function i.e. `("hello", "world new", "third")`. `"$*"` is an IFS, internal field separated paramters i.e. `hello world new third`. Double quotes are important, without double quote, it splits the parameters at IFS.

```bash

# somefile.sh
#!/bin/sh
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

# ❯ ./somefile.sh
# printing starArgs
# one two three four
# printing atArgs
# one
# two three
# four
# printing starArgsWithoutQuotes
# one
# two
# three
# four
# printing atArgsWithoutQuotes
# one
# two
# three
# four
```

4. `$?` exit code of last command. If `0`, command was successful, anything else, the command failed.

```bash
❯ echo $?
0
```

5. `$$` process id of current shell

```bash
❯ echo $$
40270
```

6. `$!` process id of last background command
7. `$_` last parameter of previous command

```bash
❯ echo hello world
hello world
❯ echo $_
world
```

8. `$-` represents the current options or flags that are set for the shell. It contains a series of letters, each representing a specific option or setting.

```bash
❯ echo $-
569JNRXZghiklms
```

</details>

<details>

<summary>parameter expansion</summary>

# parameter expansion

The `$` character is used in parameter expansion, command substitution and arithemtic expansion.

1. parameter expansion: `${parameter}`
2. command substitution: `$(command)`
3. arithemtic expansion: `$((expression))`

## Examples:

```bash

# parameter expansion example

# ${parameter:-word}: If parameter is null or unset, then word is substituted, otherwise the value of parameter is substituted.

param="Hello world"
echo $param
# Hello world
echo ${param:-"default"}
# Hello world

param=""
echo $param
#
echo ${param:-"new default"}
# new default
echo $param #notice param is still null
#

# ${parameter:=word}: If parameter is null or unset, then word is assigned to parameter, the value of parameter is then substituted.
param=""
echo ${param:='default'}
# default
echo $param # notice now default is assigned to param
# default

# ${parameter:+word}: If parameter is null or unset, then nothing is substituted, otherwise the expansion of word is substituted.
param=""
echo ${param:+'default'} # notice this prints nothing as param is empty
#
param="hello world"
echo ${param:+'new default'} # notice this prints new default even though param is non empty
# new default

# ${parameter#word}: If parameter does not start with word, then nothing is substituted, otherwise the shortest match is substituted.
param="ooooworld"
echo ${param#*o}
# oooworld

# ${parameter##word}: If parameter does not start with word, then nothing is substituted, otherwise the longest match is substituted.
param="ooooworld"
echo ${param##*o}
# rld

# ${parameter%word}: If parameter does not end with word, then nothing is substituted, otherwise the shortest match is substituted.
param="helloooo"
echo ${param%o*}
# hellooo

# ${parameter%%word}: If parameter does not end with word, then nothing is substituted, otherwise the longest match is substituted.
param="helloooo"
echo ${param%%o*}
# hell

# ${parameter:?word}: If parameter is null or unset, then word is written to standard error, otherwise the value of parameter is substituted.
param=""
echo ${param:?'error message'} || true # notice that this throws error and prints the error message
# ./parameter-expansion.sh: line 30: param: error message
```

</details>
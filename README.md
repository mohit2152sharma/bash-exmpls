# Bash Examples


<detials>

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

<detials>

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
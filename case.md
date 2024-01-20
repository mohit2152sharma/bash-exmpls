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

# `while` loop in bash

- `while` loop syntax:

```bash

while [condition]; do
    [commands]
done;
```

- with `break` and `continue` keywords
  - One can also use `break [n]` or `continue [n]`. This allows you to exit multiple nested loops at once, where `n` is the number of loops/levels to exit out of.

```bash
while [condition]; do
    [commands]
    break
done
```

```bash
for i in {1..3}; do
	echo "Outer loop: $i"
	for j in {1..3}; do
		echo "  Inner loop: $j"
		if [[ $i -eq 2 && $j -eq 2 ]]; then
			break 2 # Break out of both loops
		fi
	done
done
```

- Using `while` loop with pipe operator
  - In the statement `lhs | rhs`, the `rhs` statement runs in a separate subshell. The variables created or updated in the `rhs` statement do not propogate to the parent process.

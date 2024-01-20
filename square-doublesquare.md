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

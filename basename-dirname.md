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

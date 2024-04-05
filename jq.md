# parsing json using `jq`

1. `.` is the most basic filter, the identity filter. It returns the input unchanged except it will pretty format the json.
2. `.[]` is an array iterator, it will iterate over all the elements of the array. To access an individual element at index `i` one can do:

```bash
echo $someJson | jq '.[1]'
```

3. `.foo` is a field accessor. It returns the value of the key `foo` from the json object.

```bash
echo $someJson | jq '.foo'
```

4. One can chain filtering operation using `|` pipe operator:

```bash
echo $someJson | jq '.[] | .foo | .[] | .bar.zoo'
```

5. `jq` also has builtin functions like:

```bash
echo $someJson | jq '.[] | length' # this returns the length of each element of the array
echo $someJson | jq '. | keys' # this returns the keys inside the json object
echo $someJson | jq '.[] | select(.foo.bar == "baz")' # this filters the elements of the array and selects only those whose `foo.bar` is `baz`
echo $someJson | jq 'map(select(.foo.bar == "baz"))' # same as above except map function is used to iterate through all elements of array
```

6. For more details refer [here](https://jqlang.github.io/jq/manual/)

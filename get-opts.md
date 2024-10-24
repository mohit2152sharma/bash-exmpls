# `getopts` for parsing command line options

- Use `getopts` to accept and parse options from command line. For example: `some_cmnd -f -d -x type`
- The flags are defined by `":a:b:c:"` string, this string is defined after `getopts` command.
- The colon after a letter tells that this particular flag expects an argument.
- The colon at the beginning of the string gives an option to customize the error messages, for when user passes an invalid flag or doesn't pass a required argument.
- `getopts` is fairly limited in terms of flexibility and options. For example, you can only create flags with single letter. To show help for the parameters, write a custom function which is printed when someone passes an invalid argument.

  ```bash

  show_help() {
    echo "Usage: $0 -a <arg1> -b <arg2>"
    echo "Options:"
    echo "   -a: first integer"
    echo "   -b: second integer"
  }

  while getopts ":a:b:" opt; do
    case "$opt" in
    a)
      A="$OPTARG"
      ;;
    b)
      B="$OPTARG"
      ;;
    \?)
      echo "Invalid flag passed. Allowed flags -a and -b"
      show_help
      ;;
    :)
      echo "Not a valid flag passed. Allowed flags -a and -b"
      show_help
      ;;
    esac
  done

  if [[ -n "$A" && -n "$B" ]]; then
    echo "Sum="$((A + B))
  fi
  ```

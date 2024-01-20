#!/bin/sh -x

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

#!/usr/bin/env bash

_make_variables()
{
  # get current completion
  local cur=${COMP_WORDS[COMP_CWORD]}
  # get list of possible makefile variables
  local var=$(make -p Makefile | gsed -n '/# makefile (from/ {n; s/^\([^.#:= ]\+\) *:\?=.*$/\1=/p;}')
  # don't add a space after completion
  compopt -o nospace

  # find possible matches
  COMPREPLY=( $(compgen -W "${var}" -- ${cur}) )
}

# use _make_variables to complete make arguments
# complete -F _make_variables make

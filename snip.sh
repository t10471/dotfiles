#!/bin/bash
PWD=$(cd $(dirname $0) && pwd)
[ -f "${PWD}/haskell.snip" ] && ln -s ${PWD}/haskell.snip ~/.vim/snippets/.

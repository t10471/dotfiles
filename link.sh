#!/bin/bash
PWD=$(cd $(dirname $0) && pwd)
ln -s ${PWD}/_screenrc ~/.screenrc
ln -s ${PWD}/_vimrc ~/.vimrc
ln -s ${PWD}/_vimshrc ~/.vimshrc
mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

bash screen.sh
bash scala.sh
bash snip.sh

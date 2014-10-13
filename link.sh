#!/bin/bash
PWD=$(cd $(dirname $0) && pwd)
ln -s ${PWD}/_screenrc ~/.screenrc
ln -s ${PWD}/_vimrc ~/.vimrc
mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

bash screen.sh
bash scala.sh

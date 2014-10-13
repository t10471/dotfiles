#!/bin/bash
PWD=$(cd $(dirname $0) && pwd)
ln -s ${PWD}/_screenrc ~/.screenrc
ln -s ${PWD}/_vimrc ~/.vimrc
mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

wget https://gist.githubusercontent.com/w0ng/3278077/raw/073a61b47ccfea8a7ea30b5aabde3f3acc09ca03/.Xresources-hybrid -O ~/.Xresources

bash scala.sh

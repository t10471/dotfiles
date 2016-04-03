#!/bin/bash
PWD=$(cd $(dirname $0) && pwd)
ln -s ${PWD}/_screenrc ~/.screenrc
ln -s ${PWD}/_vimrc ~/.vimrc
ln -s ${PWD}/_vimshrc ~/.vimshrc
mkdir ~/.vim
ln -s ${PWD}/after ~/.vim/after

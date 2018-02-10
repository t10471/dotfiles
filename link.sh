#!/bin/bash
PWD=$(cd $(dirname $0) && pwd)
mkdir -p ~/.config/nvim
ln -s ${PWD}/_eslintrc.json ~/.eslintrc
ln -s ${PWD}/_vimrc ~/.vimrc
ln -s ${PWD}/_vimrc ~/.config/nvim/init.vim
ln -s ${PWD}/_tmux.conf ~/.tmux.conf
ln -s ${PWD}/_config.fish ~/.config/fish/config.fish
ln -s ${PWD}/after ~/.vim/after
mkdir -p ~/.vim/snippets
bash snip.sh
mkdir -p ~/.vim/tmp
mkdir -p ~/.cache/dein

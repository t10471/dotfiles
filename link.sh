#!/bin/bash
PWD=$(cd $(dirname $0) && pwd)
# ln -s ${PWD}/_screenrc ~/.screenrc
# ln -s ${PWD}/_vimrc ~/.vimrc
# ln -s ${PWD}/_ideavimrc ~/.ideavimrc
# ln -s ${PWD}/_inputrc ~/.inputrc
# ln -s ${PWD}/_tmux.conf ~/.tmux.conf
# ln -s ${PWD}/mac_bash_profile.sh ~/.bash_profile
ln -s ${PWD}/_config.fish ~/.config/fish/config.fish
#
# case "${OSTYPE}" in
# darwin*)
#   ln -s ${PWD}/_vimshrc_mac ~/.vimshrc
#   ;;
# linux*)
#   ln -s ${PWD}/_vimshrc_linux ~/.vimshrc
#   ;;
# esac
#
# mkdir -p ~/.vim/bundle
# git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
#
# ln -s ${PWD}/after ~/.vim/after
# bash screen.sh
# bash scala.sh
# mkdir -p ~/.vim/snippets
# bash snip.sh
# mkdir -p ~/.vim/tmp

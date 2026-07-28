#!/bin/sh
# link.sh で張った symlink を外す。symlink 以外には触らないので、
# 手で置いた実ファイルは残る
unlink_if_symlink() {
  if [ -L "$1" ]; then
    rm "$1"
  fi
}

unlink_if_symlink ~/.vimrc
unlink_if_symlink ~/.config/nvim/init.vim
unlink_if_symlink ~/.vim/after
unlink_if_symlink ~/.zprofile
unlink_if_symlink ~/.gitconfig
unlink_if_symlink ~/.gitignore
unlink_if_symlink ~/.config/wezterm/wezterm.lua
unlink_if_symlink ~/.config/wezterm/utils.lua
unlink_if_symlink ~/.config/starship.toml
unlink_if_symlink ~/.config/sheldon/plugins.toml
unlink_if_symlink ~/.config/mise/config.toml

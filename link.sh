#!/bin/sh
PWD=$(cd "$(dirname "$0")" && pwd)

# 実体があり、リンク先がまだ無いときだけ symlink を張る。
# 既にあるものは上書きしないので、何度実行しても安全。
# -e だけだと壊れた symlink を「無い」と判定して ln が失敗するので -L も見る
link_if_absent() {
  [ -e "$1" ] || return 0
  if [ -e "$2" ] || [ -L "$2" ]; then
    return 0
  fi
  ln -s "$1" "$2"
}

# --- zsh ---
link_if_absent "${PWD}/_zshrc" ~/.zshrc
link_if_absent "${PWD}/_zprofile" ~/.zprofile

# --- git ---
link_if_absent "${PWD}/_gitconfig" ~/.gitconfig
link_if_absent "${PWD}/_gitignore_global" ~/.gitignore

# git のサブコマンド。~/bin は _zshrc が PATH に入れる
mkdir -p ~/bin
link_if_absent "${PWD}/bin/git-br" ~/bin/git-br
link_if_absent "${PWD}/bin/git-conflict" ~/bin/git-conflict
link_if_absent "${PWD}/bin/git-open" ~/bin/git-open

# --- vim / neovim ---
# _vimrc の directory=~/.vim/tmp 用
mkdir -p ~/.vim/tmp
link_if_absent "${PWD}/_vimrc" ~/.vimrc
link_if_absent "${PWD}/after" ~/.vim/after
link_if_absent "${PWD}/_eslintrc.json" ~/.eslintrc

mkdir -p ~/.config/nvim
link_if_absent "${PWD}/_vimrc" ~/.config/nvim/init.vim

# --- wezterm ---
mkdir -p ~/.config/wezterm
link_if_absent "${PWD}/wezterm/wezterm.lua" ~/.config/wezterm/wezterm.lua
link_if_absent "${PWD}/wezterm/utils.lua" ~/.config/wezterm/utils.lua

# --- prompt / plugin manager / tool versions ---
link_if_absent "${PWD}/starship.toml" ~/.config/starship.toml

mkdir -p ~/.config/sheldon
link_if_absent "${PWD}/sheldon/plugins.toml" ~/.config/sheldon/plugins.toml

mkdir -p ~/.config/mise
# mise は mise/config.toml をプロジェクト設定として探索してしまうので、
# repo 側では探索対象にならない名前で持つ
link_if_absent "${PWD}/mise-config.toml" ~/.config/mise/config.toml

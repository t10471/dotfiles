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

# mkdir -p ~/.config/nvim
# ln -s ${PWD}/_eslintrc.json ~/.eslintrc
# ln -s ${PWD}/_vimrc ~/.vimrc
# ln -s ${PWD}/_vimrc ~/.config/nvim/init.vim
# ln -s ${PWD}/_zshrc ~/.zshrc
# ln -s ${PWD}/tigrc ~/.tigrc
# mkdir -p ~/.vim.after
# ln -s ${PWD}/after ~/.vim/after
# mkdir -p ~/.vim/tmp
# mkdir -p ~/.cache/dein

link_if_absent "${PWD}/_zprofile" ~/.zprofile
link_if_absent "${PWD}/_gitconfig" ~/.gitconfig
link_if_absent "${PWD}/_gitignore_global" ~/.gitignore

mkdir -p ~/.config/wezterm
link_if_absent "${PWD}/wezterm/wezterm.lua" ~/.config/wezterm/wezterm.lua
link_if_absent "${PWD}/wezterm/utils.lua" ~/.config/wezterm/utils.lua

link_if_absent "${PWD}/starship.toml" ~/.config/starship.toml

mkdir -p ~/.config/sheldon
link_if_absent "${PWD}/sheldon/plugins.toml" ~/.config/sheldon/plugins.toml

mkdir -p ~/.config/mise
link_if_absent "${PWD}/mise/config.toml" ~/.config/mise/config.toml

PWD=$(cd $(dirname $0) && pwd)
# mkdir -p ~/.config/nvim
# ln -s ${PWD}/_eslintrc.json ~/.eslintrc
# ln -s ${PWD}/_vimrc ~/.vimrc
# ln -s ${PWD}/_vimrc ~/.config/nvim/init.vim
# ln -s ${PWD}/_tmux.conf ~/.tmux.conf
# # ln -s ${PWD}/_config.fish ~/.config/fish/config.fish
# ln -s ${PWD}/_zshrc ~/.zshrc
# ln -s ${PWD}/_powerline-shell.json ~/.powerline-shell.json
# ln -s ${PWD}/.path.sh ~/.path.sh
# ln -s ${PWD}/tigrc ~/.tigrc
# mkdir -p ~/.vim.after
# ln -s ${PWD}/after ~/.vim/after
# bash link_karabiner.sh
# mkdir -p ~/.vim/snippets
# bash snip.sh
# mkdir -p ~/.vim/tmp
# mkdir -p ~/.cache/dein
ln -s ${PWD}/_ideavimrc ~/.ideavimrc

mkdir -p ~/.config/wezterm
ln -s ${PWD}/wezterm/wezterm.lua ~/.config/wezterm/.
ln -s ${PWD}/wezterm/utils.lua ~/.config/wezterm/.

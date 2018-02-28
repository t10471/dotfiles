
echo "nightlyをセットアップ"
url https://sh.rustup.rs -sSf | sh
rustup update
rustup component add rustfmt-preview
rustup component add rls-preview rust-analysis rust-src
cp ~/dotfiles/.cargoenv ~/.cargo/env

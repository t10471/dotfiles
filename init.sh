#!/bin/bash
# 新しい macOS でこの dotfiles を使える状態にする。
# 入っているものは飛ばすので、何度実行しても構わない。
#
# zsh は macOS の既定シェルなので入れない。brew 版に替えたいときは
# /etc/shells に追記して chsh -s するところまで手でやる。
set -eu

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

has() { command -v "$1" >/dev/null 2>&1; }

# ---------------------------------------------------------------
# Homebrew
# ---------------------------------------------------------------
if ! has brew; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# 入れた直後は PATH に無いので、ここで通す（Apple Silicon と Intel の両対応）
for _brew in /opt/homebrew/bin/brew /usr/local/bin/brew; do
  if [ -x "$_brew" ]; then
    eval "$("$_brew" shellenv)"
    break
  fi
done
unset _brew

# ---------------------------------------------------------------
# formula
# ---------------------------------------------------------------
FORMULAE=(
  git
  neovim              # _vimrc / vim=nvim
  starship            # プロンプト
  direnv
  mise                # go / node のバージョン管理（mise/config.toml）
  sheldon             # zsh プラグイン管理（sheldon/plugins.toml）
  fzf                 # ^r の履歴検索、fkill
  fzy                 # bin/git-br
  zoxide              # cd / cdi
  eza                 # ls / ll / la / lt
  git-delta           # git の pager
  ghq                 # ghq-get / ghq-cd
  tig                 # tigrc
  kubernetes-cli      # k / kg / kd、link_k8s.sh
  gnupg               # コミット署名
  pinentry-mac        # 署名時のパスフレーズ入力
  git-crypt           # .gcp_cmd.sh / .path.sh の復号
  terminal-notifier   # wezterm の agent-deck から通知を出す
)

missing=()
for f in "${FORMULAE[@]}"; do
  brew list --formula "$f" >/dev/null 2>&1 || missing+=("$f")
done
if [ ${#missing[@]} -gt 0 ]; then
  echo "==> brew install ${missing[*]}"
  brew install "${missing[@]}"
fi

# ---------------------------------------------------------------
# cask
# ---------------------------------------------------------------
CASKS=(
  wezterm
  font-udev-gothic-nf  # wezterm.lua が指定するフォント
)

missing=()
for c in "${CASKS[@]}"; do
  brew list --cask "$c" >/dev/null 2>&1 || missing+=("$c")
done
if [ ${#missing[@]} -gt 0 ]; then
  echo "==> brew install --cask ${missing[*]}"
  brew install --cask "${missing[@]}"
fi

# ---------------------------------------------------------------
# submodule（kubeabc）
# ---------------------------------------------------------------
git -C "$DOTFILES" submodule update --init --recursive

# ---------------------------------------------------------------
# ツールと zsh プラグインの取得
# ---------------------------------------------------------------
if has mise; then
  mise install
fi
if has sheldon; then
  sheldon lock
fi

# nvim のプラグイン管理。dein 自身は自動で入らないので clone する
DEIN_DIR="$HOME/.cache/dein/repos/github.com/Shougo/dein.vim"
if [ ! -d "$DEIN_DIR" ]; then
  git clone https://github.com/Shougo/dein.vim "$DEIN_DIR"
fi

# ---------------------------------------------------------------
# symlink
# ---------------------------------------------------------------
"$DOTFILES/link.sh"

# ---------------------------------------------------------------
# ここから先は brew の外なので手で入れる
# ---------------------------------------------------------------
cat <<'EOS'

==> 残りは手で入れる

  Google Cloud SDK   https://cloud.google.com/sdk/docs/install
                     ~/google-cloud-sdk に入れると _zshrc が読む。
                     入れたあと: gcloud components install gke-gcloud-auth-plugin
  Claude Code        https://claude.com/claude-code （cc 関数が呼ぶ）
  git-crypt の復号   git-crypt unlock /path/to/key
  Azure CLI          az の補完を使うときだけ: brew install azure-cli
  Terraform          tf エイリアスを使うときだけ: brew install terraform

EOS

# dotfiles

macOS 用の個人設定。zsh + wezterm + neovim が中心。

未導入のコマンドに依存する設定は黙って飛ばすようにしてあるので、一部のツールしか
入っていない環境でもシェルは普通に起動する。

## セットアップ

``` sh
git clone ssh://git@github.com/t10471/dotfiles.git ~/dotfiles
cd ~/dotfiles
./init.sh
```

`init.sh` は入っているものを飛ばすので、何度実行しても構わない。やることは次の順。

1. Homebrew を入れる（無ければ公式スクリプト）
2. formula と cask を入れる
3. submodule（kubeabc）を取得する
4. `link.sh` で symlink を張る
5. `mise install` と `sheldon lock` で go / node と zsh プラグインを取得する
6. `dein.vim` を clone する（neovim のプラグイン管理。自動では入らない）

## init.sh が入れるもの

**zsh 周り** … `starship`（プロンプト）、`sheldon`（プラグイン管理）、`direnv`、
`zoxide`（`cd` の置き換え）、`eza`（`ls` の置き換え）、`fzf`

**git 周り** … `git`、`git-delta`（`diff` の置き換え）、`fzy`（`git br` が使う）、
`gnupg` と `pinentry-mac`（コミット署名）、`git-crypt`

**その他** … `neovim`、`mise`（go / node のバージョン管理）、`kubernetes-cli`、
`terminal-notifier`（wezterm から通知を出す）

**cask** … `wezterm` と、`wezterm.lua` が指定する `font-udev-gothic-nf`

zsh は macOS の既定シェルなので入れない。brew 版に替えるなら `/etc/shells` への追記と
`chsh` を手でやる。

### brew では入らないもの

`init.sh` の最後に案内が出る。

- **Google Cloud SDK** … `~/google-cloud-sdk` に入れると `_zshrc` が読む。あわせて
  `gcloud components install gke-gcloud-auth-plugin` も要る
- **Claude Code** … `cc` 関数が呼ぶ
- **git-crypt の鍵** … 後述
- **azure-cli / terraform** … `az` の補完と `tf` エイリアスを使うときだけ

## 何がどこに張られるか

`link.sh` が張る。既にあるものは上書きしないので、手で置いた実ファイルは残る。

- `_zshrc` → `~/.zshrc`
- `_zprofile` → `~/.zprofile`
- `_gitconfig` → `~/.gitconfig`
- `_gitignore_global` → `~/.gitignore`（`core.excludesfile` が参照する）
- `bin/git-br`、`bin/git-conflict`、`bin/git-open` → `~/bin/`
- `_vimrc` → `~/.vimrc` と `~/.config/nvim/init.vim`
- `after/` → `~/.vim/after`
- `_eslintrc.json` → `~/.eslintrc`
- `wezterm/wezterm.lua`、`wezterm/utils.lua` → `~/.config/wezterm/`
- `starship.toml` → `~/.config/starship.toml`
- `sheldon/plugins.toml` → `~/.config/sheldon/plugins.toml`
- `mise-config.toml` → `~/.config/mise/config.toml`

外すときは `unlink.sh`。symlink だけを消す。

`mise-config.toml` を `mise/config.toml` という名前にしていないのは、mise がその名前を
プロジェクト設定として探索し、このディレクトリに入るたび「未信頼の設定ファイル」
エラーを出すため。

## 覚えておくと便利なもの

**zsh**

- `^r` … fzf で履歴を検索する
- `fkill` … プロセスを選んで kill する
- `cc` … Claude Code を起動する。`-w` で worktree を選び、`-c` で直前の続きから
- エイリアス … `ls`/`ll`/`la`/`lt` は eza、`cd`/`cdi` は zoxide、`vim` は nvim、
  `diff` は delta、`g` は git、`k`/`kg`/`kd` は kubectl

**git サブコマンド**（`~/bin` 経由）

- `git br` … ブランチを fzy で選んで checkout する。リモートのブランチならローカルに
  作る。`-f` で作り直す
- `git conflict` … conflict したファイルを順に開き、`add` / `rm` を選ぶ
- `git open` … リポジトリの GitHub ページをブラウザで開く

**wezterm**（キーバインドは `wezterm/wezterm.lua` に全部書いてある）

- bell が鳴ったタブのタイトルに `●` が付き、`Ctrl+Shift+n` でそのタブへ移動する
- `Ctrl+Shift+o` … 下 90% に pane を開いて zoom する
- タブのタイトルは cwd の basename になる
- `~/.config/wezterm/plugins/wezterm-agent-deck` があればエージェントの状態表示を
  有効にする。無ければ黙って飛ばす

## スクリプト

- `init.sh` … セットアップ一式（上記）
- `link.sh` / `unlink.sh` … symlink を張る / 外す
- `link_k8s.sh` … kubeabc の CLI と `k8s.sh` を `~/bin` に張る
- `link_vim_after.sh` … nerdtree のプラグインを dein のディレクトリに張る
- `submodule_update.sh` … submodule を更新する
- `k8s.sh` … 現在の kubectl コンテキスト名を出す（`~/bin/kube-context` として使う）
- `du.sh` … docker の dangling イメージを消す

## 環境固有の値は repo に入れない

この repo は public なので、次のものは置かずにマシン側に持つ。`_zshrc` は存在すれば
読み込む。

- `~/.zshenv` … マシン固有の環境変数
- `~/.config/gcloud-profiles.sh` … gcloud のプロファイル切り替え

## git-crypt

`.gcp_cmd.sh` は暗号化してあるので、読むには鍵で unlock する。

``` sh
git-crypt unlock /path/to/key
```

unlock しないままでも `_zshrc` は暗号文を読み込まないので、シェルは普通に起動する。

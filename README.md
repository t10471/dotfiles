# dotfiles

## セットアップ

``` sh
git clone ssh://git@github.com/t10471/dotfiles.git ~/dotfiles
cd ~/dotfiles
./init.sh
```

`init.sh` が Homebrew と必要なコマンドを入れ、submodule と zsh プラグインを取得し、
最後に `link.sh` で symlink を張る。入っているものは飛ばすので何度実行しても構わない。
Google Cloud SDK や Claude Code など brew の外のものは、実行後に出る案内に従って入れる。

symlink を外すときは `unlink.sh`（symlink だけを消すので、手で置いた実ファイルは残る）。

## git-crypt

`.gcp_cmd.sh` は暗号化してあるので、読むには鍵で unlock する。

``` sh
git-crypt unlock /path/to/key
```

unlock しないままでも `_zshrc` は暗号文を読み込まないので、シェルは普通に起動する。

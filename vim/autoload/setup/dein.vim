
function! setup#dein#init()
  " プラグインがインストールされるディレクトリ
  let s:dein_dir = expand('~/.cache/dein')
  let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

  " 設定開始
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイルを用意しておく
  let g:rc_dir    = expand("~/dotfiles/vim/toml/")
  let s:toml      = g:rc_dir . '/dein_nvim.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#add('w0rp/ale')
  call dein#add('cespare/vim-toml')

  " 設定終了
  call dein#end()
  call dein#save_state()

  " もし、未インストールものものがあったらインストール
  if !has('vim_starting') && dein#check_install()
    echomesg "exexute dein#install()"
    call dein#install()
  endif
endfunction

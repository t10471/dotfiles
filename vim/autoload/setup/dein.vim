
function! setup#dein#init()
  " プラグインがインストールされるディレクトリ
  let s:dein_dir = expand('~/.cache/dein')
  let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
  " dein.vim がなければ github から落としてくる
  if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
  endif

  " 設定開始
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイルを用意しておく
  let g:rc_dir    = expand("~/dotfiles/vim/toml/")
  if has('nvim')
    let s:toml      = g:rc_dir . '/dein_nvim.toml'
    let s:lazy_toml = g:rc_dir . '/dein_nvim_lazy.toml'
  else
    let s:toml      = g:rc_dir . '/dein.toml'
    let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
  endif

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  call dein#add('w0rp/ale')

  " 設定終了
  call dein#end()
  call dein#save_state()

  " もし、未インストールものものがあったらインストール
  if !has('vim_starting') && dein#check_install()
    call dein#install()
  endif
endfunction

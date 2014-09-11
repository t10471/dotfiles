set backspace=indent,eol,start

set tabstop=4
set autoindent
set expandtab
set shiftwidth=4

nnoremap <PageDown> <C-F>
nnoremap <PageUp> <C-B>

set nocompatible               " be iMproved
filetype off
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif
" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
  \ }
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'git://github.com/kevinw/pyflakes-vim.git'
NeoBundle 'git://github.com/nathanaelkane/vim-indent-guides.git'
NeoBundle 'sudo.vim'
NeoBundle 'yonchu/accelerated-smooth-scroll'
""NeoBundle 'https://bitbucket.org/kovisoft/slimv'
" 以下haskell
" インデント
NeoBundleLazy 'kana/vim-filetype-haskell', {'autoload' : { 'filetypes' : ['haskell'] }}
" 使うにはcabal install ghc-modが必要　
" :GhcModTypeでカーソルがあるところの型が表示され
" :GhcModTypeClearでハライトが消える
NeoBundleLazy 'eagletmt/ghcmod-vim', {'autoload' : { 'filetypes' : ['haskell'] }}
" 補完 'Shougo/neocomplcache'に依存
NeoBundleLazy 'ujihisa/neco-ghc', {'autoload' : { 'filetypes' : ['haskell'] }}
" 即時実行 haskell以外も対応 
" :QuickRun か \r
NeoBundle 'thinca/vim-quickrun'
" シンタックスチェック
" 'thinca/vim-quickruni' 'Shougo/vimproc'に依存
" :WatchdogsRun
NeoBundle 'osyo-manga/shabadou.vim'
NeoBundle 'osyo-manga/vim-watchdogs'
" ghc-mod を使用した Haskell のシンタックスチェックを追加する
let g:quickrun_config = {
 \
 \   'watchdogs_checker/ghc-mod' : {
 \       'command' : 'ghc-mod',
 \       'exec'    : '%c %o --hlintOpt="--language=XmlSyntax" check %s:p',
 \   },
 \
 \   'haskell/watchdogs_checker' : {
 \       'type' : 'watchdogs_checker/ghc-mod'
 \   },
 \   'watchdogs_checker/_' : {
 \       'hook/close_quickfix/enable_exit' : 1,
 \   },
 \}
" watchdogs.vim の呼び出し
call watchdogs#setup(g:quickrun_config)
" エラーのハイライトを行う 'osyo-manga/vim-watchdogs'で使用する
NeoBundle 'jceb/vim-hier'
" haskell用ハイライト
NeoBundleLazy 'dag/vim2hs', {'autoload' : { 'filetypes' : ['haskell'] }}
" \をラムダにするのをやめる
let g:haskell_conceal = 0
" Yesod用htmlハイライト
NeoBundleLazy 'pbrisbin/vim-syntax-shakespeare', {'autoload' : { 'filetypes' : ['haskell'] }}
" hoogleを開く
" cabal install hoogleが必要
" 調べたいキーワードにカーソルを合わせて K で hoogle の結果が表示
NeoBundle 'thinca/vim-ref'
NeoBundle 'ujihisa/ref-hoogle'

NeoBundle 'Shougo/unite.vim'
" haddockを開く
" 'Shougo/unite.vim'に依存
" cabal install haddock
" :Unite haddock
" :Unite hoogle 
" :Unite hoogle:exact
NeoBundleLazy 'eagletmt/unite-haddock', {'autoload' : { 'filetypes' : ['haskell'] }}
" importを便利に
" 'Shougo/unite.vim'に依存
" :Unite haskellimport
NeoBundleLazy 'ujihisa/unite-haskellimport', {'autoload' : { 'filetypes' : ['haskell'] }}
"
filetype plugin indent on     " required!
filetype indent on
syntax on

NeoBundleCheck

colorscheme default

let g:flake8_builtins="_,apply"

autocmd FileType python setlocal omnifunc=jedi#completions

let g:jedi#auto_vim_configuration = 0

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
let g:syntastic_python_checkers = ['pyflakes']

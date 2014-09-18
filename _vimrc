set backspace=indent,eol,start

set tabstop=4
set autoindent
set expandtab
set shiftwidth=4

nnoremap <PageDown> <C-F>
nnoremap <PageUp> <C-B>

set nocompatible               " be iMproved
" README.md以外のmdファイルもmarkdownに関連づける
au BufNewFile,BufRead *.md :set filetype=markdown

filetype off
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif
" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
 \ 'build' : {
 \  'windows' : 'make -f make_mingw32.mak',
 \  'cygwin' : 'make -f make_cygwin.mak',
 \  'mac' : 'make -f make_mac.mak',
 \  'unix' : 'make -f make_unix.mak',
 \ }}
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'jpalardy/vim-slime'
NeoBundleLazy 'scrooloose/syntastic' , {
 \ 'autoload' : {
 \   'filetypes': ['python', 'python3', 'djangohtml']
 \ }}
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'git://github.com/kevinw/pyflakes-vim.git'
NeoBundle 'git://github.com/nathanaelkane/vim-indent-guides.git'
NeoBundle 'sudo.vim'
NeoBundle 'yonchu/accelerated-smooth-scroll'

" markdown
NeoBundleLazy 'Markdown', {
 \ 'autoload' : {
 \   'filetypes': ['markdown']
 \ }}
NeoBundleLazy 'rcmdnk/vim-markdown', {
 \ 'autoload' : {
 \   'filetypes': ['markdown']
 \ }}

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
" Quickrun 横分割時は下へ､ 縦分割時は右へ新しいウィンドウが開くようにする
set splitbelow
set splitright

" シンタックスチェック
" 'thinca/vim-quickruni' 'Shougo/vimproc'に依存
" :WatchdogsRun
NeoBundle 'osyo-manga/shabadou.vim'
NeoBundle 'osyo-manga/vim-watchdogs'
" ghc-mod を使用した Haskell のシンタックスチェックを追加する
" cのも追加
let g:quickrun_config = {
 \
 \   'watchdogs_checker/ghc-mod' : {
 \       'command' : 'ghc-mod',
 \       'exec'    : '%c %o --hlintOpt="--language=XmlSyntax" check -g -Wall -g -fno-warn-type-defaults %s:p ',
 \   },
 \
 \   'haskell/watchdogs_checker' : {
 \       'type' : 'watchdogs_checker/ghc-mod'
 \   },
 \  'c' :{
 \     'type' : 'my_c'
 \   },
 \   'my_c' : {
 \     'command': 'clang',
 \     'cmdopt' : '-lm',
 \     'exec': ['%c %o %s -o %s:p:r', '%s:p:r %a'],
 \     'tempfile': '%{tempname()}.c',
 \     'hook/sweep/files': '%S:p:r',
 \   },
 \}
" quickfixを自動で閉じる
" \   'watchdogs_checker/_' : {
" \       'hook/close_quickfix/enable_exit' : 1,
" \   },
" watchdogs.vim の呼び出し
"call watchdogs#setup(g:quickrun_config)
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
" hoogle dataも必要(wgetコマンドが必要)
" 調べたいキーワードにカーソルを合わせて sift k で hoogle の結果が表示
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
" iで挿入モードになるのでそれから、モジュール名を入力すると補完されるので、決まったらenter
NeoBundleLazy 'ujihisa/unite-haskellimport', {'autoload' : { 'filetypes' : ['haskell'] }}

" c c++用 
NeoBundleLazy 'osyo-manga/vim-marching', {'autoload' : { 'filetypes' : ['c', 'cpp'] }}
NeoBundleLazy 'vim-scripts/c.vim', {'autoload' : { 'filetypes' : ['c'] }}
NeoBundleLazy 'vim-jp/cpp-vim', {'autoload' : { 'filetypes' : ['cpp'] }}
NeoBundleLazy '5t111111/alt-gtags.vim', {'autoload' : { 'filetypes' : ['c', 'cpp'] }}
NeoBundleLazy 'rhysd/vim-clang-format', {'autoload' : {'filetypes' : ['c', 'cpp', 'objc']}}
"clang コマンドの設定
let g:marching_clang_command = '/usr/bin/clang'

" オプションを追加する
" filetype=cpp に対して設定する場合
let g:marching#clang_command#options = {
\   'cpp' : '-std=gnu++1y'
\}

" インクルードディレクトリのパスを設定
" let g:marching_include_paths = [
" \]

" neocomplete.vim と併用して使用する場合
let g:marching_enable_neocomplete = 1

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.cpp =
    \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

" 処理のタイミングを制御する
" 短いほうがより早く補完ウィンドウが表示される
" ただし、marching.vim 以外の処理にも影響するので注意する
set updatetime=200

" オムニ補完時に補完ワードを挿入したくない場合
imap <buffer> <C-x><C-o> <Plug>(marching_start_omni_complete)

" キャッシュを削除してからオムに補完を行う
imap <buffer> <C-x><C-x><C-o> <Plug>(marching_force_start_omni_complete)

" コメントアウト
NeoBundle "tyru/caw.vim.git"
" <Plug>(caw:i:toggle)というがcawに設定されている
" それを<Leader>cにここで割り当てている
nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)

let g:clang_format#command = 'clang-format-3.5'
" ========== vim-clang-format の設定 ============
" アクセス指定子は1インデント分下げる
" 短い if 文は1行にまとめる
" テンプレートの宣言(template<class ...>)後は必ず改行する
" C++11 の機能を使う
" {} の改行は Stroustrup スタイル（関数宣言時の { のみ括弧前で改行を入れる）

let g:clang_format#style_options = {
 \ 'AccessModifierOffset' : -4,
 \ 'AllowShortIfStatementsOnASingleLine' : 'true',
 \ 'AlwaysBreakTemplateDeclarations' : 'true',
 \ 'Standard' : 'C++11',
 \ 'BreakBeforeBraces' : 'Stroustrup',
 \}


nnoremap <Space>o :only<CR>
nnoremap <Space>w :WatchdogsRun<CR>
" QuickFix
autocmd FileType c,cpp,objc map <C-n> :cn<CR>
autocmd FileType c,cpp,objc map <C-p> :cp<CR>
" alt-gtags.vim
autocmd FileType c,cpp,objc nnoremap <Space>a :AltGtags<CR>
autocmd FileType c,cpp,objc nnoremap <Space>f :AltGtags -f<CR>
autocmd FileType c,cpp,objc nnoremap <Space>r :AltGtags -r<CR>
autocmd FileType c,cpp,objc nnoremap <Space>s :AltGtags -s<CR>
autocmd FileType c,cpp,objc nnoremap <Space>m :ClangFormat<CR>

autocmd FileType haskell nnoremap <Space>g :GhcModType<CR>
autocmd FileType haskell nnoremap <Space>c :GhcModTypeClear<CR>
autocmd FileType haskell nnoremap <Space>i :Unite haskellimport<CR>

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

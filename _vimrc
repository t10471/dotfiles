" vim: set fdm=marker :

" set {{{
scriptencoding utf-8
set encoding=utf-8
set t_Co=256
set backspace=indent,eol,start
set foldmethod=syntax
set tabstop=2
set modeline
set helplang=ja
" set updatetime=4000
set autoindent
set expandtab
set shiftwidth=2
" Quickrun 横分割時は下へ､ 縦分割時は右へ新しいウィンドウが開くようにする
set splitbelow
set splitright
" grep検索を設定する
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -In
set laststatus=2
set showtabline=2 " 常にタブラインを表示
set fdm=marker
set wildmenu
set wildmode=longest:full,full
set ambiwidth=double
set directory=~/.vim/tmp
set viminfo='50,\"1000,<50,s10,h,n~/.viminfo
set spelllang=en,cjk
" 検索結果がハイライトされる
set hlsearch
"タブ、空白、改行の可視化
set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%
augroup MyAugroup
  autocmd!
augroup END

filetype off

if &compatible
  set nocompatible
endif

" }}}

if has('vim_starting')
  set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
  set runtimepath+=~/dotfiles/vim/
  " runtime! runtime/*.vim
  call setup#dein#init()
  call setup#keymapping#init()
  call setup#highlight#init()
  call setup#lightline#init()
endif

" after {{{
filetype plugin indent on     " required!
syntax on
augroup MyAugroup
  autocmd!
  " vimでファイルをひらいたとき最後にカーソルがあった場所に移動する
  autocmd BufRead * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
  autocmd BufNewFile,BufRead *.yml.tmpl set filetype=yaml
  autocmd BufNewFile,BufRead *.yaml.tmpl set filetype=yaml
  autocmd BufNewFile,BufRead *.md :set filetype=markdown
  autocmd BufNewFile,BufRead nginx.conf :set filetype=nginx
  autocmd BufNewFile,BufRead nginx.conf.tmpl :set filetype=nginx
  autocmd BufNewFile,BufRead *.nginx.conf :set filetype=nginx
  autocmd BufNewFile,BufRead *.nginx.conf.tmpl :set filetype=nginx
  autocmd BufWritePost *.py call Flake8()
  autocmd BufNewFile,BufRead *.pxd,*.pxi,*.pyx set filetype=cython
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=92
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=140
  autocmd FileType go :highlight goErr cterm=bold ctermfg=214
  autocmd FileType go :match goErr /\<err\>/
augroup END

let g:indent_guides_auto_colors=0
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1

let g:hybrid_custom_term_colors = 1
set background=dark
colorscheme hybrid
" }}}

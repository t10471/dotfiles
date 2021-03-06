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
set laststatus=2 " エディタウィンドウの末尾から2行目にステータスラインを常時表示させるための指定
set showtabline=2 " 常にタブラインを表示
set shiftround          " '<'や'>'でインデントする際に'shiftwidth'の倍数に丸める
set infercase           " 補完時に大文字小文字を区別しない
set hidden              " バッファを閉じる代わりに隠す（Undo履歴を残すため）
set switchbuf=useopen   " 新しく開く代わりにすでに開いてあるバッファを開く
set showmatch           " 対応する括弧などをハイライト表示する
set matchtime=5         " 対応括弧のハイライト表示を3秒にする
set fdm=marker
set wildmenu
set wildmode=longest:full,full
set directory=~/.vim/tmp
set noshowmode
let mapleader = ","
set clipboard=unnamed
set incsearch

if has('nvim')
  set completeopt+=noinsert
  set completeopt+=noselect
  tnoremap <silent> <ESC> <C-\><C-n>
endif


if !has('nvim')
  set viminfo='50,\"1000,<50,s10,h,n~/.viminfo
endif

set spelllang=en,cjk
" 検索結果がハイライトされる
set hlsearch
"タブ、空白、改行の可視化
set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%
augroup MyAugroup
  autocmd!
augroup END

if has('nvim')
  let g:python3_host_prog = $PYENV_ROOT . '/versions/3.8.5/bin/python'
  let g:python_host_prog  = $PYENV_ROOT . '/versions/2.7.18/bin/python'
  let g:python3_host_skip_check = 1
endif

filetype off

if &compatible
  set nocompatible
endif

augroup vimrc
  autocmd!
augroup END


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
  autocmd BufNewFile,BufRead *tsx set filetype=typescript
  autocmd BufNewFile,BufRead *.yaml.tmpl set filetype=yaml
  autocmd BufNewFile,BufRead *.md :set filetype=markdown
  autocmd BufNewFile,BufRead nginx.conf :set filetype=nginx
  autocmd BufNewFile,BufRead nginx.conf.tmpl :set filetype=nginx
  autocmd BufNewFile,BufRead *.nginx.conf :set filetype=nginx
  autocmd BufNewFile,BufRead *.nginx.conf.tmpl :set filetype=nginx
  autocmd BufNewFile,BufRead *.pxd,*.pxi,*.pyx set filetype=cython
  autocmd BufNewFile,BufRead api.md set filetype=apib
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=155
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=231
  autocmd VimEnter,Colorscheme * :hi NonText ctermfg=228
  autocmd VimEnter,Colorscheme * :hi SpecialKey ctermfg=224
  autocmd VimEnter,Colorscheme * :hi MatchParen ctermfg=LightGreen ctermbg=blue
  " カーソル位置ハイライトのon off
  autocmd InsertEnter * :PreciousSwitch
  autocmd InsertLeave * :PreciousReset
augroup END

  " augroup Commands
  "   autocmd!
  "   autocmd FileType python,go,rust,typescript nnoremap <C-]> :<C-u>LspDefinition<CR>
  "   autocmd FileType python,go,rust,typescript nnoremap <C-i> :<C-u>LspImplementation<CR>
  "   autocmd FileType python,go,rust,typescript nnoremap <C-i> :<C-u>LspTypeDefinition<CR>
  "   autocmd FileType python,go,rust,typescript nnoremap K :<C-u>LspHover<CR>
  "   autocmd FileType python,go,rust,typescript nnoremap <LocalLeader>R :<C-u>LspRename<CR>
  "   autocmd FileType python,go,rust,typescript nnoremap <LocalLeader>n :<C-u>LspReferences<CR>
  " augroup END
  augroup Gogroup 
    autocmd!
    autocmd FileType go nmap <Space>go <Plug>(go-info)
    autocmd FileType go nmap <Space>gr <Plug>(go-run)
    autocmd FileType go nmap <Space>gb <Plug>(go-build)
    autocmd FileType go nmap <Space>gt <Plug>(go-test)
    autocmd FileType go nmap <Space>gc <Plug>(go-coverage)
    autocmd FileType go nmap <Space>gd <Plug>(go-doc)
    autocmd FileType go nmap <Space>gv <Plug>(go-doc-vertical)
    autocmd FileType go nmap <Space>gi <Plug>(go-import)
    autocmd FileType go nmap <Space>gm <Plug>(go-implements)
    autocmd FileType go nmap <Space>df <Plug>(go-def)
    autocmd FileType go nmap <Space>ds <Plug>(go-def-split)
    autocmd FileType go nmap <Space>dv <Plug>(go-def-vertical)
    autocmd FileType go nmap <Space>dt <Plug>(go-def-tab)
    autocmd FileType go :highlight goErr cterm=bold ctermfg=211
    autocmd FileType go :match goErr /\<err\>/
  augroup END

let g:indent_guides_auto_colors=0
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=1
let g:indent_guides_guide_size=1
let g:indent_guides_tab_guides = 0

let g:hybrid_custom_term_colors=1
set background=dark
colorscheme hybrid

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1

let g:ale_sign_column_always = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

let g:ale_linters = {'python': ['flake8'], 'go': ['gometalinter'], 'solidity': ['solium'], 'html': ['alex'], 'rust': ['rls']}
let g:ale_go_gometalinter_options = '--vendored-linters --disable-all --enable=gotype --enable=vet --enable=golint -t'
let g:ale_open_list = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:dein#auto_recache = 1
" let g:ale_python_flake8_args = '--max-line-length=100'
" }}}

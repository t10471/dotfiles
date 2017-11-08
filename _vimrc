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
set viminfo='50,\"1000,:0,n~/.vim/viminfo
set spelllang=en,cjk
augroup vimrcEx " vimでファイルをひらいたとき最後にカーソルがあった場所に移動する
    autocmd!
    au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
                \ exe "normal g`\"" | endif
augroup END

filetype off
" }}}

" NeoBundle  {{{
if has('vim_starting')
    set nocompatible               " be iMproved
    set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle      'Shougo/vimproc'                 , {'build'  : {
            \  'windows'                        : 'make -f make_mingw32.mak',
            \  'cygwin'                         : 'make -f make_cygwin.mak',
            \  'mac'                            : 'make -f make_mac.mak',
            \  'unix'                           : 'make -f make_unix.mak',
            \  }}
NeoBundle      'Shougo/unite.vim'
NeoBundle      'Shougo/neocomplete.vim'
NeoBundle      'Shougo/neosnippet'
NeoBundle      'Shougo/neosnippet-snippets'
NeoBundleLazy  'Shougo/vimshell'
NeoBundle      'vim-jp/vimdoc-ja'
NeoBundle      'w0ng/vim-hybrid' " color theme
NeoBundle      'fuenor/qfixgrep'
NeoBundle      'nathanaelkane/vim-indent-guides'
NeoBundle      'sudo.vim'
NeoBundle      'yonchu/accelerated-smooth-scroll'
NeoBundle      'kana/vim-submode'
NeoBundleLazy  'tyru/caw.vim' " コメントアウト
NeoBundle      'thinca/vim-prettyprint'
NeoBundle      'surround.vim'
NeoBundle      'thinca/vim-editvar' " vim変数の書き換え
NeoBundleLazy  'scrooloose/nerdtree'
NeoBundleLazy  'vim-scripts/ViewOutput'
NeoBundle      'itchyny/lightline.vim'
NeoBundle      'tpope/vim-fugitive'
NeoBundleLazy  'airblade/vim-gitgutter'
NeoBundleLazy  'osyo-manga/vim-anzu'
NeoBundleLazy  'LeafCage/yankround.vim'
NeoBundleLazy  'kana/vim-operator-user'
NeoBundleLazy  'kana/vim-operator-replace',     { 'depends' : 'kana/vim-operator-user'}
NeoBundle      'tpope/vim-abolish' " キャメルケース変換、賢い検索・置換
NeoBundleLazy  'junegunn/vim-easy-align' " 整列
NeoBundle      'Lokaltog/vim-easymotion' " 移動
NeoBundle      'haya14busa/incsearch.vim' " 検索
NeoBundle      'haya14busa/incsearch-easymotion.vim'
NeoBundleLazy  'thinca/vim-qfreplace'
NeoBundle      'tpope/vim-repeat'
NeoBundle      'kana/vim-textobj-user'
NeoBundle      'kana/vim-textobj-syntax'        "ay, iy
NeoBundle      'kana/vim-textobj-indent'        "al, il
NeoBundle      'kana/vim-textobj-fold'          "az, iz
NeoBundleLazy  'kana/vim-smartinput'
NeoBundleLazy  'cohama/vim-smartinput-endwise', { 'depends' : 'kana/vim-smartinput'}
NeoBundleLazy  'bkad/CamelCaseMotion'
NeoBundle      'Konfekt/FastFold'
NeoBundle      'KazuakiM/vim-sqlfix'
NeoBundleLazy  'elzr/vim-json'
NeoBundleLazy  'Glench/Vim-Jinja2-Syntax'

"ctags
NeoBundle      'majutsushi/tagbar'
NeoBundle      't10471/vim-tags'
NeoBundle      'thinca/vim-ref'
NeoBundleLazy  'ynkdir/vim-vimlparser'
NeoBundle      'syngan/vim-vimlint',            { 'depends' : 'ynkdir/vim-vimlparser'}
NeoBundleLazy  'osyo-manga/shabadou.vim'
NeoBundle      'thinca/vim-quickrun',           { 'depends' : 'osyo-manga/shabadou.vim'}
NeoBundle      'osyo-manga/unite-quickfix'
NeoBundle      'osyo-manga/vim-watchdogs'
NeoBundleLazy  'jceb/vim-hier'
NeoBundleLazy  'scrooloose/syntastic'
" python
NeoBundleLazy  'davidhalter/jedi-vim'
NeoBundleLazy  'hynek/vim-python-pep8-indent'
NeoBundleLazy  'python_fold'
NeoBundleLazy  'tshirtman/vim-cython'
NeoBundleLazy  'nvie/vim-flake8'
" markdown
NeoBundleLazy  'Markdown'
NeoBundleLazy  'rcmdnk/vim-markdown'
" haskell
NeoBundleLazy  'kana/vim-filetype-haskell'
NeoBundleLazy  'eagletmt/ghcmod-vim'
NeoBundleLazy  'ujihisa/neco-ghc'
NeoBundleLazy  'dag/vim2hs'
NeoBundleLazy  'pbrisbin/vim-syntax-shakespeare'
NeoBundleLazy  'ujihisa/ref-hoogle'
NeoBundleLazy  'eagletmt/unite-haddock'

NeoBundleLazy  'ujihisa/unite-haskellimport'
NeoBundleLazy  'wting/lhaskell.vim'
" c c++用
NeoBundleLazy  'osyo-manga/vim-marching'
NeoBundleLazy  'vim-scripts/c.vim'
NeoBundleLazy  'vim-jp/cpp-vim'
NeoBundleLazy  'vim-scripts/gtags.vim'
NeoBundleLazy  '5t111111/alt-gtags.vim'
NeoBundleLazy  'rhysd/vim-clang-format'
"ruby
NeoBundleLazy  'alpaca-tc/alpaca_tags'
NeoBundleLazy  'AndrewRadev/switch.vim'
NeoBundleLazy  'yuku-t/vim-ref-ri'
NeoBundleLazy  'tpope/vim-rails'
NeoBundleLazy  'basyura/unite-rails'
NeoBundleLazy  'vim-scripts/ruby-matchit'
" javascript jsx
NeoBundleLazy 'pangloss/vim-javascript'
NeoBundleLazy 'mxw/vim-jsx'
" yaml
NeoBundleLazy 'chase/vim-ansible-yaml'
NeoBundleLazy 'stephpy/vim-yaml'
" typescript
NeoBundleLazy 'Quramy/tsuquyomi'
NeoBundleLazy 'leafgarland/typescript-vim'
NeoBundleLazy 'Quramy/vim-js-pretty-template'
NeoBundleLazy 'jason0x43/vim-js-indent'
NeoBundleLazy 'Quramy/vim-dtsm'
NeoBundleLazy 'mhartington/vim-typings'
" docker
NeoBundleLazy 'ekalinin/Dockerfile.vim'
" fish
NeoBundleLazy 'dag/vim-fish'
" elm
NeoBundleLazy 'elmcast/elm-vim'
NeoBundleLazy 'w0rp/ale'
" go
NeoBundleLazy 'fatih/vim-go'

" nginx
NeoBundleLazy 'chr4/nginx.vim'

call neobundle#end()
" }}}

" plugin setting {{{

" xterm {{{
" " let &t_SI .= '\e[3 q'
" " let &t_EI .= '\e[1 q'
" let &t_SI .= '\eP\e[3 q\e\\'
" let &t_EI .= '\eP\e[1 q\e\\'
" if &term =~ 'xterm'
"     " let &t_ti .= '\e[?2004h'
"     " let &t_te .= '\e[?2004l'
"     let &t_ti .=  '\eP\e[?2004h\e\\'
"     let &t_te .=  '\eP\e[?2004l\e\\'
"     let &pastetoggle = '\e[201~'
"
"     function! XTermPasteBegin(ret)
"         set paste
"         return a:ret
"     endfunction
"
"     noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
"     inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
"     cnoremap <special> <Esc>[200~ <nop>
"     cnoremap <special> <Esc>[201~ <nop>
" endif
" }}}

if neobundle#tap('vimshell') " {{{
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({
                \ 'augroup': 'setupAlias',
                \ 'autoload': {
                \    'unite_sources': ['vimshell_external_history', 'vimshell_history', 'vimshell_zsh_complete'],
                \    'mappings': [['n', '<Plug>(vimshell_']],
                \    'commands': [
                \       'VimShellSendString',
                \       {'complete': 'customlist,vimshell#complete', 'name': 'VimShell'},
                \       {'complete': 'customlist,vimshell#complete', 'name': 'VimShellPop'},
                \       {'complete': 'customlist,vimshell#complete', 'name': 'VimShellCreate'},
                \       {'complete': 'customlist,vimshell#complete', 'name': 'VimShellCurrentDir'},
                \       {'complete': 'customlist,vimshell#helpers#vimshell_execute_complete', 'name': 'VimShellExecute'},
                \       {'complete': 'customlist,vimshell#complete', 'name': 'VimShellBufferDir'},
                \       {'complete': 'customlist,vimshell#complete', 'name': 'VimShellTab'},
                \       {'complete': 'customlist,vimshell#helpers#vimshell_execute_complete', 'name': 'VimShellTerminal'},
                \       {'complete': 'customlist,vimshell#helpers#vimshell_execute_complete', 'name': 'VimShellInteractive'},
                \       {'complete': 'buffer', 'name': 'VimShellSendBuffer'}]}
                \ })
    call neobundle#end()
    function! neobundle#hooks.on_source(bundle)
    endfunction
    let g:vimshell_split_command = 'split'
    " シェルを起動
    nnoremap <silent> ,vs :VimShell<CR>
    nnoremap <silent> ,vp :VimShellInteractive python<CR>
    nnoremap <silent> ,vr :VimShellInteractive irb<CR>
    nnoremap <silent> ,vg :VimShellInteractive ghci<CR>
    nnoremap <silent> ,vsg :VimShellInteractive stack ghci<CR>
    " 非同期で開いたインタプリタに現在の行を評価させる
    vmap <silent> ,ve :VimShellSendString<CR>
    " 選択範囲を非同期で開いたインタプリタに選択行を評価させる
    nnoremap <silent> ,ve <S-v>:VimShellSendString<CR>
    inoremap <C-v> <C-r>"

    call neobundle#untap()
endif
" }}}

if neobundle#tap('nerdtree') "{{{
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({
                \ 'augroup': 'NERDTreeHijackNetrw',
                \ 'autoload': {'commands': [
                \    'NERDTreeMirror', 'NERDTreeClose', 'NERDTreeFocus', 'NERDTreeCWD', 'NERDTreeFind',
                \    {'complete': 'dir', 'name': 'NERDTree'},
                \    {'complete': 'customlist,nerdtree#completeBookmarks', 'name': 'NERDTreeFromBookmark'},
                \    {'complete': 'dir', 'name': 'NERDTreeToggle'},
                \ ]}
                \ })
    call neobundle#end()
    function! neobundle#hooks.on_source(bundle)
        autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
        let g:NERDTreeShowHidden=1
    endfunction
    nmap <silent> <C-e> :NERDTreeToggle<CR>
    vmap <silent> <C-e> <Esc> :NERDTreeToggle<CR>
    omap <silent> <C-e> :NERDTreeToggle<CR>
    call neobundle#untap()
endif
" }}}

if neobundle#tap('caw.vim') "{{{
    " コメントアウト \c
    " <Plug>(caw:i:toggle)というがcawに設定されている それを<Leader>cにここで割り当てている
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({
                \   'autoload' : {
                \    'mappings': [['vn', '<Plug>(caw']],
                \   }
                \ })
    call neobundle#end()
    function! neobundle#hooks.on_source(bundle)
    endfunction
    nmap <Leader>c <Plug>(caw:hatpos:toggle)
    vmap <Leader>c <Plug>(caw:hatpos:toggle)
    call neobundle#untap()
endif
"}}}

if neobundle#tap('sudo.vim') "{{{
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#end()
    "右のようにつかう :w sudo:%
    " root権限で今開いているファイルを開き直す
    command! ES :e sudo:%<CR><C-^>:bd!
    " root権限で保存
    command! WS :w sudo:%
    call neobundle#untap()
endif
"}}}

if neobundle#tap('surround.vim') "{{{
    "プラグイン内部でコマンドを定義している場合はLazyできない
    " call neobundle#beginexpand('~/.vim/bundle/'))
    " call neobundle#config({
    "             \ 'autoload': {
    "             \     'mappings': ['<Plug>Ysurround', '<Plug>YSsurround', '<Plug>YSurround', '<Plug>Dsurround',
    "             \         ['i', '<Plug>ISurround'], ['sx', '<Plug>VgSurround'],
    "             \         '<Plug>Yssurround', '<Plug>SurroundRepeat', '<Plug>Csurround',
    "             \         ['i', '<Plug>Isurround'], ['sx', '<Plug>VSurround']]}
    "             \ })
    " call neobundle#end()
    " {motion}はwなど
    " ys{motion}) {motion} で指定される範囲を () で囲む
    " yS{motion}) {motion} で指定される範囲を () で囲みインデント
    " yss)    行を () で囲む
    " ySS)    行を () で囲みインデント
    " (ヴィジュアルモード)s)  選択範囲を () で囲む
    " (ヴィジュアルモード)S)  選択範囲を () で囲みインデント
    " ds) () を削除
    " dst タグを除去(<b></b>など)
    " cs'"    ' を " に変える
    " cs'<b>  ' を <b>に変える
    " vi'で'で囲われた中身を選択
    " va'で'で囲われた全体を選択

endif
"}}}

if neobundle#tap('yankround.vim') "{{{
    " Vimのレジスタの履歴を取って再利用するプラグイン
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({
                \ 'autoload': {'unite_sources': ['yankround'], 'mappings': [['xn', '<Plug>(yankround-']]}})
    call neobundle#end()
    nmap p <Plug>(yankround-p)
    xmap p <Plug>(yankround-p)
    nmap P <Plug>(yankround-P)
    nmap gp <Plug>(yankround-gp)
    xmap gp <Plug>(yankround-gp)
    nmap gP <Plug>(yankround-gP)
    nmap <C-p> <Plug>(yankround-prev)
    nmap <C-n> <Plug>(yankround-next)
    nnoremap <leader>p :Unite yankround<CR>
endif
"}}}

if neobundle#tap('vim-operator-replace') "{{{
    " Rで置換 yiwで単語をヤンクして変換したい個所に行きRiwで置換
    " .を使うと同じ操作が他でもできる
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config('vim-operator-replace', {'autoload': {'mappings': [['nx', '<Plug>(operator-replace']]}})
    call neobundle#end()
    " map <Leader>l  <Plug>(operator-replace)
    vmap <C-v>  <Plug>(operator-replace)
endif
"}}}

if neobundle#tap('CamelCaseMotion') "{{{
    map <S-W> <Plug>CamelCaseMotion_w
    map <S-B> <Plug>CamelCaseMotion_b
    map <S-E> <Plug>CamelCaseMotion_e
endif
"}}}

if neobundle#tap('vim-qfreplace') "{{{
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload': {'commands': ['Qfreplace']}})
    call neobundle#end()
endif
"}}}

if neobundle#tap('vim-indent-guides') "{{{
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({
                \ 'augroup': 'indent_guides',
                \ 'autoload': {'mappings': [['n', '<Plug>IndentGuides']],
                \ 'commands': ['IndentGuidesEnable', 'IndentGuidesToggle', 'IndentGuidesDisable']}
                \ })
    call neobundle#end()
    function! neobundle#hooks.on_source(bundle)
    endfunction
    let g:indent_guides_auto_colors=0
    let g:indent_guides_enable_on_vim_startup=1
    let g:indent_guides_guide_size=1
    augroup vim-indent-guides
        autocmd!
        autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=92
        autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=140
    augroup END
endif

" }}}

if neobundle#tap('vim-hier') "{{{
    " エラーのハイライトを行う 'osyo-manga/vim-watchdogs'で使用する
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({
                \ 'autoload': {'commands': ['HierStart', 'HierUpdate', 'HierClear', 'HierStop']}})
    call neobundle#end()
endif
"}}}

if neobundle#tap('vim-gitgutter') "{{{
    function! neobundle#hooks.on_source(bundle)
        let g:gitgutter_sign_added = '✚'
        let g:gitgutter_sign_modified = '➜'
        let g:gitgutter_sign_removed = '✘'
    endfunction
    augroup vim-gitgutter
        autocmd!
        autocmd BufNewFile,BufRead * NeoBundleSource vim-gitgutter
    augroup END
    call neobundle#untap()
endif
"}}}

if neobundle#tap('vim-anzu') "{{{
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({
                \ 'autoload':
                \     {'unite_sources': ['anzu'],
                \     'mappings': [['sxno', '<Plug>(anzu-']],
                \     'commands': [
                \             'AnzuUpdateSearchStatus', 'AnzuClearSearchCache',
                \             'AnzuUpdateSearchStatusOutput', 'AnzuClearSearchStatus',
                \             'AnzuSignMatchLine', 'AnzuClearSignMatchLine']}
                \ })
    call neobundle#end()
    function! neobundle#hooks.on_source(bundle)
    endfunction
    nmap n <Plug>(anzu-n)
    nmap N <Plug>(anzu-N)
    nmap * <Plug>(anzu-star)
    nmap # <Plug>(anzu-sharp)
    " 一定時間キー入力がないとき、ウインドウを移動したとき、タブを移動したときに
    " 検索ヒット数の表示を消去する
    augroup vim-anzu
        autocmd!
        autocmd CursorHold,CursorHoldI,WinLeave,TabLeave * call anzu#clear_search_status()
    augroup END
    call neobundle#untap()
endif
"}}}

if neobundle#tap('vim-abolish') "{{{
    " キャメルケース  crc
    " ミックストケース    crm
    " スネークケース  cr_
    " スネークケース  crs
    " スネークアッパーケース  cru
    " 単語連結法（ハイフン連結）* cr-
    " * この命名規則から他の命名規則には変換できない
endif
"}}}

if neobundle#tap('ViewOutput') "{{{
    " :で始まるやつ :mapとか)バッファする :VO map
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload': {'commands': ['VO']}})
    call neobundle#end()
endif
"}}}

if neobundle#tap('vim-easymotion') "{{{
    " :で始まるやつ :mapとか)バッファする :VO map
    let g:EasyMotion_do_mapping = 0 "Disable default mappings
    map <Leader> <Plug>(easymotion-prefix)
    " <Leader>f{char} to move to {char}
    map  <Leader>f <Plug>(easymotion-bd-f)
    nmap <Leader>f <Plug>(easymotion-overwin-f)
    " s{char}{char} to move to {char}{char}
    nmap s <Plug>(easymotion-overwin-f2)
    " Move to line
    map <Leader>L <Plug>(easymotion-bd-jk)
    nmap <Leader>L <Plug>(easymotion-overwin-line)
    " Move to word
    map  <Leader>w <Plug>(easymotion-bd-w)
    nmap <Leader>w <Plug>(easymotion-overwin-w)
endif
if neobundle#tap('incsearch.vim') "{{{
    set hlsearch
    let g:incsearch#auto_nohlsearch = 1
    map n  <Plug>(incsearch-nohl-n)
    map N  <Plug>(incsearch-nohl-N)
    map *  <Plug>(incsearch-nohl-*)
    map #  <Plug>(incsearch-nohl-#)
    map g* <Plug>(incsearch-nohl-g*)
    map g# <Plug>(incsearch-nohl-g#)
    map /  <Plug>(incsearch-forward)
    map ?  <Plug>(incsearch-backward)
    map g/ <Plug>(incsearch-stay)
    augroup incsearch-keymap
      autocmd!
      autocmd VimEnter * call s:incsearch_keymap()
    augroup END
    function! s:incsearch_keymap()
        IncSearchNoreMap <Right> <Over>(incsearch-next)
        IncSearchNoreMap <Left>  <Over>(incsearch-prev)
        IncSearchNoreMap <Down>  <Over>(incsearch-scroll-f)
        IncSearchNoreMap <Up>    <Over>(incsearch-scroll-b)
    endfunction
endif
if neobundle#tap('incsearch-easymotion.vim') "{{{
    map z/ <Plug>(incsearch-easymotion-/)
    map z? <Plug>(incsearch-easymotion-?)
    map zg/ <Plug>(incsearch-easymotion-stay)
    function! s:config_easyfuzzymotion(...) abort
      return extend(copy({
      \   'converters': [incsearch#config#fuzzy#converter()],
      \   'modules': [incsearch#config#easymotion#module()],
      \   'keymap': {"\<CR>": '<Over>(easymotion)'},
      \   'is_expr': 0,
      \   'is_stay': 1
      \ }), get(a:, 1, {}))
    endfunction
    noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())
endif
"}}}

"
if neobundle#tap('vim-easy-align') "{{{
    " 特定の区切り文字を整列する
    " :EasyAlignは  Left, Right, Center
    " :EasyAlign!は Right, Left, Center
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({
                \    'autoload': {
                \        'mappings': ['<Plug>(EasyAlignOperator)', ['sxn', '<Plug>(EasyAlign)'],
                \                    ['sxn', '<Plug>(LiveEasyAlign)'], ['sxn', '<Plug>(EasyAlignRepeat)']],
                \        'commands': ['EasyAlign', 'LiveEasyAlign']}})
    call neobundle#end()
    let g:easy_align_delimiters = {
                \ '>': { 'pattern': '>>\|=>\|>' },
                \ '/': {
                \     'pattern':         '//\+\|/\*\|\*/',
                \     'delimiter_align': 'l',
                \     'ignore_groups':   ['!Comment'] },
                \ ']': {
                \     'pattern':       '[[\]]',
                \     'left_margin':   0,
                \     'right_margin':  0,
                \     'stick_to_left': 0
                \   },
                \ ')': {
                \     'pattern':       '[()]',
                \     'left_margin':   0,
                \     'right_margin':  0,
                \     'stick_to_left': 0
                \   },
                \ 'd': {
                \     'pattern':      ' \(\S\+\s*[;=]\)\@=',
                \     'left_margin':  0,
                \     'right_margin': 0
                \   }
                \ }
    "start interactive EasyAlign in visual mode (e.g. vip<Enter>)
    vmap <Enter> <Plug>(EasyAlign)
    " Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
    nmap <Leader>a <Plug>(EasyAlign)
endif
"}}}

if neobundle#tap('vim-submode') "{{{
    function! neobundle#hooks.on_source(bundle)
    endfunction
    call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
    call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
    call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
    call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
    call submode#map('bufmove', 'n', '', '>', '<C-w>>')
    call submode#map('bufmove', 'n', '', '<', '<C-w><')
    call submode#map('bufmove', 'n', '', '+', '<C-w>+')
    call submode#map('bufmove', 'n', '', '-', '<C-w>-')
    call neobundle#untap()
endif
 " }}}

if neobundle#tap('neosnippet') "{{{
    function! neobundle#hooks.on_source(bundle)
    endfunction
    " Plugin key-mappings.
    imap <C-m>     <Plug>(neosnippet_expand_or_jump)
    " smap <C-m>     <Plug>(neosnippet_expand_or_jump)
    " xmap <C-m>     <Plug>(neosnippet_expand_target)
    "
    "" SuperTab like snippets behavior.
    " imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    "             \ '\<Plug>(neosnippet_expand_or_jump)'
    "             \: pumvisible() ? '\<C-n>' : '\<TAB>'
    " smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    "             \ '\<Plug>(neosnippet_expand_or_jump)'
    "             \: '\<TAB>'

    " For snippet_complete marker.
    if has('conceal')
      set conceallevel=2 concealcursor=i
    endif
    let s:my_snippet = '~/.vim/snippets'
    let g:neosnippet#snippets_directory = s:my_snippet
    call neobundle#untap()
endif
" }}}

if neobundle#tap('neocomplete.vim') "{{{
    function! neobundle#hooks.on_source(bundle)
    endfunction
    let g:neocomplete#sources#dictionary#dictionaries = {
                \ 'default':    '',
                \ }
    if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
    endif
    let g:neocomplete#force_omni_input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
    let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
    let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplete.
    let g:neocomplete#enable_at_startup = 1
    " Use smartcase.
    let g:neocomplete#enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplete#undo_completion()
    inoremap <expr><C-l>     neocomplete#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    " inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    " function! s:my_cr_function()
    "     " return neocomplete#close_popup() . "\<CR>"
    "     " For no inserting <CR> key.
    "     return pumvisible() ? neocomplete#close_popup() : "\<CR>"
    " endfunction
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplete#close_popup()
    inoremap <expr><C-e>  neocomplete#cancel_popup()
    " Close popup by <Space>.
    inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"
    call neobundle#untap()
endif
" }}}

if neobundle#tap('tagbar') "{{{
    nmap <F8> :TagbarToggle<CR>
endif
"}}}

if neobundle#tap('vim-vimlint') "{{{
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config('vim-vimlint', {
                \ 'autoload' : {
                \   'functions' : 'vimlint#vimlint'}
                \ })
    call neobundle#end()
    let g:vimlint#config = {
                \ 'EVL102': 1,
                \ 'EVL103': 1,
                \ 'EVL105': 1,
                \ 'EVL201': 1,
                \ 'EVL204': 1,
                \ 'EVL205': 1
                \ }
endif
"}}}

if neobundle#tap('vim-smartinput') "{{{
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({
                \   'autoload' : {
                \     'insert' : 1
                \   }
                \ })
    call neobundle#end()

    function! neobundle#tapped.hooks.on_post_source(bundle)
        call smartinput_endwise#define_default_rules()
        call s:setup_smartinput()
    endfunction

    call neobundle#untap()
endif
" }}}

if neobundle#tap('vim-smartinput-endwise') "{{{
    function! neobundle#tapped.hooks.on_post_source(bundle)
        " neosnippet and neocomplete compatible
        call smartinput#map_to_trigger('i', '<Plug>(vimrc_cr)', '<Enter>', '<Enter>')
        imap <expr><CR> !pumvisible() ? "\<Plug>(vimrc_cr)" :
                    \ neocomplete#close_popup()
        " imap <expr><CR> !pumvisible() ? "\<Plug>(vimrc_cr)" :
        "             \ neosnippet#expandable() ? "\<Plug>(neosnippet_expand)" :
        "             \ neocomplete#close_popup()
    endfunction
    call neobundle#untap()
endif
" }}}

"}}}

if neobundle#tap('vim-quickrun') "{{{
    " :QuickRun か \rで実行
    " call neobundle#begin()
    " call neobundle#config({
    "             \ 'autoload': {'mappings': [['sxn', '<Plug>(quickrun']],
    "             \     'commands': [{'complete': 'customlist,quickrun#complete', 'name': 'QuickRun'}]}
    "             \ })
    " call neobundle#end()
    function! neobundle#hooks.on_source(bundle)
    endfunction
                " \       'hook/vim_vimlint/enable' : 1,
                " \       'hook/vim_vimlint/vimlint_path' : $HOME . '/.vim/bundle/vim-vimlint/autoload/vimlint.vim',
                " \       'hook/vim_vimlint/vimlparser_path' : $HOME . '/.vim/bundle/vim-vimlparser/autoload/vimlparser.vim',
    let g:quickrun_config = {
                \   '_' : {
                \       'hook/close_unite_quickfix/enable_hook_loaded' : 1,
                \       'hook/unite_quickfix/enable_failure' : 1,
                \       'hook/close_quickfix/enable_exit' : 1,
                \       'hook/close_buffer/enable_failure' : 1,
                \       'hook/close_buffer/enable_empty_data' : 1,
                \       'outputter' : "multi:buffer:quickfix",
                \       'hook/shabadoubi_touch_henshin/enable' : 1,
                \       'hook/shabadoubi_touch_henshin/wait' : 20,
                \       'outputter/buffer/split' : ':botright 8sp',
                \       'runner' : "vimproc",
                \       'runner/vimproc/updatetime' : 40,
                \   },
                \   'vim/watchdogs_checker' : {
                \       'type' : 'watchdogs_checker/vimlint'
                \   },
                \   'watchdogs_checker/ghc-mod' : {
                \       'command' : 'ghc-mod',
                \       'exec'    : '%c %o check -g -Wall -g -fno-warn-type-defaults %s:p ',
                \   },
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
                \  'c/watchdogs_checker' :{
                \     'type' : 'watchdogs_checker/clang'
                \   },
                \   'scons' : {
                \       'command'   : 'scons',
                \       'exec' : '%c',
                \       'outputter' : 'error:buffer:quickfix',
                \       'runner' : 'vimproc',
                \   },
                \}
    " \     'tempfile': '%{tempname()}.c',
    " \     'hook/sweep/files': '%S:p:r',
    " quickfixを自動で閉じる
    " \   'watchdogs_checker/_' : {
    " \       'hook/close_quickfix/enable_exit' : 1,
    " \   }
    call neobundle#untap()
endif
" }}}

if neobundle#tap('vim-watchdogs') "{{{
    function! neobundle#hooks.on_source(bundle)
    endfunction
"    call watchdogs#setup(g:quickrun_config)
    nnoremap <Space>w :WatchdogsRun<CR>
    call neobundle#untap()
endif
" }}}

if neobundle#tap('vim-json') "{{{
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload' : { 'filetypes' : ['json'] }})
    call neobundle#end()
    function! neobundle#hooks.on_source(bundle)
        let g:vim_json_syntax_conceal = 0
    endfunction
    call neobundle#untap()
endif
" }}}

if neobundle#tap('Vim-Jinja2-Syntax') "{{{
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload' : { 'filetypes' : ['jinja'] }})
    call neobundle#end()
    call neobundle#untap()
endif
" }}}

" if neobundle#tap('vim-sqlfix') "{{{
"     call neobundle#begin(expand('~/.vim/bundle/'))
"     call neobundle#config({
"                 \    'autoload': {
"                 \        'mappings': ['<Plug>(sqlfix_', ['v', '<Plug>(sqlfix#Visual())'], ['n', '<Plug>(sqlfix#Normal())']],
"                 \        'commands': ['Sqlfix', 'SqlfixFile']}})
"     call neobundle#end()
"     vmap <Leader>sq <Plug>(sqlfix#Visual())
"     nmap <Leader>sq <Plug>(sqlfix#Normal())
" endif
" " }}}

if neobundle#tap('vim-tags') "{{{
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#end()
    function! neobundle#hooks.on_source(bundle)
        let g:vim_tags_ignore_files = []
    endfunction
    call neobundle#untap()
endif
" }}}

" }}}
"}}}

" language {{{

" markdown {{{
if neobundle#tap('Markdown')
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload' : {'filetypes': ['markdown']}})
    call neobundle#end()
endif
if neobundle#tap('vim-markdown')
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload' : {'filetypes': ['markdown']}})
    call neobundle#end()
endif
" README.md以外のmdファイルもmarkdownに関連づける
autocmd BufNewFile,BufRead *.md :set filetype=markdown
" }}}

" c {{{
if neobundle#tap('vim-marching')
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload' : { 'filetypes' : ['c', 'cpp'] }})
    call neobundle#end()
    function! neobundle#hooks.on_source(bundle)
        let g:marching_clang_command = '/usr/bin/clang'
        " オプションを追加する
        " filetype=cpp に対して設定する場合
        let g:marching#clang_command#options = {'cpp' : '-std=gnu++1y'}
        " インクルードディレクトリのパスを設定
        " let g:marching_include_paths = [
        " \]
        " neocomplete.vim と併用して使用する場合
        let g:marching_enable_neocomplete = 1
        " 処理のタイミングを制御する
        " 短いほうがより早く補完ウィンドウが表示される
        " ただし、marching.vim 以外の処理にも影響するので注意する
        " set updatetime=200
    endfunction
    " オムニ補完時に補完ワードを挿入したくない場合
    autocmd FileType c,cpp,objc imap <buffer> <C-x><C-o> <Plug>(marching_start_omni_complete)
    " キャッシュを削除してからオムに補完を行う
    autocmd FileType c,cpp,objc imap <buffer> <C-x><C-x><C-o> <Plug>(marching_force_start_omni_complete)
    call neobundle#untap()
endif
if neobundle#tap('c.vim')
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload' : { 'filetypes' : ['c'] }})
    call neobundle#end()
endif
if neobundle#tap('cpp-vim')
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload' : { 'filetypes' : ['cpp'] }})
    call neobundle#end()
endif
if neobundle#tap('gtags.vim')
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload' : { 'filetypes' : ['c', 'cpp'] }})
    call neobundle#end()
    function! neobundle#hooks.on_source(bundle)
    endfunction
    nnoremap wq <C-w><C-w><C-w>q
    nnoremap wg :Gtags -g
    nnoremap wl :Gtags -f %<CR>
    nnoremap wj :Gtags <C-r><C-w><CR>
    nnoremap wk :Gtags -r <C-r><C-w><CR>
    " ヘッダファイルをタブで開く
    nnoremap sgf <C-w>gf<CR>
    call neobundle#untap()
endif
if neobundle#tap('alt-gtags.vim')
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload' : { 'filetypes' : ['c', 'cpp'] }})
    call neobundle#end()
    function! neobundle#hooks.on_source(bundle)
    endfunction
    nnoremap <Space>a :AltGtags<CR>
    nnoremap <Space>f :AltGtags -f<CR>
    nnoremap <Space>r :AltGtags -r<CR>
    nnoremap <Space>s :AltGtags -s<CR>
    nnoremap <Space>m :ClangFormat<CR>
    call neobundle#untap()
endif
if neobundle#tap('vim-clang-format')
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload' : { 'filetypes' : ['c', 'cpp'] }})
    call neobundle#end()
    function! neobundle#hooks.on_source(bundle)
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
    endfunction
    call neobundle#untap()
endif
" }}}

" haskell {{{
if neobundle#tap('vim-filetype-haskell')
    " インデント
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload' : { 'filetypes' : ['haskell'] }})
    call neobundle#end()
endif
if neobundle#tap('ghcmod-vim')
    call neobundle#begin()
    call neobundle#config({'autoload' : { 'filetypes' : ['haskell'] }})
    call neobundle#end()
    function! neobundle#hooks.on_source(bundle)
        " 使うにはcabal install ghc-modが必要　
        " :GhcModTypeでカーソルがあるところの型が表示され
        " :GhcModTypeClearでハライトが消える
        nnoremap <Space>g :GhcModType<CR>
        nnoremap <Space>c :GhcModTypeClear<CR>
    endfunction
    call neobundle#untap()
endif
if neobundle#tap('neco-ghc')
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload' : { 'filetypes' : ['haskell'] }})
    call neobundle#end()
    function! neobundle#hooks.on_source(bundle)
        setlocal omnifunc=necoghc#omnifunc
    endfunction
    call neobundle#untap()
endif
if neobundle#tap('vim2hs')
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload' : { 'filetypes' : ['haskell'] }})
    call neobundle#end()
    function! neobundle#hooks.on_source(bundle)
        " \をラムダにするのをやめる
        let g:haskell_conceal = 0
    endfunction
    call neobundle#untap()
endif
if neobundle#tap('vim-syntax-shakespeare')
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload' : { 'filetypes' : ['haskell'] }})
    call neobundle#end()
endif
if neobundle#tap('lhaskell.vim')
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload' : { 'filetypes' : ['haskell'] }})
    call neobundle#end()
endif
if neobundle#tap('ref-hoogle')
    " cabal install hoogleが必要 hoogle dataも必要(wgetコマンドが必要)
    " 調べたいキーワードにカーソルを合わせて sift k で hoogle の結果が表示
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload' : { 'filetypes' : ['haskell'] }})
    call neobundle#end()
endif
if neobundle#tap('unite-haddock')
    " haddockを開く
    " cabal install haddock
    " :Unite haddock
    " :Unite hoogle
    " :Unite hoogle:exact
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload' : { 'filetypes' : ['haskell'] }})
    call neobundle#end()
endif
if neobundle#tap('unite-haskellimport')
    " importを便利に Shougo/unite.vimに依存
    " :Unite haskellimport
    " iで挿入モードになるのでそれから、モジュール名を入力すると補完されるので、決まったらenter
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload' : { 'filetypes' : ['haskell'] }})
    call neobundle#end()
    function! neobundle#hooks.on_source(bundle)
        nnoremap <Space>p :Unite haskellimport<CR>
    endfunction
    call neobundle#untap()
endif

" }}}


" php {{{
" autocmd BufNewFile,BufRead *.php compiler php
" autocmd BufWritePost *.php silent make %
" }}}

"python {{{
if neobundle#tap('syntastic')
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({
                \   'autoload' : {
                \     'filetypes': ['python', 'python3', 'djangohtml', 'php']
                \   }
                \ })
    call neobundle#end()
    function! neobundle#hooks.on_source(bundle)
      let g:syntastic_python_checkers = ['pyflakes']
    endfunction
    call neobundle#untap()
endif
if neobundle#tap('jedi-vim')
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({
                \   'autoload' : {
                \     'filetypes': ['python', 'python3', 'djangohtml']
                \   }
                \ })
    call neobundle#end()
    function! neobundle#hooks.on_source(bundle)
        let g:jedi#auto_vim_configuration = 0
        let g:jedi#completions_enabled = 0
        let g:jedi#rename_command = '<Leader>R'
    endfunction
    call neobundle#untap()
endif
if neobundle#tap('vim-flake8')
    call neobundle#begin()
    call neobundle#config({
                \   'autoload' : {
                \     'filetypes': ['python', 'python3', 'djangohtml']
                \   }
                \ })
    call neobundle#end()
    function! neobundle#hooks.on_source(bundle)
        let g:no_flake8_maps = 1
        let g:flake8_show_in_gutter=1
    endfunction
    call neobundle#untap()
endif
if neobundle#tap('vim-python-pep8-indent')
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({
                \   'autoload' : {
                \     'insert': 1,
                \     'filetypes': ['python', 'python3', 'djangohtml']
                \   }
                \ })
    call neobundle#end()
    call neobundle#untap()
endif

if neobundle#tap('python_fold')
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({
                \   'autoload' : {
                \     'filetypes': ['python', 'python3', 'djangohtml']
                \   }
                \ })
    call neobundle#end()
endif

if neobundle#tap('vim-cython')
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({
                \   'autoload' : {
                \     'filetypes': ['cython']
                \   }
                \ })
    call neobundle#end()
endif
autocmd BufWritePost *.py call Flake8()
au BufRead,BufNewFile *.pxd,*.pxi,*.pyx set filetype=cython
" }}}

" ruby {{{
if neobundle#tap('alpaca_tags')
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload' : { 'filetypes' : ['ruby'] }})
    call neobundle#end()
endif
if neobundle#tap('switch.vim')
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload' : { 'filetypes' : ['ruby'] }})
    call neobundle#end()
endif
if neobundle#tap('vim-ref-ri')
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload' : { 'filetypes' : ['ruby'] }})
    call neobundle#end()
endif
if neobundle#tap('vim-rails')
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload' : { 'filetypes' : ['ruby'] }})
    call neobundle#end()
endif
if neobundle#tap('unite-rails')
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload' : { 'filetypes' : ['ruby'] }})
    call neobundle#end()
endif
if neobundle#tap('ruby-matchit')
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload' : { 'filetypes' : ['ruby'] }})
    call neobundle#end()
endif
" }}}

" javascript jsx {{{
if neobundle#tap('vim-javascript')
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload' : { 'filetypes' : ['javascript', 'jsx', 'javascript.jsx'] }})
    call neobundle#end()
endif
if neobundle#tap('vim-jsx')
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload' : { 'filetypes' : ['javascript', 'jsx', 'javascript.jsx'] }})
    function! neobundle#hooks.on_source(bundle)
        let g:jsx_ext_required = 0
    endfunction
    call neobundle#untap()
    call neobundle#end()
endif
" }}}

" yaml {{{
if neobundle#tap('vim-ansible-yaml')
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload' : { 'filetypes' : ['yaml'] }})
    function! neobundle#hooks.on_source(bundle)
        let g:ansible_options = {'ignore_blank_lines': 0}
    endfunction
    call neobundle#untap()
    call neobundle#end()
endif

if neobundle#tap('vim-yaml')
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload' : { 'filetypes' : ['yaml'] }})
    call neobundle#end()
endif
" }}}

" typescript {{{
if neobundle#tap('tsuquyomi')
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload' : { 'filetypes' : ['ts', 'typescript'] }})
    call neobundle#end()
endif

if neobundle#tap('typescript-vim')
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload' : { 'filetypes' : ['ts', 'typescript'] }})
    call neobundle#end()
endif

if neobundle#tap('vim-js-pretty-template')
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload' : { 'filetypes' : ['ts', 'typescript'] }})
    call neobundle#end()
endif

if neobundle#tap('vim-js-indent')
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload' : { 'filetypes' : ['ts', 'typescript'] }})
    call neobundle#end()
endif

if neobundle#tap('vim-dtsm')
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload' : { 'filetypes' : ['ts', 'typescript'] }})
    call neobundle#end()
endif

if neobundle#tap('vim-typings')
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload' : { 'filetypes' : ['ts', 'typescript'] }})
    call neobundle#end()
endif
"}}}

" fish {{{
if neobundle#tap('vim-fish')
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload' : { 'filetypes' : ['fish'] }})
    function! neobundle#hooks.on_source(bundle)
    endfunction
    call neobundle#untap()
    call neobundle#end()
endif
" }}}

" docker {{{
if neobundle#tap('Dockerfile')
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload' : { 'filetypes' : ['dockerfile'] }})
    function! neobundle#hooks.on_source(bundle)
    endfunction
    call neobundle#untap()
    call neobundle#end()
endif
"}}}

" elm {{{
if neobundle#tap('elm-vim')
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload' : { 'filetypes' : ['elm'] }})
    function! neobundle#hooks.on_source(bundle)
    endfunction
    call neobundle#untap()
    call neobundle#end()
endif

if neobundle#tap('ale')
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload' : { 'filetypes' : ['elm'] }})
    function! neobundle#hooks.on_source(bundle)
    endfunction
    call neobundle#untap()
    call neobundle#end()
endif
" }}}

" nginx {{{
if neobundle#tap('nginx.vim')
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload' : { 'filetypes' : ['nginx'] }})
    function! neobundle#hooks.on_source(bundle)
    endfunction
    call neobundle#untap()
    call neobundle#end()
endif
autocmd BufNewFile,BufRead .*nginx.conf :set filetype=nginx
autocmd BufNewFile,BufRead .*nginx.conf.tmpl :set filetype=nginx
" }}}

"go {{{
if neobundle#tap('vim-go')
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload' : { 'filetypes' : ['go'] }})
    function! neobundle#hooks.on_source(bundle)
    endfunction
    call neobundle#untap()
    call neobundle#end()
endif
" }}}

" }}}

" keymapping  {{{

" ウィンドウ {{{
nnoremap s <Nop>
" 下に移動
nnoremap sj <C-w>j
" 上に移動
nnoremap sk <C-w>k
" 右に移動
nnoremap sl <C-w>l
" 左に移動
nnoremap sh <C-w>h
" 下に移動
nnoremap sJ <C-w>J
" 上に移動
nnoremap sK <C-w>K
" 右に移動
nnoremap sL <C-w>L
" 左に移動
nnoremap sH <C-w>H
" 回転
nnoremap sr <C-w>r
" 大きさを揃える
nnoremap s= <C-w>=
" 次に移動
nnoremap sw <C-w>w
" 縦横最大化
nnoremap so <C-w>_<C-w>|
" 大きさを揃える
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
" 水平分割
nnoremap sd :<C-u>sp<CR>
" 垂直分割
nnoremap sv :<C-u>vs<CR>
" ウィンドウを閉じる
nnoremap sq :<C-u>q<CR>
" }}}

" バッファ {{{
" バッファを閉じる
nnoremap sQ :<C-u>bd<CR>
" 現在のタブで開いたバッファ一覧
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
" バッファ一覧
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>
" バッファリストの一つ前のバッファを開く
nnoremap <silent>sbp :bprevious<CR>
" バッファリストの次のバッファを開く
nnoremap <silent>sbn :bnext<CR>
" 直前のバッファを開く
nnoremap <silent>sbb :b#<CR>
" バッファリストの先頭を開く
nnoremap <silent>sbf :bf<CR>
" バッファリストの最後を開く
nnoremap <silent>sbl :bl<CR>
" 変更中の次のバッファへ移動
nnoremap <silent>sbm :bm<CR>
" カレントのバッファを閉じてバッファリストから削除
nnoremap <silent>sbd :bdelete<CR>
" }}}

" タブ {{{
" 新規タブをつぎに作る
nnoremap <F3> :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>
nnoremap st :<C-u>tabnew<CR>
" sc 新しいタブを一番右に作る
map <silent> sc :tablast <bar> tabnew<CR>
" sx タブを閉じる
map <silent> sx :tabclose<CR>
" 次のタブに切替
nnoremap sn gt
" 前のタブに切替
nnoremap sp gT
" タブ一覧
nnoremap sT :<C-u>Unite tab<CR>
" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'

" The prefix key.
" Tab jump
" s1 で1番左のタブ、s2 で1番左から2番目のタブにジャンプ
for n in range(1, 9)
  execute 'nnoremap <silent> s'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

" }}}

" コマンドライン {{{
cnoremap <C-A> <Home>
" 一文字戻る
cnoremap <C-B> <Left>
" カーソルの下の文字を削除
cnoremap <C-D> <Del>
" 行末へ移動
cnoremap <C-E> <End>
" 一文字進む
cnoremap <C-F> <Right>
" コマンドライン履歴を一つ進む
cnoremap <C-N> <Down>
" コマンドライン履歴を一つ戻る
cnoremap <C-P> <Up>
" 前の単語へ移動
cnoremap <C-K> <S-Left>
" 次の単語へ移動
cnoremap <C-L> <S-Right>
cnoremap <C-V> <C-R>"
" }}}

" etc {{{
nnoremap <F2> :w<CR>
inoremap <F2> <C-[>:w<CR>

" vimgrepの結果を検索 :vim main /home/clang/workspace/**.c
" 前へ
nnoremap [q :cprevious<CR>
" 次へ
nnoremap ]q :cnext<CR>
" 最初へ
nnoremap [Q :<C-u>cfirst<CR>
" 最後へ
nnoremap ]Q :<C-u>clast<CR>
" quickfix open
nnoremap ]c :<C-u>copen<CR>
" quickfix close
nnoremap [c :<C-u>cclose<CR>
" Quickfixウィンドウのオープン/クローズ
map ], <C-w>,
" Quickfixウィンドウへ移動
map ]. <C-w>.
" 末尾スペースを削除
nnoremap <Leader>s :%s/\s\+$//ge<CR>

" ペーストした後にビジュアルモードで選択する ちなみにgvで直前の選択範囲を再選択
nnoremap <expr> vp '`[' . strpart(getregtype(), 0, 1) . '`]'
nnoremap <Space>o :only<CR>
nnoremap <PageDown> <C-F>
nnoremap <PageUp> <C-B>
nnoremap qqq: <Esc>q:
nnoremap qqq/ <Esc>q/
nnoremap qqq? <Esc>q?
nnoremap q: <Nop>
nnoremap q/ <Nop>
nnoremap q? <Nop>
vnoremap < <gv
vnoremap > >gv
noremap <F1> <ESC>
" 空行挿入
function! s:cmd_cr_n(count)
    if !&modifiable
        noremap <CR> <CR>
        return ''
    endif
    for _ in range(a:count)
        call append('.', '')
    endfor
    execute 'normal!' a:count.'j'
endfunction
nnoremap <silent><CR> :<C-u>call <SID>cmd_cr_n(v:count1)<CR>
nnoremap <silent><C-C><C-D> :lcd %:h<CR>

:imap <F11> <nop>
:imap <F12> <C-O>:set paste<CR>
:set pastetoggle=<F11>
" insetモードから抜けるときにペーストモード解除
" autocmd InsertLeave * set nopaste

" 挿入モード時 Ctr + v でペースト
inoremap <C-v> <C-r>"
" Exモードに入らないようにする
nnoremap Q <nop>
" }}}

" 折りたたみ{{{
" よく使うコマンド
" zi  折り畳みの有効無効の切り替え
" zf  折り畳みを作成する
" za  折り畳みの開け閉め
" zd  折り畳みを削除する

" 時々使うコマンド
" zA  折り畳みの開け閉め（再帰）
" zD  折り畳みを削除する（再帰）
" zE  全ての折り畳みを削除
" zR  全ての折り畳みを開く
" zM  全ての折り畳みを閉じる
" }}}

" }}}

" lightline {{{

let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '➜'
let g:gitgutter_sign_removed = '✘'
let g:lightline = {
            \ 'colorscheme': 'landscape',
            \ 'mode_map': {'c': 'NORMAL'},
            \ 'active': {
            \   'left': [
            \     ['mode', 'paste'],
            \     ['fugitive', 'gitgutter', 'filename', 'anzu'],
            \   ],
            \   'right': [
            \     ['lineinfo', 'syntastic'],
            \     ['percent'],
            \     ['charcode', 'fileformat', 'fileencoding', 'filetype'],
            \   ]
            \ },
            \ 'component_expand': {
            \   'syntastic': 'SyntasticStatuslineFlag'
            \ },
            \ 'component_type': {
            \   'syntastic': 'error'
            \ },
            \ 'separator': {
            \   'left': "⮀",
            \   'right': "⮂"
            \ },
            \ 'subseparator': {
            \    'left': "⮁",
            \    'right': "⮃"
            \ },
            \ 'component_function': {
            \   'modified': 'MyModified',
            \   'readonly': 'MyReadonly',
            \   'fugitive': 'MyFugitive',
            \   'filename': 'MyFilename',
            \   'fileformat': 'MyFileformat',
            \   'filetype': 'MyFiletype',
            \   'fileencoding': 'MyFileencoding',
            \   'mode': 'MyMode',
            \   'charcode': 'MyCharCode',
            \   'gitgutter': 'MyGitGutter',
            \   'anzu': 'anzu#search_status',
            \ }}


function! MyModified()
    return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
    return &ft !~? 'help\|vimfiler\|gundo' && &ro ? '⭤' : ''
endfunction

function! MyFilename()
    return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
                \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
                \  &ft == 'unite' ? unite#get_status_string() :
                \  &ft == 'vimshell' ? substitute(b:vimshell.current_dir,expand('~'),'~','') :
                \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
                \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
    try
        if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
            let _ = fugitive#head()
            return strlen(_) ? '⭠ '._ : ''
        endif
    catch
    endtry
    return ''
endfunction

function! MyFileformat()
    return winwidth('.') > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
    return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
    return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
    return winwidth('.') > 60 ? lightline#mode() : ''
endfunction

function! MyGitGutter()
    if ! exists('*GitGutterGetHunkSummary')
                \ || ! get(g:, 'gitgutter_enabled', 0)
                \ || winwidth('.') <= 100
        return ''
    endif
    let symbols = [
                \ g:gitgutter_sign_added . ' ',
                \ g:gitgutter_sign_modified . ' ',
                \ g:gitgutter_sign_removed . ' '
                \ ]
    let hunks = GitGutterGetHunkSummary()
    let ret = []
    for i in [0, 1, 2]
        if hunks[i] > 0
            call add(ret, symbols[i] . hunks[i])
        endif
    endfor
    return join(ret, ' ')
endfunction

" https://github.com/Lokaltog/vim-powerline/blob/develop/autoload/Powerline/Functions.vim
function! MyCharCode()
    if winwidth('.') <= 70
        return ''
    endif

    " Get the output of :ascii
    redir => ascii
    silent! ascii
    redir END

    if match(ascii, 'NUL') != -1
        return 'NUL'
    endif

    " Zero pad hex values
    let nrformat = '0x%02x'

    let encoding = (&fenc == '' ? &enc : &fenc)

    if encoding == 'utf-8'
        " Zero pad with 4 zeroes in unicode files
        let nrformat = '0x%04x'
    endif

    " Get the character and the numeric value from the return value of :ascii
    " This matches the two first pieces of the return value, e.g.
    " "<F>  70" => char: 'F', nr: '70'
    let [str, char, nr; rest] = matchlist(ascii, '\v\<(.{-1,})\>\s*([0-9]+)')

    " Format the numeric value
    let nr = printf(nrformat, nr)

    return "'". char ."' ". nr
endfunction

let g:syntastic_mode_map = { 'mode': 'passive' }
augroup AutoSyntastic
    autocmd!
    autocmd BufWritePost *.php,*.py call s:syntastic()
augroup END
function! s:syntastic()
    SyntasticCheck
    call lightline#update()
endfunction
" }}}

" smartinput {{{
function! s:setup_smartinput()
    " 括弧内のスペース
    call smartinput#map_to_trigger('i', '<Space>', '<Space>', '<Space>')
    call smartinput#define_rule({
                \   'at'    : '(\%#)',
                \   'char'  : '<Space>',
                \   'input' : '<Space><Space><Left>',
                \   })

    call smartinput#map_to_trigger('i', '<BS>', '<BS>', '<BS>')
    call smartinput#define_rule({
                \   'at'    : '( \%# )',
                \   'char'  : '<BS>',
                \   'input' : '<Del><BS>',
                \   })

    call smartinput#define_rule({
                \   'at'    : '{\%#}',
                \   'char'  : '<Space>',
                \   'input' : '<Space><Space><Left>',
                \   })

    call smartinput#define_rule({
                \   'at'    : '{ \%# }',
                \   'char'  : '<BS>',
                \   'input' : '<Del><BS>',
                \   })

    call smartinput#define_rule({
                \   'at'    : '\[\%#\]',
                \   'char'  : '<Space>',
                \   'input' : '<Space><Space><Left>',
                \   })

    call smartinput#define_rule({
                \   'at'    : '\[ \%# \]',
                \   'char'  : '<BS>',
                \   'input' : '<Del><BS>',
                \   })

    call smartinput#map_to_trigger('i', '<Plug>(physical_key_return)', '<CR>', '<CR>')
    " 行末のスペースを削除する
    call smartinput#define_rule({
                \   'at'    : '\s\+\%#',
                \   'char'  : '<CR>',
                \   'input' : "<C-o>:call setline('.', substitute(getline('.'), '\\s\\+$', '', '')) <Bar> echo 'delete trailing spaces'<CR><CR>",
                \   })

    " Ruby 文字列内変数埋め込み
    call smartinput#map_to_trigger('i', '#', '#', '#')
    call smartinput#define_rule({
                \   'at'       : '\%#',
                \   'char'     : '#',
                \   'input'    : '#{}<Left>',
                \   'filetype' : ['ruby'],
                \   'syntax'   : ['Constant', 'Special'],
                \   })

    " Ruby ブロック引数 ||
    call smartinput#map_to_trigger('i', '<Bar>', '<Bar>', '<Bar>')
    call smartinput#define_rule({
                \   'at' : '\%({\|\<do\>\)\s*\%#',
                \   'char' : '|',
                \   'input' : '||<Left>',
                \   'filetype' : ['ruby', 'dachs'],
                \    })

    " テンプレート内のスペース
    call smartinput#define_rule({
                \   'at' :       '<\%#>',
                \   'char' :     '<Space>',
                \   'input' :    '<Space><Space><Left>',
                \   'filetype' : ['cpp'],
                \   })
    call smartinput#define_rule({
                \   'at' :       '< \%# >',
                \   'char' :     '<BS>',
                \   'input' :    '<Del><BS>',
                \   'filetype' : ['cpp'],
                \   })

    " ブロックコメント
    call smartinput#map_to_trigger('i', '*', '*', '*')
    call smartinput#define_rule({
                \   'at'       : '\/\%#',
                \   'char'     : '*',
                \   'input'    : '**/<Left><Left>',
                \   'filetype' : ['c', 'cpp'],
                \   })
    call smartinput#define_rule({
                \   'at'       : '/\*\%#\*/',
                \   'char'     : '<Space>',
                \   'input'    : '<Space><Space><Left>',
                \   'filetype' : ['c', 'cpp'],
                \   })
    call smartinput#define_rule({
                \   'at'       : '/* \%# */',
                \   'char'     : '<BS>',
                \   'input'    : '<Del><BS>',
                \   'filetype' : ['c', 'cpp'],
                \   })

    " セミコロンの挙動
    call smartinput#map_to_trigger('i', ';', ';', ';')
    " 2回押しで :: の代わり（待ち時間無し）
    call smartinput#define_rule({
                \   'at'       : ';\%#',
                \   'char'     : ';',
                \   'input'    : '<BS>::',
                \   'filetype' : ['cpp'],
                \   })
    " boost:: の補完
    call smartinput#define_rule({
                \   'at'       : '\<b;\%#',
                \   'char'     : ';',
                \   'input'    : '<BS>oost::',
                \   'filetype' : ['cpp'],
                \   })
    " std:: の補完
    call smartinput#define_rule({
                \   'at'       : '\<s;\%#',
                \   'char'     : ';',
                \   'input'    : '<BS>td::',
                \   'filetype' : ['cpp'],
                \   })
    " detail:: の補完
    call smartinput#define_rule({
                \   'at'       : '\%(\s\|::\)d;\%#',
                \   'char'     : ';',
                \   'input'    : '<BS>etail::',
                \   'filetype' : ['cpp'],
                \   })
    " クラス定義や enum 定義の場合は末尾に;を付け忘れないようにする
    call smartinput#define_rule({
                \   'at'       : '\%(\<struct\>\|\<class\>\|\<enum\>\)\s*\w\+.*\%#',
                \   'char'     : '{',
                \   'input'    : '{};<Left><Left>',
                \   'filetype' : ['cpp'],
                \   })
    " template に続く <> を補完
    call smartinput#define_rule({
                \   'at'       : '\<template\>\s*\%#',
                \   'char'     : '<',
                \   'input'    : '<><Left>',
                \   'filetype' : ['cpp'],
                \   })

    " Vim の正規表現内で \( が入力されたときの \) の補完
    call smartinput#define_rule({
                \   'at'       : '\\\%(\|%\|z\)\%#',
                \   'char'     : '(',
                \   'input'    : '(\)<Left><Left>',
                \   'filetype' : ['vim'],
                \   'syntax'   : ['String'],
                \   })
    call smartinput#define_rule({
                \   'at'       : '\\[%z](\%#\\)',
                \   'char'     : '<BS>',
                \   'input'    : '<Del><Del><BS><BS><BS>',
                \   'filetype' : ['vim'],
                \   'syntax'   : ['String'],
                \   })
    call smartinput#define_rule({
                \   'at'       : '\\(\%#\\)',
                \   'char'     : '<BS>',
                \   'input'    : '<Del><Del><BS><BS>',
                \   'filetype' : ['vim'],
                \   'syntax'   : ['String'],
                \   })

    " \s= を入力したときに空白を挟む
    call smartinput#map_to_trigger('i', '=', '=', '=')
    call smartinput#define_rule(
                \ { 'at'    : '\s\%#'
                \ , 'char'  : '='
                \ , 'input' : '= '
                \ , 'filetype' : ['c', 'cpp', 'vim', 'ruby']
                \ })

    " でも連続した == となる場合には空白は挟まない
    call smartinput#define_rule(
                \ { 'at'    : '=\s\%#'
                \ , 'char'  : '='
                \ , 'input' : '<BS>= '
                \ , 'filetype' : ['c', 'cpp', 'vim', 'ruby']
                \ })

    " でも連続した =~ となる場合には空白は挟まない
    call smartinput#map_to_trigger('i', '~', '~', '~')
    call smartinput#define_rule(
                \ { 'at'    : '=\s\%#'
                \ , 'char'  : '~'
                \ , 'input' : '<BS>~ '
                \ , 'filetype' : ['c', 'cpp', 'vim', 'ruby']
                \ })

    " Vim は ==# と =~# がある
    call smartinput#map_to_trigger('i', '#', '#', '#')
    call smartinput#define_rule(
                \ { 'at'    : '=[~=]\s\%#'
                \ , 'char'  : '#'
                \ , 'input' : '<BS># '
                \ , 'filetype' : ['vim']
                \ })
    " Vim help
    call smartinput#define_rule(
                \ { 'at'    : '\%#'
                \ , 'char'  : '|'
                \ , 'input' : '||<Left>'
                \ , 'filetype' : ['help']
                \ })
    call smartinput#define_rule(
                \ { 'at'    : '|\%#|'
                \ , 'char'  : '<BS>'
                \ , 'input' : '<Del><BS>'
                \ , 'filetype' : ['help']
                \ })
    call smartinput#map_to_trigger('i', '*', '*', '*')
    call smartinput#define_rule(
                \ { 'at'    : '\%#'
                \ , 'char'  : '*'
                \ , 'input' : '**<Left>'
                \ , 'filetype' : ['help']
                \ })
    call smartinput#define_rule(
                \ { 'at'    : '\*\%#\*'
                \ , 'char'  : '<BS>'
                \ , 'input' : '<Del><BS>'
                \ , 'filetype' : ['help']
                \ })
endfunction
" }}}

" HighlightInfo {{{
" カーソル下のhighlight情報を表示する
function! s:get_syn_id(transparent)
    let synid = synID(line('.'), col('.'), 1)
    return a:transparent ? synIDtrans(synid) : synid
endfunction
function! s:get_syn_name(synid)
    return synIDattr(a:synid, 'name')
endfunction
function! s:get_highlight_info()
    execute "highlight " . s:get_syn_name(s:get_syn_id(0))
    execute "highlight " . s:get_syn_name(s:get_syn_id(1))
endfunction
command! HighlightInfo call s:get_highlight_info()
" }}}

" set {{{
filetype plugin indent on     " required!
syntax on
NeoBundleCheck
" let g:hybrid_use_Xresources = 1
let g:hybrid_custom_term_colors = 1
" let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette."
set background=dark
colorscheme hybrid
autocmd BufRead,BufNewFile *.yml.tmpl set filetype=yaml 

"タブ、空白、改行の可視化
set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%

"全角スペースをハイライト表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction
   
if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif

" colorscheme default
" }}}

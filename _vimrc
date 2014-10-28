
" vim: set fdm=marker :

" set {{{
scriptencoding utf-8
set encoding=utf-8
set t_Co=256
set backspace=indent,eol,start
set foldmethod=syntax
set tabstop=4
set modeline
set helplang=ja
" set updatetime=4000
set autoindent
set expandtab
set shiftwidth=4
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
NeoBundle      'Shougo/vimproc' , {'build' : {
            \  'windows' : 'make -f make_mingw32.mak',
            \  'cygwin' : 'make -f make_cygwin.mak',
            \  'mac' : 'make -f make_mac.mak',
            \  'unix' : 'make -f make_unix.mak',
            \  }}
NeoBundle      'Shougo/unite.vim'
NeoBundle      'Shougo/neocomplete.vim'
NeoBundle      'Shougo/neosnippet'
NeoBundle      'Shougo/neosnippet-snippets'
NeoBundleLazy  'Shougo/vimshell'
NeoBundle      'vim-jp/vimdoc-ja'
NeoBundle      'w0ng/vim-hybrid'
NeoBundle      'fuenor/qfixgrep'
NeoBundleLazy  'LeafCage/nebula.vim'
NeoBundle      'nathanaelkane/vim-indent-guides'
NeoBundleLazy  'sudo.vim'
NeoBundle      'yonchu/accelerated-smooth-scroll'
NeoBundle      'kana/vim-submode'
NeoBundleLazy  'tyru/caw.vim'
NeoBundle      'thinca/vim-prettyprint'
NeoBundle      'surround.vim'
NeoBundle      'thinca/vim-editvar'
NeoBundleLazy  'scrooloose/nerdtree'
NeoBundleLazy  'vim-scripts/ViewOutput'
NeoBundle      'itchyny/lightline.vim'
NeoBundle      'tpope/vim-fugitive'
NeoBundleLazy  'airblade/vim-gitgutter'
NeoBundleLazy  'osyo-manga/vim-anzu'
NeoBundleLazy  'LeafCage/yankround.vim'
NeoBundleLazy  'kana/vim-operator-user'
NeoBundleLazy  'kana/vim-operator-replace', { 'depends' : 'kana/vim-operator-user'}
NeoBundle      'tpope/vim-abolish'
NeoBundleLazy  'junegunn/vim-easy-align'
NeoBundle      'Lokaltog/vim-easymotion'
NeoBundleLazy  'thinca/vim-qfreplace'
NeoBundle      'tpope/vim-repeat'
NeoBundle      'kana/vim-textobj-user'
NeoBundle      'kana/vim-textobj-syntax' "ay, iy
NeoBundle      'kana/vim-textobj-indent' "al, il
NeoBundle      'kana/vim-textobj-fold'   "az, iz
NeoBundleLazy  'kana/vim-smartinput'
NeoBundleLazy  'cohama/vim-smartinput-endwise', { 'depends' : 'kana/vim-smartinput'}
NeoBundleLazy  'glidenote/memolist.vim'

"ctags
NeoBundle      'majutsushi/tagbar'
NeoBundle      'szw/vim-tags'
NeoBundle      'thinca/vim-ref'
NeoBundleLazy  'ynkdir/vim-vimlparser'
NeoBundle      'syngan/vim-vimlint', { 'depends' : 'ynkdir/vim-vimlparser'}
NeoBundleLazy  'osyo-manga/shabadou.vim'
NeoBundle      'thinca/vim-quickrun', { 'depends' : 'osyo-manga/shabadou.vim'}
NeoBundle      'osyo-manga/unite-quickfix'
NeoBundle      'osyo-manga/vim-watchdogs'
NeoBundleLazy  'jceb/vim-hier'
NeoBundleLazy  'scrooloose/syntastic'
" python
NeoBundleLazy  'Flake8-vim'
NeoBundleLazy  'davidhalter/jedi-vim'
NeoBundleLazy  'hynek/vim-python-pep8-indent'
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
" c c++用
NeoBundleLazy  'osyo-manga/vim-marching'
NeoBundleLazy  'vim-scripts/c.vim'
NeoBundleLazy  'vim-jp/cpp-vim'
NeoBundleLazy  'vim-scripts/gtags.vim'
NeoBundleLazy  '5t111111/alt-gtags.vim'
NeoBundleLazy  'rhysd/vim-clang-format'
" scala
NeoBundleLazy  'derekwyatt/vim-scala'

call neobundle#end()
" }}}

" plugin seeting {{{
filetype plugin indent on     " required!
syntax on
NeoBundleCheck
let g:hybrid_use_Xresources = 1

colorscheme hybrid
" colorscheme default

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

    function! neobundle#hooks.on_source(bundle)
    endfunction
    " シェルを起動
    nnoremap <silent> ,vs :VimShell<CR>
    nnoremap <silent> ,vp :VimShellInteractive python<CR>
    nnoremap <silent> ,vr :VimShellInteractive irb<CR>
    nnoremap <silent> ,vl :VimShellInteractive scala<CR>
    nnoremap <silent> ,vg :VimShellInteractive ghci<CR>
    " 非同期で開いたインタプリタに現在の行を評価させる
    vmap <silent> ,ve :VimShellSendString<CR>
    " 選択範囲を非同期で開いたインタプリタに選択行を評価させる
    nnoremap <silent> ,ve <S-v>:VimShellSendString<CR>

    call neobundle#untap()
endif
" }}}

if neobundle#tap('nerdtree') "{{{
    call neobundle#config({
                \ 'augroup': 'NERDTreeHijackNetrw',
                \ 'autoload': {'commands': [
                \    'NERDTreeMirror', 'NERDTreeClose', 'NERDTreeFocus', 'NERDTreeCWD', 'NERDTreeFind',
                \    {'complete': 'dir', 'name': 'NERDTree'},
                \    {'complete': 'customlist,nerdtree#completeBookmarks', 'name': 'NERDTreeFromBookmark'},
                \    {'complete': 'dir', 'name': 'NERDTreeToggle'},
                \ ]}
                \ })
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
    call neobundle#config({
                \   'autoload' : {
                \    'mappings': [['vn', '<Plug>(caw']],
                \   }
                \ })
    function! neobundle#hooks.on_source(bundle)
    endfunction
    nmap <Leader>c <Plug>(caw:i:toggle)
    vmap <Leader>c <Plug>(caw:i:toggle)
    call neobundle#untap()
endif
"}}}

if neobundle#tap('sudo.vim') "{{{
    call neobundle#config({'autoload': {'commands': ['SudoRead', 'SudoWrite']}})
endif
"}}}

if neobundle#tap('surround.vim') "{{{
    "プラグイン内部でコマンドを定義している場合はLazyできない
    " call neobundle#config({
    "             \ 'autoload': {
    "             \     'mappings': ['<Plug>Ysurround', '<Plug>YSsurround', '<Plug>YSurround', '<Plug>Dsurround',
    "             \         ['i', '<Plug>ISurround'], ['sx', '<Plug>VgSurround'],
    "             \         '<Plug>Yssurround', '<Plug>SurroundRepeat', '<Plug>Csurround',
    "             \         ['i', '<Plug>Isurround'], ['sx', '<Plug>VSurround']]}
    "             \ })
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
    call neobundle#config({
                \ 'autoload': {'unite_sources': ['yankround'], 'mappings': [['xn', '<Plug>(yankround-']]}})
    nmap p <Plug>(yankround-p)
    nmap P <Plug>(yankround-P)
    nmap gp <Plug>(yankround-gp)
    nmap gP <Plug>(yankround-gP)
    nmap <C-p> <Plug>(yankround-prev)
    nmap <C-n> <Plug>(yankround-next)
endif
"}}}

if neobundle#tap('vim-operator-replace') "{{{
    " Rで置換 yiwで単語をヤンクして変換したい個所に行きRiwで置換
    " .を使うと同じ操作が他でもできる
    call neobundle#config('vim-operator-replace', {'autoload': {'mappings': [['nx', '<Plug>(operator-replace']]}})
    map R  <Plug>(operator-replace)
endif
"}}}

if neobundle#tap('vim-qfreplace') "{{{
    call neobundle#config({'autoload': {'commands': ['Qfreplace']}})
endif
"}}}

if neobundle#tap('vim-indent-guides') "{{{
    call neobundle#config({
                \ 'augroup': 'indent_guides',
                \ 'autoload': {'mappings': [['n', '<Plug>IndentGuides']],
                \ 'commands': ['IndentGuidesEnable', 'IndentGuidesToggle', 'IndentGuidesDisable']}
                \ })
    function! neobundle#hooks.on_source(bundle)
    endfunction
    let g:indent_guides_auto_colors=0
    let g:indent_guides_enable_on_vim_startup=1
    let g:indent_guides_guide_size=1
    " autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=92
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=92
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=140
endif
"}}}

if neobundle#tap('nebula.vim') " {{{
    call neobundle#config({
                \   'autoload' : {
                \     'commands': ['NebulaPutLazy', 'NebulaPutFromClipboard', 'NebulaYankOptions',
                \                  'NebulaYankConfig', 'NebulaPutConfig', 'NebulaYankTap']
                \   }
                \ })
    function! neobundle#hooks.on_source(bundle)
    endfunction
    nnoremap <silent>,bl    :<C-u>NebulaPutLazy<CR>
    nnoremap <silent>,bc    :<C-u>NebulaYankConfig<CR>
    nnoremap <silent>,bp    :<C-u>NebulaPutFromClipboard<CR>
    nnoremap <silent>,bt    :<C-u>NebulaYankTap!<CR>
    call neobundle#untap()
endif
" }}}

if neobundle#tap('vim-hier') "{{{
    " エラーのハイライトを行う 'osyo-manga/vim-watchdogs'で使用する
    call neobundle#config({
                \ 'autoload': {'commands': ['HierStart', 'HierUpdate', 'HierClear', 'HierStop']}})
endif
"}}}

if neobundle#tap('vim-gitgutter') "{{{
    function! neobundle#hooks.on_source(bundle)
        let g:gitgutter_sign_added = '✚'
        let g:gitgutter_sign_modified = '➜'
        let g:gitgutter_sign_removed = '✘'
    endfunction
    autocmd BufNewFile,BufRead * NeoBundleSource vim-gitgutter
    call neobundle#untap()
endif
"}}}

if neobundle#tap('vim-anzu') "{{{
    call neobundle#config({
                \ 'autoload':
                \     {'unite_sources': ['anzu'],
                \     'mappings': [['sxno', '<Plug>(anzu-']],
                \     'commands': [
                \             'AnzuUpdateSearchStatus', 'AnzuClearSearchCache',
                \             'AnzuUpdateSearchStatusOutput', 'AnzuClearSearchStatus',
                \             'AnzuSignMatchLine', 'AnzuClearSignMatchLine']}
                \ })
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

if neobundle#tap('sudo.vim') "{{{
    function! neobundle#hooks.on_source(bundle)
        "右のようにつかう :w sudo:%
        " root権限で今開いているファイルを開き直す
        command! ES :e sudo:%<CR><C-^>:bd!
        " root権限で保存
        command! WS :w sudo:%
    endfunction
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
    call neobundle#config({'autoload': {'commands': ['VO']}})
endif
"}}}

if neobundle#tap('vim-easy-align') "{{{
    " :EasyAlignは  Left, Right, Center
    " :EasyAlign!は Right, Left, Center
    call neobundle#config({
                \    'autoload': {
                \        'mappings': ['<Plug>(EasyAlignOperator)', ['sxn', '<Plug>(EasyAlign)'],
                \                    ['sxn', '<Plug>(LiveEasyAlign)'], ['sxn', '<Plug>(EasyAlignRepeat)']],
                \        'commands': ['EasyAlign', 'LiveEasyAlign']}})

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
    imap <C-k>     <Plug>(neosnippet_expand_or_jump)
    smap <C-k>     <Plug>(neosnippet_expand_or_jump)
    xmap <C-k>     <Plug>(neosnippet_expand_target)
    "
    "" SuperTab like snippets behavior.
    " imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    "             \ "\<Plug>(neosnippet_expand_or_jump)"
    "             \: pumvisible() ? "\<C-n>" : "\<TAB>"
    " smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    "             \ "\<Plug>(neosnippet_expand_or_jump)"
    "             \: "\<TAB>"
    
    " For snippet_complete marker.
    if has('conceal')
      set conceallevel=2 concealcursor=i
      endif"
    call neobundle#untap()
endif
" }}}

if neobundle#tap('neocomplete.vim') "{{{
    function! neobundle#hooks.on_source(bundle)
    endfunction
    let g:neocomplete#sources#dictionary#dictionaries = {
                \ 'default':    '',
                \ 'scala':      $HOME.'/.vim/dict/scala.dict',
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

if neobundle#tap('vim-vimlint') "{{{
    call neobundle#config('vim-vimlint', {
                \ 'autoload' : {
                \   'functions' : 'vimlint#vimlint'}
                \ })
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
    call neobundle#config({
                \   'autoload' : {
                \     'insert' : 1
                \   }
                \ })

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

if neobundle#tap('memolist.vim') "{{{
    call neobundle#config({'autoload': {'commands': ['MemoList', 'MemoGrep', 'MemoNew']}})
    function! neobundle#tapped.hooks.on_post_source(bundle)
        let g:memolist_path = '~/memolist'
        let g:memolist_prompt_tags = 1
        let g:memolist_prompt_categories = 1
        let g:memolist_unite = 1
        let g:memolist_ex_cmd = 'NERDTree'
    endfunction
    nnoremap <Leader>mn  :MemoNew<CR>
    nnoremap <Leader>ml  :MemoList<CR>
    nnoremap <Leader>mg  :MemoGrep<CR>
    call neobundle#untap()
endif
"}}}

if neobundle#tap('vim-quickrun') "{{{
    " :QuickRun か \rで実行
    " call neobundle#config({
    "             \ 'autoload': {'mappings': [['sxn', '<Plug>(quickrun']],
    "             \     'commands': [{'complete': 'customlist,quickrun#complete', 'name': 'QuickRun'}]}
    "             \ })
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
                \       'exec'    : '%c %o --hlintOpt="--language=XmlSyntax" check -g -Wall -g -fno-warn-type-defaults %s:p ',
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
                \   'sbt' : {
                \       'command'   : 'sbt',
                \       'exec' : ['%c compile', '%c run'],
                \       'outputter'                 : 'multi:buffer:quickfix',
                \       'runner' : 'vimproc',
                \   },
                \}
    let g:quickrun_config.scala = {'type': 'scala/process_manager'}
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

" }}}

" language {{{

" markdown {{{
if neobundle#tap('Markdown')
    call neobundle#config({'autoload' : {'filetypes': ['markdown']}})
endif
if neobundle#tap('vim-markdown')
    call neobundle#config({'autoload' : {'filetypes': ['markdown']}})
endif
" README.md以外のmdファイルもmarkdownに関連づける
au BufNewFile,BufRead *.md :set filetype=markdown
" }}}

" c {{{
if neobundle#tap('vim-marching')
    call neobundle#config({'autoload' : { 'filetypes' : ['c', 'cpp'] }})
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
    call neobundle#config({'autoload' : { 'filetypes' : ['c'] }})
endif
if neobundle#tap('cpp-vim')
    call neobundle#config({'autoload' : { 'filetypes' : ['cpp'] }})
endif
if neobundle#tap('gtags.vim')
    call neobundle#config({'autoload' : { 'filetypes' : ['c', 'cpp'] }})
    function! neobundle#hooks.on_source(bundle)
    endfunction
    nnoremap wq <C-w><C-w><C-w>q
    nnoremap wg :Gtags -g
    nnoremap wl :Gtags -f %<CR>
    nnoremap wj :Gtags <C-r><C-w><CR>
    nnoremap wk :Gtags -r <C-r><C-w><CR>
    nnoremap sgf <C-w>gf<CR> " ヘッダファイルをタブで開く
    call neobundle#untap()
endif
if neobundle#tap('alt-gtags.vim')
    call neobundle#config({'autoload' : { 'filetypes' : ['c', 'cpp'] }})
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
    call neobundle#config({'autoload' : { 'filetypes' : ['c', 'cpp'] }})
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
    call neobundle#config({'autoload' : { 'filetypes' : ['haskell'] }})
endif
if neobundle#tap('ghcmod-vim')
    call neobundle#config({'autoload' : { 'filetypes' : ['haskell'] }})
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
    call neobundle#config({'autoload' : { 'filetypes' : ['haskell'] }})
endif
if neobundle#tap('vim2hs')
    call neobundle#config({'autoload' : { 'filetypes' : ['haskell'] }})
    function! neobundle#hooks.on_source(bundle)
        " \をラムダにするのをやめる
        let g:haskell_conceal = 0
    endfunction
    call neobundle#untap()
endif
if neobundle#tap('vim-syntax-shakespeare')
    call neobundle#config({'autoload' : { 'filetypes' : ['haskell'] }})
endif
if neobundle#tap('ref-hoogle')
    " cabal install hoogleが必要 hoogle dataも必要(wgetコマンドが必要)
    " 調べたいキーワードにカーソルを合わせて sift k で hoogle の結果が表示
    call neobundle#config({'autoload' : { 'filetypes' : ['haskell'] }})
endif
if neobundle#tap('unite-haddock')
    " haddockを開く
    " cabal install haddock
    " :Unite haddock
    " :Unite hoogle
    " :Unite hoogle:exact
    call neobundle#config({'autoload' : { 'filetypes' : ['haskell'] }})
endif
if neobundle#tap('unite-haskellimport')
    " importを便利に Shougo/unite.vimに依存
    " :Unite haskellimport
    " iで挿入モードになるのでそれから、モジュール名を入力すると補完されるので、決まったらenter
    call neobundle#config({'autoload' : { 'filetypes' : ['haskell'] }})
    function! neobundle#hooks.on_source(bundle)
        nnoremap <Space>i :Unite haskellimport<CR>
    endfunction
    call neobundle#untap()
endif
" }}}

" scala {{{
if neobundle#tap('vim-scala')
    call neobundle#config({'autoload' : {'filetypes': ['scala']}})
endif
function! s:vimrc_scala()
    nnoremap <buffer> <Space>s :<C-u>write<Cr>:call <SID>sbt_run()<Cr>
endfunction

augroup vimrc_scala
    autocmd!
    autocmd FileType scala call s:vimrc_scala()
augroup END

augroup vimrc-scala-switch
    autocmd!
    autocmd FileType scala let b:switch_custom_definitions =
                \ [{
                \   '\(log[ \.]\+\)info\>': '\1warn',
                \   '\(log[ \.]\+\)warn\>': '\1error',
                \   '\(log[ \.]\+\)error\>': '\1info'},
                \  {
                \   '\<extends\>': 'with',
                \   '\<with\>': 'extends'}]
augroup END

augroup vimrc-int-sbt
    autocmd!
    autocmd FileType int-sbt call <SID>vimrc_int_sbt()
augroup END
" tagbar
autocmd FileType scala nmap <F8> :TagbarToggle<CR>
" vim-tags
autocmd FileType scala nnoremap <C-]> g<C-]>
au BufNewFile,BufRead *.scala let g:vim_tags_project_tags_command =
            \ "ctags -R --languages=scala -f ~/workspace/.git/tags `pwd` 2>/dev/null"
autocmd FileType scala nnoremap  <Space>t :TagsGenerate<CR>
" }}}

" php {{{
" autocmd FileType php compiler php
" autocmd BufWritePost *.php silent make %
" }}}

"python {{{
if neobundle#tap('syntastic')
    call neobundle#config({
                \   'autoload' : {
                \     'filetypes': ['python', 'python3', 'djangohtml', 'php']
                \   }
                \ })
    function! neobundle#hooks.on_source(bundle)
        let g:syntastic_python_checkers = ['pyflakes', 'pep8']
    endfunction
    call neobundle#untap()
endif
if neobundle#tap('jedi-vim')
    call neobundle#config({
                \   'autoload' : {
                \     'filetypes': ['python']
                \   }
                \ })
    function! neobundle#hooks.on_source(bundle)
        let g:jedi#auto_vim_configuration = 0
        let g:jedi#completions_enabled = 0
    endfunction
    call neobundle#untap()
endif
if neobundle#tap('Flake8-vim')
    call neobundle#config({
                \   'autoload' : {
                \     'filetypes': ['python']
                \   }
                \ })
    function! neobundle#hooks.on_source(bundle)
        let g:PyFlakeOnWrite = 1
        let g:PyFlakeCheckers = 'pep8,mccabe,pyflakes'
        let g:PyFlakeDefaultComplexity=10
    endfunction
    call neobundle#untap()
endif
if neobundle#tap('vim-python-pep8-indent')
    call neobundle#config({
                \   'autoload' : {
                \     'insert': 1,
                \     'filetypes': ['python', 'python3', 'djangohtml']
                \   }
                \ })
    call neobundle#untap()
endif
autocmd FileType python setlocal omnifunc=jedi#completions

" }}}

" }}}

" keymapping  {{{

" buffer {{{
" バッファリストの一つ前のバッファを開く
nnoremap <silent>bp :bprevious<CR>
" バッファリストの次のバッファを開く
nnoremap <silent>bn :bnext<CR>
" 直前のバッファを開く
nnoremap <silent>bb :b#<CR>
" バッファリストの先頭を開く
nnoremap <silent>bf :bf<CR>
" バッファリストの最後を開く
nnoremap <silent>bl :bl<CR>
" 変更中の次のバッファへ移動
nnoremap <silent>bm :bm<CR>
" カレントのバッファを閉じてバッファリストから削除
nnoremap <silent>bd :bdelete<CR>
" }}}

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
nnoremap ss :<C-u>sp<CR>
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
" }}}

" タブ {{{
" 新規タブをつぎに作る
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
nnoremap ~ $
vnoremap ~ $
nnoremap <F2> :w<CR>
nnoremap <F4> :q<CR>
inoremap <F2> <C-[>:w<CR>
inoremap <F4> <C-[>:q<CR>

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
" }}}

" }}}

" lightline {{{
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
    return &ft !~? 'help\|vimfiler\|gundo' && &ro ? 'ro' : ''
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
            return strlen(_) ? 'b '._ : ''
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

" sbt {{{
function! s:start_sbt()
    if !has_key(t:, 'vsm_cmds')
        "let t:vsm_cmds = [input('t:vsm_cmds[0] = ')]
        let t:vsm_cmds = ['compile']
    endif
    execute 'normal' "\<Plug>(vimshell_split_switch)\<Plug>(vimshell_hide)"
    execute 'VimShellInteractive sbt'
    stopinsert
    let t:sbt_bufname = bufname('%')
    wincmd L
    wincmd p
endfunction

function! s:sbt_run()
    let sbt_bufname = get(t:, 'sbt_bufname', '*not-found*')
    if sbt_bufname == '*not-found*'
        call s:start_sbt()
    else
        if !has_key(t:, 'vsm_cmds')
            echoerr 'please give t:vsm_cmds a list'
            return
        endif

        " go to the window
        let wn = bufwinnr(sbt_bufname)
        if wn == -1
            echo "buffer exists but window doesn't exist. opening it."
            execute 'sbuffer' sbt_bufname
            wincmd L
        else
            execute wn . 'wincmd w'
        endif

        " make sure if it's vimshell
        if !has_key(b:, 'interactive')
            close
            unlet t:sbt_bufname
            call s:sbt_run()
            return
        endif

        normal! Gzt
        " go back to the previous window
        wincmd p

        call vimshell#interactive#set_send_buffer(sbt_bufname)
        call vimshell#interactive#clear()
        call vimshell#interactive#send(t:vsm_cmds)
        " explosion
        "call vimproc#system_bg('curl -s http://localhost:8080/requests/status.xml?command=pl_play')
    endif
endfunction

function! s:vimrc_int_sbt()
    nunmap  <buffer> j
    nunmap  <buffer> k

    syntax case ignore

    syntax match intsbtPrompt /^> .*/ contains=intsbtPromptBody,intsbtPromptHead
    syntax match intsbtPromptBody /.*/ contained
    syntax match intsbtPromptHead /^> / contained

    syntax match intsbtDebug /^\[debug\] .*/ contains=intsbtDebugHead,intsbtDebugBody
    syntax match intsbtDebugBody /.*/ contained
    syntax match intsbtDebugHead /\[debug\]/ contained

    syntax match intsbtInfo /^\[info\] .*/ contains=intsbtInfoHead,intsbtInfoBody
    syntax match intsbtInfoBody /.*/ contained
    syntax match intsbtInfoHead /\[info\]/ contained

    syntax match intsbtWarn /^\[warn\] .*/ contains=intsbtWarnHead,intsbtWarnBody
    syntax match intsbtWarnBody /.*/ contained
    syntax match intsbtWarnHead /\[warn\]/ contained

    syntax match intsbtError /^\[error\] .*/ contains=intsbtErrorHead,intsbtErrorBody
    syntax match intsbtErrorBody /.*/ contained
    syntax match intsbtErrorHead /\[error\]/ contained

    syntax match intsbtSuccess /^\[success\] .*/

    hi def link intsbtPromptBody Statement
    hi def link intsbtPromptHead Operator

    hi def link intsbtDebugBody Comment
    hi def link intsbtDebugHead LineNr

    hi def link intsbtInfoBody Comment
    hi def link intsbtInfoHead LineNr
    " intsbtWarnBody: something easy to read and doesn't look too strong
    hi def link intsbtWarnBody String
    hi def link intsbtWarnHead LineNr
    " intsbtErrorBody: something easy to read and does look strong
    hi def link intsbtErrorBody Normal
    hi def link intsbtErrorHead LineNr
    hi def link intsbtSuccess LineNr
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

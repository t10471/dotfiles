
set runtimepath+=~/.vim/bundle/neobundle.vim

" NeoBundle  {{{

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
NeoBundle      'vim-jp/vimdoc-ja'
NeoBundle      'w0ng/vim-hybrid' " color theme
NeoBundle      'fuenor/qfixgrep'
" quickfixウィンドウ内でrを押すと、各行のテキスト部分が別バッファに書き出される。
" http://thinca.hatenablog.com/entry/20081107/1225997310
NeoBundleLazy  'thinca/vim-qfreplace'
NeoBundle      'nathanaelkane/vim-indent-guides'
NeoBundle      'sudo.vim'
NeoBundle      'yonchu/accelerated-smooth-scroll'
" 独自のサブモードを作ることで入力が楽になる http://thinca.hatenablog.com/entry/20130131/1359567419
NeoBundle      'kana/vim-submode'
NeoBundleLazy  'scrooloose/nerdtree'
" :VO :set setの結果を確認するのに便利 http://nanasi.jp/articles/vim/viewoutput_vim.html
NeoBundleLazy  'vim-scripts/ViewOutput'
NeoBundle      'itchyny/lightline.vim' " バーのやつ
" 左にgitの差分(+とか) をだす http://wonderwall.hatenablog.com/entry/2016/03/26/211710
NeoBundleLazy  'airblade/vim-gitgutter'
" ヤンクのレジスタを取り出す https://github.com/LeafCage/yankround.vim
NeoBundle      'LeafCage/yankround.vim'
" http://secret-garden.hatenablog.com/entry/2015/04/16/000000
NeoBundle      'tpope/vim-abolish' " キャメルケース変換、賢い検索・置換
NeoBundleLazy  'junegunn/vim-easy-align' " 整列
NeoBundle      'easymotion/vim-easymotion' " 移動
NeoBundle      'haya14busa/incsearch.vim' " 検索
NeoBundle      'haya14busa/incsearch-easymotion.vim'
NeoBundle      'tpope/vim-repeat' " .をいい感じにしてくれる
NeoBundleLazy  'kana/vim-smartinput'
NeoBundleLazy  'cohama/vim-smartinput-endwise', { 'depends' : 'kana/vim-smartinput'}
NeoBundle      'Konfekt/FastFold' " foldingを早くしてくれる
NeoBundleLazy  'scrooloose/syntastic'

NeoBundleLazy  'tyru/caw.vim' " コメントアウト
NeoBundle      'surround.vim'
NeoBundleLazy  'kana/vim-operator-user'
NeoBundleLazy  'kana/vim-operator-replace',     { 'depends' : 'kana/vim-operator-user'}
NeoBundle      'kana/vim-textobj-user'
NeoBundle      'kana/vim-textobj-syntax'        "ay, iy
NeoBundle      'kana/vim-textobj-indent'        "al, il
NeoBundle      'kana/vim-textobj-fold'          "az, iz
NeoBundle      'Shougo/context_filetype.vim'
NeoBundle      'osyo-manga/vim-precious'

"ctags
NeoBundle      'majutsushi/tagbar'
NeoBundle      't10471/vim-tags'

" vim
NeoBundleLazy  'ynkdir/vim-vimlparser'
NeoBundleLazy  'syngan/vim-vimlint',            { 'depends' : 'ynkdir/vim-vimlparser'}
NeoBundleLazy  'thinca/vim-prettyprint' " http://thinca.hatenablog.com/entry/20090625/1245864363
NeoBundleLazy  'thinca/vim-editvar' " vim変数の書き換え
" python
NeoBundleLazy  'davidhalter/jedi-vim'
NeoBundleLazy  'hynek/vim-python-pep8-indent'
NeoBundleLazy  'python_fold'
NeoBundleLazy  'tshirtman/vim-cython'
NeoBundleLazy  'nvie/vim-flake8'
NeoBundleLazy  'Glench/Vim-Jinja2-Syntax'
" markdown
NeoBundleLazy  'Markdown'
NeoBundleLazy  'rcmdnk/vim-markdown'
" haskell
NeoBundleLazy  'kana/vim-filetype-haskell'
NeoBundleLazy  'eagletmt/ghcmod-vim'
NeoBundleLazy  'ujihisa/neco-ghc'
NeoBundleLazy  'dag/vim2hs'
NeoBundleLazy  'pbrisbin/vim-syntax-shakespeare'
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
" json
NeoBundleLazy  'elzr/vim-json'
" toml
NeoBundleLazy 'cespare/vim-toml'

call neobundle#end()
" }}}

" base  {{{
if neobundle#tap('nerdtree') "{{{
  call neobundle#begin(expand('~/.vim/bundle/'))
  call neobundle#config({
              \ 'augroup': 'NERDTreeHijackNetrw',
              \ 'autoload': {'commands': [
              \    'NERDTreeMirror', 'NERDTreeClose', 'NERDTreeFocus', 'NERDTreeCWD', 'NERDTreeFind',
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

if neobundle#tap('ViewOutput') "{{{
    " :で始まるやつ :mapとか)バッファする :VO map
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload': {'commands': ['VO']}})
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
        call setup#smartinput#init()
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
    endfunction
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

if neobundle#tap('vim-qfreplace') "{{{
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload': {'commands': ['Qfreplace']}})
    call neobundle#end()
endif
"}}}

if neobundle#tap('vim-indent-guides') "{{{
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({
                \ 'augroup': 'vim-indent-guides',
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

if neobundle#tap('vim-easymotion') "{{{
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
" }}}

if neobundle#tap('incsearch.vim') "{{{
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
"}}}

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

" language {{{

" vim {{{
if neobundle#tap('vim-vimlint')
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload' : {'filetypes': ['vim']}})
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

if neobundle#tap('vim-vimlparser')
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload' : {'filetypes': ['vim']}})
    call neobundle#end()
endif

if neobundle#tap('vim-prettyprint')
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload' : {'filetypes': ['vim']}})
    call neobundle#end()
endif

if neobundle#tap('thinca/vim-editvar')
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload' : {'filetypes': ['vim']}})
    call neobundle#end()
endif
"}}}

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
" }}}

"jinja {{{
if neobundle#tap('Vim-Jinja2-Syntax')
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload' : { 'filetypes' : ['jinja'] }})
    call neobundle#end()
    call neobundle#untap()
endif
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

" json {{{
if neobundle#tap('vim-json')
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload' : { 'filetypes' : ['json'] }})
    call neobundle#end()
    function! neobundle#hooks.on_source(bundle)
        let g:vim_json_syntax_conceal = 0
    endfunction
    call neobundle#untap()
endif
" }}}

" toml {{{
if neobundle#tap('vim-toml')
    call neobundle#begin(expand('~/.vim/bundle/'))
    call neobundle#config({'autoload' : { 'filetypes' : ['toml'] }})
    call neobundle#end()
    function! neobundle#hooks.on_source(bundle)
    endfunction
    call neobundle#untap()
endif
" }}}
" }}}

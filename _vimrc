
" vim: set fdm=marker:

" initialize {{{
set backspace=indent,eol,start
set foldmethod=syntax
set tabstop=4
set modeline
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

augroup vimrcEx " vimでファイルをひらいたとき最後にカーソルがあった場所に移動する
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
NeoBundle 'Shougo/vimproc', {
 \ 'build' : {
 \  'windows' : 'make -f make_mingw32.mak',
 \  'cygwin' : 'make -f make_cygwin.mak',
 \  'mac' : 'make -f make_mac.mak',
 \  'unix' : 'make -f make_unix.mak',
 \ }}

NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'fuenor/qfixgrep'
NeoBundle 'LeafCage/nebula.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'sudo.vim' 
NeoBundle 'yonchu/accelerated-smooth-scroll'
NeoBundle 'kana/vim-submode'
NeoBundle 'tyru/caw.vim' 
NeoBundle 'thinca/vim-prettyprint'
NeoBundle 'surround.vim'
NeoBundle 'thinca/vim-editvar'
NeoBundle 'scrooloose/nerdtree'
NeoBundleLazy 'vim-scripts/ViewOutput'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'osyo-manga/vim-anzu'
" ctags
NeoBundle 'majutsushi/tagbar'
NeoBundle 'szw/vim-tags'
NeoBundle 'thinca/vim-ref'
NeoBundle 'thinca/vim-quickrun' " :QuickRun か \r
NeoBundle 'osyo-manga/shabadou.vim'
NeoBundle 'osyo-manga/vim-watchdogs', { 'depends' : [ 'osyo-manga/shabadou.vim', 'thinca/vim-quickrun', 'Shougo/vimproc' ] }
" シンタックスチェック :WatchdogsRun
NeoBundleLazy 'jceb/vim-hier'
NeoBundleLazy 'scrooloose/syntastic' 
" python
NeoBundleLazy 'Flake8-vim'
NeoBundleLazy 'davidhalter/jedi-vim'
NeoBundleLazy 'hynek/vim-python-pep8-indent'
" markdown
NeoBundleLazy 'Markdown'
NeoBundleLazy 'rcmdnk/vim-markdown'
" haskell
NeoBundleLazy 'kana/vim-filetype-haskell' 
NeoBundleLazy 'eagletmt/ghcmod-vim' 
NeoBundleLazy 'ujihisa/neco-ghc'
NeoBundleLazy 'dag/vim2hs'
NeoBundleLazy 'pbrisbin/vim-syntax-shakespeare'
NeoBundleLazy 'ujihisa/ref-hoogle', { 'depends' : [ 'thinca/vim-ref' ] }
NeoBundleLazy 'eagletmt/unite-haddock'
NeoBundleLazy 'ujihisa/unite-haskellimport'
" c c++用 
NeoBundleLazy 'osyo-manga/vim-marching'
NeoBundleLazy 'vim-scripts/c.vim'
NeoBundleLazy 'vim-jp/cpp-vim'
NeoBundleLazy 'vim-scripts/gtags.vim'
NeoBundleLazy '5t111111/alt-gtags.vim'
NeoBundleLazy 'rhysd/vim-clang-format'
" scala
NeoBundleLazy 'derekwyatt/vim-scala'

call neobundle#end()
" }}}

" plugin seeting start {{{
filetype plugin indent on     " required!
syntax on
NeoBundleCheck
let g:hybrid_use_Xresources = 1
colorscheme hybrid
" }}}

if neobundle#tap('vimshell') " {{{
  function! neobundle#hooks.on_source(bundle)
      " シェルを起動
      nnoremap <silent> ,vs :VimShell<CR>
      " pythonを非同期で起動
      autocmd FileType python  nnoremap <silent> ,vi :VimShellInteractive python<CR>
      " irbを非同期で起動
      autocmd FileType ruby nnoremap <silent> ,vi :VimShellInteractive irb<CR>
      " scalaを非同期で起動
      autocmd FileType scala nnoremap <silent> ,vi :VimShellInteractive scala<CR>
      " 非同期で開いたインタプリタに現在の行を評価させる
      vmap <silent> ,ve :VimShellSendString<CR>
      " 選択範囲を非同期で開いたインタプリタに選択行を評価させる
      nnoremap <silent> ,ve <S-v>:VimShellSendString<CR>
  endfunction
  call neobundle#untap()
endif
" }}}

if neobundle#tap('nerdtree') "{{{
  function! neobundle#hooks.on_source(bundle)
      nmap <silent> <C-e> :NERDTreeToggle<CR>
      vmap <silent> <C-e> <Esc> :NERDTreeToggle<CR>
      omap <silent> <C-e> :NERDTreeToggle<CR>
      autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
      let g:NERDTreeShowHidden=1
  endfunction
  call neobundle#untap()
endif
" }}}

if neobundle#tap('caw.vim') "{{{
" コメントアウト \c
" <Plug>(caw:i:toggle)というがcawに設定されている それを<Leader>cにここで割り当てている
  function! neobundle#hooks.on_source(bundle)
      nmap <Leader>c <Plug>(caw:i:toggle)
      vmap <Leader>c <Plug>(caw:i:toggle)
  endfunction
  call neobundle#untap()
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
      nnoremap <silent>,bl    :<C-u>NebulaPutLazy<CR>
      nnoremap <silent>,bc    :<C-u>NebulaYankConfig<CR>
      nnoremap <silent>,bp    :<C-u>NebulaPutFromClipboard<CR>
      nnoremap <silent>,bt    :<C-u>NebulaYankTap!<CR>
  endfunction
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
  call neobundle#untap()
endif
"}}}

if neobundle#tap('vim-anzu') "{{{
  function! neobundle#hooks.on_source(bundle)
      nmap n <Plug>(anzu-n)
      nmap N <Plug>(anzu-N)
      nmap * <Plug>(anzu-star)
      nmap # <Plug>(anzu-sharp)
      augroup vim-anzu
          " 一定時間キー入力がないとき、ウインドウを移動したとき、タブを移動したときに
          " 検索ヒット数の表示を消去する
          autocmd!
          autocmd CursorHold,CursorHoldI,WinLeave,TabLeave * call anzu#clear_search_status()
      augroup END
  endfunction
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

if neobundle#tap('ViewOutput') "{{{
    " :で始まるやつ :mapとか)バッファする :VO map
    call neobundle#config('ViewOutput', {'autoload': {'commands': ['VO']}})
endif
"}}}

if neobundle#tap('neosnippet') "{{{
  function! neobundle#hooks.on_source(bundle)
      "   Plugin key-mappings.
      imap <C-k> <Plug>(neosnippet_expand_or_jump)
      smap <C-k> <Plug>(neosnippet_expand_or_jump)
      "   SuperTab like snippets behavior.
      imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
      smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
      "   For snippet_complete marker.
      if has('conceal')
          set conceallevel=2 concealcursor=i
      endif
      let g:neosnippet#snippets_directory='~/.vim/snippets'
  endfunction
  call neobundle#untap()
endif
" }}}

if neobundle#tap('vim-submode') "{{{
  function! neobundle#hooks.on_source(bundle)
      call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
      call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
      call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
      call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
      call submode#map('bufmove', 'n', '', '>', '<C-w>>')
      call submode#map('bufmove', 'n', '', '<', '<C-w><')
      call submode#map('bufmove', 'n', '', '+', '<C-w>+')
      call submode#map('bufmove', 'n', '', '-', '<C-w>-')
  endfunction
  call neobundle#untap()
endif
" }}}

if neobundle#tap('neocomplete.vim') "{{{
  function! neobundle#hooks.on_source(bundle)
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
      inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
      function! s:my_cr_function()
          " return neocomplete#close_popup() . "\<CR>"
          " For no inserting <CR> key.
          return pumvisible() ? neocomplete#close_popup() : "\<CR>"
      endfunction
      " <TAB>: completion.
      inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
      " <C-h>, <BS>: close popup and delete backword char.
      inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
      inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
      inoremap <expr><C-y>  neocomplete#close_popup()
      inoremap <expr><C-e>  neocomplete#cancel_popup()
      " Close popup by <Space>.
      inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"
  endfunction
  call neobundle#untap()
endif
" }}}

if neobundle#tap('vim-quickrun') "{{{
    function! neobundle#hooks.on_source(bundle)
        let g:quickrun_config = {
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
        " \   },
    endfunction
    call neobundle#untap()
endif
" }}}

if neobundle#tap('vim-watchdogs') "{{{
    function! neobundle#hooks.on_source(bundle)
        call watchdogs#setup(g:quickrun_config)
        nnoremap <Space>w :WatchdogsRun<CR>
    endfunction
    call neobundle#untap()
endif
" }}}

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
        " オムニ補完時に補完ワードを挿入したくない場合
        autocmd FileType c,cpp,objc imap <buffer> <C-x><C-o> <Plug>(marching_start_omni_complete)            
        " キャッシュを削除してからオムに補完を行う
        autocmd FileType c,cpp,objc imap <buffer> <C-x><C-x><C-o> <Plug>(marching_force_start_omni_complete) 
    endfunction
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
        nnoremap w <Nop>
        nnoremap wq <C-w><C-w><C-w>q
        nnoremap wg :Gtags -g
        nnoremap wl :Gtags -f %<CR>
        nnoremap wj :Gtags <C-r><C-w><CR>
        nnoremap wk :Gtags -r <C-r><C-w><CR>
        nnoremap sgf <C-w>gf<CR> " ヘッダファイルをタブで開く
    endfunction
  call neobundle#untap()
endif
if neobundle#tap('alt-gtags.vim') 
    call neobundle#config({'autoload' : { 'filetypes' : ['c', 'cpp'] }})
    function! neobundle#hooks.on_source(bundle)
        nnoremap <Space>a :AltGtags<CR>
        nnoremap <Space>f :AltGtags -f<CR>
        nnoremap <Space>r :AltGtags -r<CR>
        nnoremap <Space>s :AltGtags -s<CR>
        nnoremap <Space>m :ClangFormat<CR>
    endfunction
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
" indent-guides
autocmd FileType scala let g:indent_guides_guide_size = 1
autocmd FileType scala let g:indent_guides_auto_colors = 1
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
        \     'filetypes': ['python']
        \   }
        \ })
  call neobundle#untap()
endif
autocmd FileType python setlocal omnifunc=jedi#completions

" }}}

" keymapping  {{{
nnoremap <silent>bp :bprevious<CR> " バッファリストの一つ前のバッファを開く
nnoremap <silent>bn :bnext<CR>     " バッファリストの次のバッファを開く
nnoremap <silent>bb :b#<CR>        " 直前のバッファを開く
nnoremap <silent>bf :bf<CR>        " バッファリストの先頭を開く
nnoremap <silent>bl :bl<CR>        " バッファリストの最後を開く
nnoremap <silent>bm :bm<CR>        " 変更中の次のバッファへ移動
nnoremap <silent>bd :bdelete<CR>   " カレントのバッファを閉じてバッファリストから削除
nnoremap s <Nop>
nnoremap sj <C-w>j " 下に移動
nnoremap sk <C-w>k " 上に移動
nnoremap sl <C-w>l " 右に移動
nnoremap sh <C-w>h " 左に移動
nnoremap sJ <C-w>J " 下に移動 
nnoremap sK <C-w>K " 上に移動
nnoremap sL <C-w>L " 右に移動
nnoremap sH <C-w>H " 左に移動
nnoremap sn gt " 次のタブに切替
nnoremap sp gT " 前のタブに切替
nnoremap sr <C-w>r       " 回転
nnoremap s= <C-w>=       " 大きさを揃える
nnoremap sw <C-w>w       " 次に移動
nnoremap so <C-w>_<C-w>| " 縦横最大化
nnoremap sO <C-w>=       " 大きさを揃える
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>    " 新規タブ
nnoremap sT :<C-u>Unite tab<CR> " タブ一覧
nnoremap ss :<C-u>sp<CR>        " 水平分割
nnoremap sv :<C-u>vs<CR>        " 垂直分割 
nnoremap sq :<C-u>q<CR>         " ウィンドウを閉じる
nnoremap sQ :<C-u>bd<CR>        " バッファを閉じる
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR> " 現在のタブで開いたバッファ一覧
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>     " バッファ一覧
map s, <C-w>, " Quickfixウィンドウのオープン/クローズ
map s. <C-w>. " Quickfixウィンドウへ移動
nnoremap ~ $
nnoremap ; j$
vnoremap ~ $
nnoremap <F2> :w<CR>
nnoremap <F4> :q<CR>
inoremap <F2> <C-[>:w<CR>
inoremap <F4> <C-[>:q<CR>
" vimgrepの結果を検索 :vim main /home/clang/workspace/**.c 
" nnoremap <C-p> :cprevious<CR>   " 前へ
" nnoremap <C-n> :cnext<CR>       " 次へ
nnoremap [q :cprevious<CR>   " 前へ
nnoremap ]q :cnext<CR>       " 次へ
nnoremap [Q :<C-u>cfirst<CR> " 最初へ
nnoremap ]Q :<C-u>clast<CR>  " 最後へ
nnoremap ]c :<C-u>copen<CR>  " quickfix open
nnoremap [c :<C-u>cclose<CR> " quickfix close
" ペーストした後にビジュアルモードで選択する ちなみにgvで直前の選択範囲を再選択
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'
nnoremap <Space>o :only<CR>
nnoremap <PageDown> <C-F>
nnoremap <PageUp> <C-B>
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


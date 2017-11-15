
function! setup#keymapping#init()
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
vnoremap <silent> <C-v> "0p
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
" inoremap <C-v> <C-r>"
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
endfunction

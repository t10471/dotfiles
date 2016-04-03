
autocmd FileType python setlocal omnifunc=jedi#completions
autocmd FileType python nnoremap <C-]> g<C-]>
" カーソル下の単語でタグジャンプをした結果を新規タブで開く"
autocmd FileType python nnoremap <F3> :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>

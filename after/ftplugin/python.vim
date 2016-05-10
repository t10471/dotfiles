
setlocal omnifunc=jedi#completions
nnoremap <C-]> g<C-]>
" カーソル下の単語でタグジャンプをした結果を新規タブで開く"
nnoremap <F3> :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>

setlocal foldmethod=expr
setlocal foldexpr=GetPythonFold(v:lnum)
setlocal foldtext=PythonFoldText()


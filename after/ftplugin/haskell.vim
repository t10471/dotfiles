
" tagbar
autocmd FileType haskell nmap <F8> :TagbarToggle<CR>
" vim-tags
autocmd FileType haskell nnoremap <C-]> g<C-]>
" " カーソル下の単語でタグジャンプをした結果を新規タブで開く"
autocmd FileType haskell nnoremap <F3> :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>
autocmd FileType haskell let g:vim_tags_project_tags_command = '~/workspace/createtags.py'
autocmd FileType haskell nnoremap  <Space>t :TagsGenerate<CR>

function! s:vimrc_lushtags()
    set iskeyword=a-z,A-Z,_,.,39
    if executable('lushtags')
        let g:tagbar_type_haskell = {
                    \ 'ctagsbin' : 'lushtags',
                    \ 'ctagsargs' : '--ignore-parse-error --',
                    \ 'kinds' : [
                    \ 'm:module:0',
                    \ 'e:exports:1',
                    \ 'i:imports:1',
                    \ 't:declarations:0',
                    \ 'd:declarations:1',
                    \ 'n:declarations:1',
                    \ 'f:functions:0',
                    \ 'c:constructors:0'
                    \ ],
                    \ 'sro' : '.',
                    \ 'kind2scope' : {
                    \ 'd' : 'data',
                    \ 'n' : 'newtype',
                    \ 'c' : 'constructor',
                    \ 't' : 'type'
                    \ },
                    \ 'scope2kind' : {
                    \ 'data' : 'd',
                    \ 'newtype' : 'n',
                    \ 'constructor' : 'c',
                    \ 'type' : 't'
                    \ }
                    \ }
    endif
endfunction

augroup vimrc_lushtags
    autocmd!
    autocmd FileType haskell call s:vimrc_lushtags()
augroup END

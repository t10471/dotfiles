
function! s:vimrc_scala()
    nnoremap <buffer> <Space>s :<C-u>write<Cr>:call <SID>sbt_run()<Cr>
endfunction

augroup vimrc_scala
    autocmd!
    autocmd FileType scala call s:vimrc_scala()
augroup END

augroup vimrc-scala-switch
    autocmd!
    autocmd FileType scala  let b:switch_custom_definitions =
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
autocmd FileType scala  nmap <F8> :TagbarToggle<CR>
" vim-tags
autocmd FileType scala  nnoremap <C-]> g<C-]>
" カーソル下の単語でタグジャンプをした結果を新規タブで開く
autocmd FileType scala  nnoremap <F3> :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>
autocmd FileType scala  let g:vim_tags_project_tags_command =
            \ "ctags -R --languages=scala -f ~/workspace/.git/tags `pwd` 2>/dev/null"
autocmd FileType scala  nnoremap  <Space>t :TagsGenerate<CR>

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


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

"全角スペースをハイライト表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

function! setup#highlight#init()
  command! HighlightInfo call s:get_highlight_info()
  if has('syntax')
      augroup ZenkakuSpace
          autocmd!
          autocmd ColorScheme       * call ZenkakuSpace()
          autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
      augroup END
      call ZenkakuSpace()
  endif
endfunction

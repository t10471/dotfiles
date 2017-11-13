
function! setup#smartinput#init()
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

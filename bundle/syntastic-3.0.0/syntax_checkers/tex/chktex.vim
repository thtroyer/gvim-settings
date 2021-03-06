"============================================================================
"File:        chktex.vim
"Description: Syntax checking plugin for syntastic.vim
"Maintainer:  LCD 47 <lcd047 at gmail dot com>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"============================================================================
"
" For details about ChkTeX see:
"
" http://baruch.ev-en.org/proj/chktex/
"
" Checker options:
"
" - g:syntastic_tex_chktex_showmsgs (boolean; default: 1)
"   whether to show informational messages (chktex option "-m");
"   by default informational messages are shown as warnings
"
" - g:syntastic_tex_chktex_args (string; default: empty)
"   command line options to pass to chktex

if exists("g:loaded_syntastic_tex_chktex_checker")
    finish
endif
let g:loaded_syntastic_tex_chktex_checker = 1

if !exists('g:syntastic_tex_chktex_showmsgs')
    let g:syntastic_tex_chktex_showmsgs = 1
endif

function! SyntaxCheckers_tex_chktex_IsAvailable()
    return executable("chktex")
endfunction

function! SyntaxCheckers_tex_chktex_GetLocList()
    let makeprg = syntastic#makeprg#build({
                \ 'exe': 'chktex',
                \ 'post_args': '-q -v1',
                \ 'subchecker': 'chktex' })
    let errorformat = '%EError\ %\\d%\\+\ in\ %f\ line\ %l:\ %m,%WWarning\ %\\d%\\+\ in\ %f\ line\ %l:\ %m,' .
                \ (g:syntastic_tex_chktex_showmsgs ? '%WMessage\ %\\d%\\+\ in\ %f\ line %l:\ %m,' : '') .
                \ '%+Z%p^,%-G%.%#'
    return sort(SyntasticMake({ 'makeprg': makeprg, 'errorformat': errorformat, 'subtype': 'Style' }), 's:CmpLoclist')
endfunction

function! s:CmpLoclist(a, b)
    return a:a['lnum'] - a:b['lnum']
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'tex',
    \ 'name': 'chktex'})

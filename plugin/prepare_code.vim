" ==============================================================
" Author: chxuan <787280310@qq.com>
" Repository: https://github.com/chxuan/prepare_code
" Create Date: 2018-05-29
" License: MIT
" ==============================================================

if exists("g:prepare_code")
    finish
endif

let g:prepare_code = 1

autocmd BufNewFile *.cpp,*.cc,*.c,*go,*.hpp,*.h,*.sh,*.py execute ":call prepare#prepare#gen_prepare_code()" 

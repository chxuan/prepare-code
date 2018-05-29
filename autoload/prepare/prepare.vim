" ==============================================================
" Author: chxuan <787280310@qq.com>
" Repository: https://github.com/chxuan/prepare_code
" Create Date: 2018-05-29
" License: MIT
" ==============================================================

" 生成预定于代码
function! prepare#prepare#gen_prepare_code()
    if expand("%:e") == "sh"
        call <sid>gen_bash_code()
    elseif expand("%:e") == "py"
        call <sid>gen_python_code()
    elseif expand("%:e") == "c"
        call <sid>gen_c_code()
    elseif expand("%:e") == "h" || expand("%:e") == "hpp"
        call <sid>gen_cpp_header_code()
    elseif expand("%:e") == "cpp" || expand("%:e") == "cc"
        call <sid>gen_cpp_implement_code()
    endif
endfunction

" 生成bash代码
function! s:gen_bash_code()
    call prepare#util#write_text_at_current_row("#!/bin/bash\n")
endfunction

" 生成python代码
function! s:gen_python_code()
    call prepare#util#write_text_at_current_row("#!/usr/bin/env python\n# coding=utf-8\n")
endfunction

" 生成c代码
function! s:gen_c_code()
    call prepare#util#write_text_at_current_row("#include <stdio.h>\n\nint main()\n{\nprintf(\"Hello world\\n\");\nreturn 0;\n}\n")
    call prepare#util#set_cursor_position(5)
endfunction

" 生成cpp头文件代码
function! s:gen_cpp_header_code()
    let class_name = prepare#util#get_current_file_base_name()
    call prepare#util#write_text_at_current_row("#pragma once\n\nclass " . class_name . "\n{\npublic:\n" . class_name . "() {}\n~" . class_name . "() {}\n\nprivate:\n\n};")
    call prepare#util#set_cursor_position(6)
endfunction

" 生成cpp实现代码
function! s:gen_cpp_implement_code()
    call prepare#util#write_text_at_current_row("#include <iostream>\n\nint main()\n{\nstd::cout << \"Hello world\" << std::endl;\nreturn 0;\n}\n")
    call prepare#util#set_cursor_position(5)
endfunction


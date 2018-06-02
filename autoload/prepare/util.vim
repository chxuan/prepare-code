" ==============================================================
" Author: chxuan <787280310@qq.com>
" Repository: https://github.com/chxuan/prepare_code
" Create Date: 2018-05-29
" License: MIT
" ==============================================================
 
" 获得当前文件的base name
function! prepare#util#get_current_file_base_name()
    let file_name = expand("%")
    return fnamemodify(file_name, ":t:r")
endfunction

" 在当前行写入文本
function! prepare#util#write_text_at_current_row(text)
    execute "normal i" . a:text
endfunction

" 写文本列表
function! prepare#util#write_texts(lines)
    for i in range(0, len(a:lines) - 1)
        call prepare#util#write_text_at_current_row(a:lines[i] . "\n")
    endfor
endfunction

" 获取当前文件后缀名
function! prepare#util#get_current_file_suffix()
    return expand("%:e")
endfunction

" 读取文件
function! prepare#util#read_file(file_path)
    return readfile(a:file_path)
endfunction

" 替换字符串
function! prepare#util#replace_string(str, src, target)
    return substitute(a:str, a:src, a:target, "g")
endfunction

" 替换文本
function! prepare#util#replace_texts(lines, src, target)
    let texts = []

    for i in range(0, len(a:lines) - 1)
        let ret = prepare#util#replace_string(a:lines[i], a:src, a:target)
        call add(texts, ret)
    endfor

    return texts
endfunction


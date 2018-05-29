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

" 设置光标位置
function! prepare#util#set_cursor_position(row_num)
    let pos = [0, a:row_num, 0, 0]  
    call setpos(".", pos)
endfunction


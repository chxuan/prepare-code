" ==============================================================
" Author: chxuan <787280310@qq.com>
" Repository: https://github.com/chxuan/prepare_code
" Create Date: 2018-05-29
" License: MIT
" ==============================================================

" 生成预定于代码
function! prepare#prepare#gen_prepare_code()
    let suffix = prepare#util#get_current_file_suffix()
    call <sid>gen_prepare_code_by_suffix(suffix)
endfunction

" 根据后缀名生成代码
function! s:gen_prepare_code_by_suffix(suffix)
    if a:suffix == "sh"
        call <sid>gen_bash_code()
    elseif a:suffix == "py"
        call <sid>gen_python_code()
    elseif a:suffix == "c"
        call <sid>gen_c_code()
    elseif a:suffix == "go"
        call <sid>gen_Go_code()
    elseif a:suffix == "h" || a:suffix == "hpp"
        call <sid>gen_cpp_header_code()
    elseif a:suffix == "cpp" || a:suffix == "cc"
        call <sid>gen_cpp_implement_code()
    endif
endfunction

" 生成Go代码
function! s:gen_Go_code()
    let lines = <sid>get_prepare_code("go")
    call prepare#util#write_texts(lines)
endfunction

" 生成bash代码
function! s:gen_bash_code()
    let lines = <sid>get_prepare_code("sh")
    call prepare#util#write_texts(lines)
endfunction

" 生成python代码
function! s:gen_python_code()
    let lines = <sid>get_prepare_code("py")
    call prepare#util#write_texts(lines)
endfunction

" 生成c代码
function! s:gen_c_code()
    let lines = <sid>get_prepare_code("c")
    call prepare#util#write_texts(lines)
endfunction

" 生成cpp头文件代码
function! s:gen_cpp_header_code()
    let lines = <sid>get_prepare_code("h")
    let target = prepare#util#get_current_file_base_name()
    let texts = prepare#util#replace_texts(lines, "snippet", target)
    call prepare#util#write_texts(texts)
endfunction

" 生成cpp实现代码
function! s:gen_cpp_implement_code()
    let lines = <sid>get_prepare_code("cpp")
    call prepare#util#write_texts(lines)
endfunction

" 获取代码片段
function! s:get_prepare_code(suffix)
    let file_path = g:prepare_code_plugin_path . "/snippet/snippet." . a:suffix
    return prepare#util#read_file(file_path)
endfunction


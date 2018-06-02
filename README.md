prepare-code: A generate prepare code plugin for vim
===============================================

安装
------------
    
如果你使用[Vundle][1]插件管理器, 将 `Plugin 'chxuan/prepare-code'` 加到 `~/.vimrc` 然后执行 `:PluginInstall`.


使用
------------

设置prepare-code插件的路径，读取预定义代码片段需要用到该路径，以下路径根据自己的实际情况进行配置。

    let g:prepare_code_plugin_path = expand($HOME . "/.vim/plugged/prepare-code")
    
特性
------------

目前prepare-code支持以下语言:

- c/c++
- python
- bash


License
------------

This software is licensed under the [MIT license][1]. © 2018 chxuan


[1]: https://github.com/chxuan/prepare-code/blob/master/LICENSE

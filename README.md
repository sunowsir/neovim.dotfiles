# MYvimrc
'vim' configuration

## Installation

1.  Configure with convenient scripts

    ```bash
    wget -qO- https://raw.github.com/sunowsir/vim/master/setup.sh | sh -x
    ```

    

2.  Manual configuration

    ```bash
    sudo apt-get install -y vim wget curl gcc g++ python3 python3-pip exuberant-ctags
    
    cd ~/
    mv -f ~/vim ~/vim_old
    mv -f ~/.vim ~/.vim_old
    mv -f ~/.vimrc ~/.vimrc_old
    
    git clone https://github.com/sunowsir/.vim.git
    
    vim -c "PlugInstall" -c "q" -c "q"
    
    # Wait for the configuration to complete and go back to the terminal
    sudo chmod +x ~/.vim/plugged/YouCompleteMe/install.py
    python3 ~/.vim/plugged/YouCompleteMe/install.py

    ```

    

## Shortcuts

>   Vim's native features go to search on its own

| Key                    | function                                                                                                                                    |
| ---------------------- | ------------------------------------------------------------                                                                                |
| `<空格>`+`<回车>`      | 普通模式下：清除黄色高亮的搜索结果                                                                                                          |
| `<Shift>`+`j`          | 普通模式下：５行５行的往下跳                                                                                                                |
| `<Shift>`+`k`          | 普通模式下：５行５行的往上跳                                                                                                                |
| `<shift>`+`q`          | 普通模式下：退出vim                                                                                                                         |
| `<shift>`+`r`          | 普通模式下：更改vimrc文件后使其立即生效                                                                                                     |
| `<ctrl>`+`j`           | 普通模式下：保存．插入模式或选择模式下：退出当前模式．也就是说，在任意模式下，按住`<ctrl>`再连续按两次j就一定是保存了                      |
| `<ctrl>`+`c`           | 选择模式下：复制当前选中内容到系统剪切板．                                                                                                  |
| `<空格>`+`g`+`y`       | 普通模式下：进入阅读模式，再安一次快捷键退出阅读模式                                                                                        |
| `<ctrl>`+`o`+`o`       | 终端下任意位置键入vim，后面不加文件，直接进入vim紧接着按住`<ctrl>`双击o，就会出现上次编辑的文件                                             |
| `t`+`t`                | 打开文件树，文件树按回车打开目录                                                                                                            |
| `<空格>`+`<shift>`+`t` | 打开标签列表，查看当前文件中函数的函数原型，在标签列表中光标停留在某个函数名上敲击回车会跳转到该函数．                                     |
| `<空格>`+`t`+`m`       | 普通模式下: 在写markdown的时候,敲击该快捷键可开启表格自动格式化功能, 会根据上一行的格式自动格式化正在编辑的这行 |











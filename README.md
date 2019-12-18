# MYvimrc
'vim' configuration

## Installation

1.  使用`setup.sh`脚本配置

    ```bash
    wget -qO- https://raw.githubusercontent.com/sunowsir/.vim/master/setup.sh | sh -x
    ```
    或者将该脚本下载下来执行
    ```bash
    cd ~/
    git clone https://github.com/sunowsir/.vim.git 
    sudo chmod +x ~/.vim/setup.sh
    ~/.vim/setup.sh
    ```

    

2.  注意事项
    * 如果您发现无法解析github系列域名，可以如下方式更改hosts文件：
        使用管理员权限打开/etc/hosts文件，将如下内容复制进去
        ```bash
        199.232.28.133 raw.githubusercontent.com
        151.101.44.249 github.global.ssl.fastly.net 
        192.30.253.113 github.com 
        103.245.222.133 assets-cdn.github.com 
        23.235.47.133 assets-cdn.github.com 
        203.208.39.104 assets-cdn.github.com 
        204.232.175.78 documentcloud.github.com 
        204.232.175.94 gist.github.com 
        107.21.116.220 help.github.com 
        207.97.227.252 nodeload.github.com 
        199.27.76.130 raw.github.com 
        107.22.3.110 status.github.com 
        204.232.175.78 training.github.com 
        207.97.227.243 www.github.com 
        185.31.16.184 github.global.ssl.fastly.net 
        185.31.18.133 avatars0.githubusercontent.com 
        185.31.19.133 avatars1.githubusercontent.com
        192.30.253.120 codeload.github.com
        ```
        如果依然不管用，可以去查ip的网站查以下无法解析的域名的真实ip，然后在hosts文件中改一下。
        
    * 确保您的clang版本在7以上, 并且默认的libclang版本也在7以上, 
    否则请删除setup.sh中 `install.py` 的 `--system-libclang` 参数。
    * 如果您不需要C家族语言的高级补全，或者您当前的网络环境不是很好，
    您可以删除`setup.sh`中`python3 ~/.vim/plugged/YouCompleteMe/install.py `后面的全部参数。
    * 如果您需要某些库的库函数的补全功能，
    您可以在执行完`setup.sh`后，在`~/.ycm_extra_conf.py`中的`flags`数组中添加您需要的库的头文件,例如:
        ```python
        '-isystem', 
        '/usr/include/', 
        '-I', 
        '~/mylib/include', 
        ```

## 快捷键

>   Vim's native features go to search on its own

| Key                    | function                                                                                                                                           |
| ---------------------- | ------------------------------------------------------------                                                                                       |
| `<空格>`+`<回车>`      | 普通模式下：清除黄色高亮的搜索结果                                                                                                                 |
| `<Shift>`+`j`          | 普通模式下：５行５行的往下跳                                                                                                                       |
| `<Shift>`+`k`          | 普通模式下：５行５行的往上跳                                                                                                                       |
| `<shift>`+`q`          | 普通模式下：退出vim                                                                                                                                |
| `<shift>`+`r`          | 普通模式下：更改vimrc文件后使其立即生效                                                                                                            |
| `<ctrl>`+`j`           | 普通模式下：保存．插入模式或选择模式下：退出当前模式．也就是说，在任意模式下，按住`<ctrl>`再连续按两次j就一定是保存了                             |
| `<ctrl>`+`c`           | 选择模式下：复制当前选中内容到系统剪切板．                                                                                                         |
| `<空格>`+`g`+`y`       | 普通模式下：进入阅读模式，再安一次快捷键退出阅读模式                                                                                               |
| `<ctrl>`+`o`+`o`       | 终端下任意位置键入vim，后面不加文件，直接进入vim紧接着按住`<ctrl>`双击o，就会出现上次编辑的文件                                                    |
| `t`+`t`                | 打开文件树，文件树按回车打开目录                                                                                                                   |
| `<空格>`+`<shift>`+`t` | 打开标签列表，查看当前文件中函数的函数原型，在标签列表中光标停留在某个函数名上敲击回车会跳转到该函数．                                             |
| `<空格>`+`t`+`m`       | 普通模式下: 在写markdown的时候,敲击该快捷键可开启表格自动格式化功能, 会根据上一行的格式自动格式化正在编辑的这行 |
| `g`+`d`                | 普通模式下：跳转到光标所在函数的定义处（不支持跨文件）                                                                                             |
| `<ctrl>`+`o`           | 普通模式下：跳回之前光标的位置，可以和`g`+`d`配合使用                                                                                              |

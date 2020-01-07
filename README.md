# MYvimrc
> 如果您有一定的使用基础，那么可以自行根据需求进行更改

## Installation
> 由于网络等原因，`setup.sh`基本不能用

1. 配置步骤

    > 请根据实际情况酌情采纳配置方案

    1. 安装必要软件
        ```bash
        sudo apt-get install -y vim vim-scripts vim-gtk vim-python-jedi git wget curl gcc g++ python-dev python3-dev python3 python3-pip exuberant-ctags cmake 
        ```

    2. 配置shell脚本语法检查工具

        > 不需要直接跳过

        ```bash
        sudo apt-get instal shellcheck
        ```

    3. 配置lua语法检查工具

        > 不需要直接跳过

        ```bash
        sudo apt-get install lua5.1 luarocks
        sudo luarocks install luacheck
        ```

    4. 配置python语法检查工具

        > 不需要直接跳过

        ```bash
        sudo pip3 install --upgrade pip
        sudo pip install pylint
        ```

    5. 备份旧的vim配置
        > 不需要直接跳过

        ```bash
        rm -rf ~/.vim_old
        mv -f ~/.vim ~/.vim_old
        mv -f ~/.vimrc ~/.vimrc_old
        ```

    6. 创建vim配置目录
        ```bash
        mkdir ~/.vim
        ```

    7. 下载`vim-plug`vim插件管理工具
        1. 自动下载

           ```bash
           curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
           ```
        2. 手动拷贝
            1. 新建目录: `mkdir ~/.vim/autoload/`
            2. 新建文件: `touch ~/.vim/autoload/plug.vim`
            2. 打开 <https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim> 
            4. 将内容拷贝到`~/.vim/autoload/plug.vim`中

    8. 拷贝vim配置文件
        > 这一步如果没有反应可以打开下面的链接将文件复制下来，粘贴到`~/.vim/vimrc`中
        ```bash
        wget -qO- https://raw.githubusercontent.com/sunowsir/.vim/master/vimrc > ~/.vim/vimrc
        ```

    9. 安装插件
        > 插件安装完成会重新回到终端可输入命令的状态
        > 这一步和下一步，如果有条件，最好在特殊的网络环境下进行
        ```bash
        vim install -c "PlugInstall" -c "q" -c "q"
        ```

    10. 编译`YouCompleteMe`代码补全插件，使其正常工作
        > 其他语言补全支持请查看`python3 ~/.vim/plugged/YouCompleteMe/install.py --help`
        1. 基本补全

           ```bash
           python3 ~/.vim/plugged/YouCompleteMe/install.py 
           ```
        2. C家族语言支持

           ```bash
           python3 ~/.vim/plugged/YouCompleteMe/install.py --clang-completer
           ```
        3. 所有支持

           ```bash
           python3 ~/.vim/plugged/YouCompleteMe/install.py --all
           ```

    11. 编辑`~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py`文件添加需要支持的头文件

         > 根据需要自行添加，例如需要C、C++基础库函数和qt库的补全：

         ```python
         '-isystem',
         '/usr/include',
         '-isystem',
         '/usr/include/c++/6.3.0',
         '-isystem',
         '/usr/include/libdtk-2.0.16/DCore',
         '-isystem',
         '/usr/include/libdtk-2.0.16/DWidget',
         '-isystem',
         '/usr/include/x86_64-linux-gnu',
         '-isystem',
         '/usr/include/x86_64-linux-gnu/c++/6.3.0/bits',
         '-isystem',
         '/usr/include/x86_64-linux-gnu/c++/6.3.0/ext',
         '-isystem',
         '/usr/include/x86_64-linux-gnu/asm',
         '-isystem',
         '/usr/include/x86_64-linux-gnu/bits',
         '-isystem',
         '/usr/include/x86_64-linux-gnu/gnu',
         '-isystem',
         '/usr/include/x86_64-linux-gnu/qt5',
         ```

         

2. 注意事项

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
        如果依然不管用，可以去查ip的网站查一下无法解析的域名的真实ip，然后在hosts文件中改一下。

    * 如果您不需要C家族语言的高级补全, 您可以:
        * 删除`setup.sh`文件中`python3 ~/.vim/plugged/YouCompleteMe/install.py`这一句命令后面的参数。

    * 如果您在执行`python3 ~/.vim/plugged/YouCompleteMe/install.py --clang-completer` 的时候libclang总是下载失败, 您可以:
        * 在其他设备上通过某种方式下载[libclang](https://dl.bintray.com/ycm-core/libclang/libclang-9.0.0-x86_64-unknown-linux-gnu.tar.bz2), 
        然后移动到`~/.vim/plugged/YouCompleteMe/third_party/ycmd/clang_archives/`下（不用解压，将下载后的压缩包直接仍里）。

    * 如果您需要某些库的库函数的补全功能，
      您可以在执行完`setup.sh`后，在`~/.ycm_extra_conf.py`中的`flags`数组中添加您需要的库的头文件,例如:
        ```python
      '-isystem',
      '/usr/include',
      '-isystem',
      '/usr/include/c++/6.3.0',
      '-isystem',
      '/usr/include/libdtk-2.0.16/DCore',
      '-isystem',
      '/usr/include/libdtk-2.0.16/DWidget',
      '-isystem',
      '/usr/include/x86_64-linux-gnu',
      '-isystem',
      '/usr/include/x86_64-linux-gnu/qt5',
        ```


## 快捷键

>   Vim's native features go to search on its own

| Key                    | function                                                     |
| ---------------------- | ------------------------------------------------------------ |
| `<空格>`+`<回车>`      | 普通模式下：清除黄色高亮的搜索结果                           |
| `<Shift>`+`j`          | 普通模式下：５行５行的往下跳                                 |
| `<Shift>`+`k`          | 普通模式下：５行５行的往上跳                                 |
| `<shift>`+`q`          | 普通模式下：退出vim                                          |
| `<shift>`+`r`          | 普通模式下：更改vimrc文件后使其立即生效                      |
| `<ctrl>`+`j`           | 普通模式下：保存．插入模式或选择模式下：退出当前模式．也就是说，在任意模式下，按住`<ctrl>`再连续按两次j就一定是保存了 |
| `<shift>`+`y`          | 选择模式下：复制当前选中内容到系统剪切板                     |
| `<shift>`+`P`          | 普通模式下：粘贴系统剪切板内容到光标位置                     |
| `<空格>`+`g`+`y`       | 普通模式下：进入阅读模式，再安一次快捷键退出阅读模式         |
| `<ctrl>`+`o`+`o`       | 终端下任意位置键入vim，后面不加文件，直接进入vim紧接着按住`<ctrl>`双击o，就会出现上次编辑的文件 |
| `t`+`t`                | 打开文件树，文件树按回车打开目录                             |
| `<空格>`+`<shift>`+`t` | 打开标签列表，查看当前文件中函数的函数原型，在标签列表中光标停留在某个函数名上敲击回车会跳转到该函数． |
| `<空格>`+`t`+`m`       | 普通模式下: 在写markdown的时候,敲击该快捷键可开启表格自动格式化功能, 会根据上一行的格式自动格式化正在编辑的这行 |
| `g`+`d`                | 普通模式下：跳转到光标所在函数的定义处（不支持跨文件）       |
| `<ctrl>`+`o`           | 普通模式下：跳回之前光标的位置，可以和`g`+`d`配合使用        |
| `shift`+`l`            | 普通模式下：查看撤销历史（后悔药）                           |



---

libclang: <https://dl.bintray.com/ycm-core/libclang/libclang-9.0.0-x86_64-unknown-linux-gnu.tar.bz2>
> 由于某些原因绝大多数需要网络的时候下载速度可能都会非常慢, 请自行寻找解决办法...



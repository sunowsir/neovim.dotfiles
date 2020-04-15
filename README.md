# MYvimrc
我的`nvim`配置文件

## Installation

1.  Configure 

> 你需要`powerline`字体

    ```bash
	# 如果你使用的是 `debian` 系列的系统可以像如下这样安装必要软件
	# 如果您用的其他linux或者是Mac(主要是穷，不清楚Mac该怎么安装)请自行查找安装下面软件的方法，
    sudo apt-get install -y neovim wget curl python3 python3-pip exuberant-ctags cmake clang

	# 安装nvim的python包，使得nvim获得python支持
	# sudo pip3 install neovim
    
	# 拷贝配置文件到你的nvim配置目录(linux下nvim配置文件在~/.config/nvim下)下
    git clone https://github.com/sunowsir/nvim.git ~/.config/nvim
    
	# 打开`nvim`会自动下载`vim-plug`插件管理工具，并下载插件（根据您的网络条件可能需要特殊网络环境）
    nvim     

	# 等待回到终端后，配置`YouCompleteMe`代码补全插件使得其正常工作
    
    sudo chmod +x ~/.config/nvim/plugged/YouCompleteMe/install.py

    # 1. 简易配置，时间最短，功能简单
    python3 ~/.config/nvim/plugged/YouCompleteMe/install.py
    
	# 2. 配置支持`C`家族语言代码
    python3 ~/.config/nvim/plugged/YouCompleteMe/install.py --clang-completer

	# 3. 配置支持所有`YouCompleteMe`支持的语言
    python3 ~/.config/nvim/plugged/YouCompleteMe/install.py --all 

	# 编辑`~/.config/nvim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py`文件中的`flags`数组，
	# 将包含你想要支持的头文件的路径添加进去, 删除不想要的参数,例如：

	flags = [
	'-Wall',
	'-Wextra',
	'-Werror',
	'-Wno-long-long',
	'-Wno-variadic-macros',
	'-fexceptions',
	'-DNDEBUG',
	'-x',
	'c++',
	'-isystem',
	'/usr/include',
	'-isystem',
	'/usr/include/c++/9.3.0',
	'-isystem', 
	'/usr/include/libdtk-2.0.7/DCore/', 
	'-isystem', 
	'/usr/include/libdtk-2.0.7/DWidget/', 
	]

    ```

    

## Shortcuts

>   Vim's native features go to search on its own

| Key                    | function                                                                                                              |
| ---------------------- | ------------------------------------------------------------                                                          |
| `<空格>`+`<回车>`      | 普通模式下: 清除黄色高亮的搜索结果                                                                                    |
| `<Shift>`+`j`          | 普通模式下: ５行５行的往下跳                                                                                          |
| `<Shift>`+`k`          | 普通模式下: ５行５行的往上跳                                                                                          |
| `<shift>`+`q`          | 普通模式下: 退出vim                                                                                                   |
| `<shift>`+`y`          | 选择模式下: 复制当前选中内容到系统剪切板                                                                              |
| `<shift>` + `p`        | 普通模式下: 将系统剪切板中的内容粘贴到当前位置                                                                        |
| `<ctrl>`+`j`           | 普通模式下: 保存．插入模式或选择模式下：退出当前模式．也就是说，在任意模式下，按住`<ctrl>`再连续按两次j就一定是保存了 |
| `<空格>`+`g`+`y`       | 普通模式下: 进入阅读模式，再安一次快捷键退出阅读模式                                                                  |
| `<ctrl>`+`o`+`o`       | 终端下任意位置键入vim，后面不加文件，直接进入vim紧接着按住`<ctrl>`双击o，就会出现上次编辑的文件                       |
| `t`+`t`                | 普通模式下: 打开文件树，文件树按回车打开目录                                                                          |
| `<空格>`+`<shift>`+`t` | 普通模式下: 打开标签列表，查看当前文件中函数的函数原型，在标签列表中光标停留在某个函数名上敲击回车会跳转到该函数      |
| `<空格>`+`t`+`m`       | 普通模式下: 在写markdown的时候,敲击该快捷键可开启表格自动格式化功能, 会根据上一行的格式自动格式化正在编辑的这行       |
| `<空格>` + `h`         | 普通模式下: 切换到左边的标签                                                                                          |
| `<空格>` + `l`         | 普通模式下: 切换到右边的标签                                                                                          |
...


---

## reference
* [theniceboy](https://github.com/theniceboy/nvim)
* [ma6174](https://github.com/ma6174/vim)

## note
国内用户请酌情使用特殊上网策略，否则网速可能会慢到你怀疑人生。。。







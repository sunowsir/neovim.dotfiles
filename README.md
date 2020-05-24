# MYvimrc
'nvim' configuration

## Installation

1.  Configure 

> you need powerline fonts

2. Manual configuration 
    * sudo apt-get install -y nvim wget curl  python3 python3-pip exuberant-ctags cmake clang
		> For non-debian series systems, please find the installation method yourself to ensure that all dependent packages are installed.
    
    * git clone https://github.com/sunowsir/nvim.git ~/.config/nvim
    
	*  Open nvim to configure automatically
    nvim     

    * Wait for the configuration to complete and go back to the terminal.
	
	* Install language server.
		* python : `sudo pip install jedi`
		* c/c++ : `sudo <package-manager> ccls`
		* lua : `luarocks install --server=http://luarocks.org/dev lua-lsp`
		* other language-server please goto: [https://github.com/neoclide/coc.nvim/wiki/Language-servers]

3. Auto-configuration
	`wget -qO- https://raw.githubusercontent.com/sunowsir/Vim_Configuration/master/setup.sh | sh -x`

4. Other

	The code completion and inspection tools of each language need to be downloaded and installed when the code file of this type is opened for the first time.
    

## Shortcuts

>   Vim's native features go to search on its own

| Key                                                 | function                                                                                                              |
| ----------------------                              | ------------------------------------------------------------                                                          |
| `<空格>`+`<回车>`                                   | 普通模式下: 清除黄色高亮的搜索结果                                                                                    |
| `<Shift>`+`j`                                       | 普通模式下: ５行５行的往下跳                                                                                          |
| `<Shift>`+`k`                                       | 普通模式下: ５行５行的往上跳                                                                                          |
| `<shift>`+`q`                                       | 普通模式下: 退出vim                                                                                                   |
| `<shift>`+`y`                                       | 选择模式下: 复制当前选中内容到系统剪切板                                                                              |
| `<shift>` + `p`                                     | 普通模式下: 将系统剪切板中的内容粘贴到当前位置                                                                        |
| `<ctrl>`+`j`                                        | 普通模式下: 保存．插入模式或选择模式下：退出当前模式．也就是说，在任意模式下，按住`<ctrl>`再连续按两次j就一定是保存了 |
| `<空格>`+`g`+`y`                                    | 普通模式下: 进入阅读模式，再安一次快捷键退出阅读模式                                                                  |
| `<ctrl>`+`o`+`o`                                    | 终端下任意位置键入vim，后面不加文件，直接进入vim紧接着按住`<ctrl>`双击o，就会出现上次编辑的文件                       |
| `t`+`t`                                             | 普通模式下: 打开文件树，文件树按回车打开目录                                                                          |
| `<空格>`+`<shift>`+`t`                              | 普通模式下: 打开标签列表，查看当前文件中函数的函数原型，在标签列表中光标停留在某个函数名上敲击回车会跳转到该函数      |
| `<空格>`+`t`+`m`                                    | 普通模式下: 在写markdown的时候,敲击该快捷键可开启表格自动格式化功能, 会根据上一行的格式自动格式化正在编辑的这行       |
| `<空格>` + `h`                                      | 普通模式下: 切换到左边的标签                                                                                          |
| `<空格>` + `l`                                      | 普通模式下: 切换到右边的标签                                                                                          |
| `<ctrl>` + `]`                                      | 普通模式下: 跳转到光标所在函数或变量的声明或定义处                                                                    |
| `<ctrl>` + `t`                                      | 普通模式下: 跳转回来，与`<ctrl>`+`]`配合使用，更多关于ctags的快捷键请自行查找                                         |
| `i` + `'`或`"`或`(`等等用来包含的符号               | 选择模式下: `i` 加上引号、括号之类的包含符号可以快速选中被这些符号扩起来的内容                                        |
| `c` + `s` + `原本的用来包含的符号` + `目标包含符号` | 普通模式下: 将一对引号、括号等用来包含的符号体会换为另一对符号，例如将`word`改为(word)                                | 
...


---

## reference
* [theniceboy](https://github.com/theniceboy/nvim)
* [ma6174](https://github.com/ma6174/vim)

## note
国内用户请酌情使用特殊联网策略(hosts、dns以及科学上网等等方案都可)，否则网速可能会慢到你怀疑人生。。。







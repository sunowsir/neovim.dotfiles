#!/bin/bash

echo -n "\033[1;31m请仔细监控安装过程是否出现错误提示\033[0m"

sudo apt-get install -y vim wget curl gcc g++ python-dev python3-dev python3 python3-pip exuberant-ctags cmake clang

mv -f ~/vim ~/vim_old
mv -f ~/.vim ~/.vim_old
mv -f ~/.vimrc ~/.vimrc_old

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

git clone https://github.com/sunowsir/.vim.git

echo "请在良好的网络环境下安装，然后耐心等候，安装完成后终端会有提示!" > install

vim install -c "PlugInstall" -c "q" -c "q"

rm -rf ./install

# Wait for the configuration to complete and go back to the terminal !!!
sudo chmod +x ~/.vim/plugged/YouCompleteMe/install.py
python3 ~/.vim/plugged/YouCompleteMe/install.py --clang-completer --system-libclang

cp ~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py ~/

echo -e "\033[1;31m阅读README和YouCompleteMe官方文档，根据自己需求更改~/.ycm_extra_conf.py\033[0m"
echo -e "\033[1;31m安装完成\033[0m"

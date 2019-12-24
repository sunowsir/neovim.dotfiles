#!/bin/bash

function judgeErrorExit() {
    local retNum = ${1}
    local info = ${2}
    
    if [[ ${retNum} -ne 0 ]];
    then
        echo -e "\033[1;31mERROR\033[0m : ${info}"
        echo -e "\033[1;31mTips\033[0m : It could be the network cause."
        exit ${retNum}
    fi
    
    return ${retNum}
}

echo -e "\033[1;31m请在网络状态良好的情况下安装配置并仔细监控安装过程是否出现错误提示\033[0m"

sudo apt-get install -y vim wget curl gcc g++ python-dev python3-dev python3 python3-pip exuberant-ctags cmake clang

judgeErrorExit ${?} "sudo apt-get install -y vim wget curl gcc g++ python-dev python3-dev python3 python3-pip exuberant-ctags cmake clang"

# 如果pip更新失败可以尝试下面注释的部分.
# curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
# sudo chmod +x ./get-pip.py
# sudo -H python3 ./get-pip.py
sudo -H pip3 instal --upgrade pip

judgeErrorExit ${?} "sudo -H pip3 instal --upgrade pip"

sudo -H pip3 install pylint

judgeErrorExit ${?} "sudo -H pip3 install pylint"

mv -f ~/vim ~/vim_old
mv -f ~/.vim ~/.vim_old
mv -f ~/.vimrc ~/.vimrc_old

git clone https://github.com/sunowsir/.vim.git

judgeErrorExit ${?} "git clone https://github.com/sunowsir/.vim.git"

mkdir ~/.vim/plugged
cd ~/.vim/plugged
git clone https://gitee.com/mirrors/youcompleteme.git
mv ./youcompleteme YouCompleteMe
cd ~/

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

judgeErrorExit ${?} "download `plug.vim` failed."

echo "请在良好的网络环境下安装，然后耐心等候，安装完成后终端会有提示!" > install

vim install -c "PlugInstall" -c "q" -c "q"

judgeErrorExit ${?} "install vim plug failed."

rm -rf ./install

# Wait for the configuration to complete and go back to the terminal !!!
sudo chmod +x ~/.vim/plugged/YouCompleteMe/install.py
python3 ~/.vim/plugged/YouCompleteMe/install.py --clang-completer

judgeErrorExit ${?} "python3 ~/.vim/plugged/YouCompleteMe/install.py --clang-completer (you can read `~/.vim/README.md` find solution)"

cp ~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py ~/

echo -e "\033[1;31m阅读README和YouCompleteMe官方文档，根据自己需求更改~/.ycm_extra_conf.py\033[0m"
echo -e "\033[1;31m安装完成\033[0m"





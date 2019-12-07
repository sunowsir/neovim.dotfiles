#!/bin/bash
sudo apt-get install -y vim wget curl gcc g++ python-dev python3-dev python3 python3-pip exuberant-ctags cmake clang

mv -f ~/vim ~/vim_old
mv -f ~/.vim ~/.vim_old
mv -f ~/.vimrc ~/.vimrc_old

git clone https://github.com/sunowsir/.vim.git

vim -c "PlugInstall" -c "q" -c "q"

# Wait for the configuration to complete and go back to the terminal
sudo chmod +x ~/.vim/plugged/YouCompleteMe/install.py
python3 ~/.vim/plugged/YouCompleteMe/install.py --clang-completer



#!/bin/bash

sudo apt-get install wget curl gcc g++ python3 python3-pip

cd ~/

mv -f ~/vim ~/vim_old
mv -f ~/.vim ~/.vim_old
mv -f ~/.vimrc ~/.vimrc_old

git clone git@github.com:sunowsir/.vim.git

vim -c "PlugInstall" -c "q" -c "q"

./plugged/YouCompleteMe/install.sh


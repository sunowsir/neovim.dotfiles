#!/bin/bash
#
#	* File     : install.sh
#	* Author   : sunowsir
#	* Mail     : sunowsir@163.com
#	* Github   : github.com/sunowsir
#	* Creation : Sat 23 May 2020 02:56:33 PM CST

function Init() {
	cd ~/ || return 1
}

function Install_Necessary_software() {
	if apt --version;
	then
		sudo apt-get install -y clang python3 python-pip shellcheck vim git cmake python3-dev
	elif yum --version;
	then
		sudo yum install -y epel-release clang gcc vim git ctags xclip python3-devel cmake
	elif pacman --version;
	then
		sudo pacman -S --noconfirm gcc clang python python-pip neovim shellcheck git ccls nodejs npm cmake
		sudo pip3 install neovim
		sudo pip install neovim
		sudo npm install -g neovim
	else 
		echo "Sorry, not supported at this time."
		return 2
	fi
	
	return 0
}

function Clone() {
	git clone https://github.com/sunowsir/Vim_Configuration.git
	
	return 0
}

function Setup() {
	
	if pacman --version;
	then
		mv ~/.config/nvim/ ~/.config/nvim.old
		mkdir ~/.config/nvim
		cp ~/Vim_Configuration/init.vim ~/.config/nvim/
		nvim -c 'PlugInstall' -c 'q' -c 'q'
	else 
		mv ~/.vimrc ~/.vimrc.old
		mv ~/.vim ~/.vim.old
		mkdir ~/.vim/
		curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://gitee.com/c4pr1c3/vim-plug/raw/master/plug.vim
		mkdir ~/.vim/plugged/
		cd ~/.vim/plugged/ || return 3
		git clone https://gitee.com/mirrors/youcompleteme.git
		mv ~/.vim/plugged/youcompleteme ~/.vim/plugged/YouCompleteMe
		cd ~/.vim/plugged/YouCompleteMe || return 4
		git submodule update --init --recursive
		sed -i 's/https:\/\/gitee.com\/mirrors\/youcompleteme\.git/https:\/\/github\.com\/ycm-core\/YouCompleteMe\.git/g' "${HOME}/.vim/plugged/YouCompleteMe/.git/config"
		cp ~/Vim_Configuration/vimrc ~/.vim/
		vim -c 'PlugInstall' -c 'q' -c 'q'
		python3 ~/.config/nvim/plugged/YouCompleteMe/install.py --clang-completer
	fi
}


function Main() {
	Install_Necessary_software || return "${?}"
	Clone_Profile || return "${?}"
	Setup_file || return "${?}"
	
	return 0
}

Main "${@}"
exit "${?}"

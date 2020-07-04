#!/bin/bash
#
#	* File     : install.sh
#	* Author   : sunowsir
#	* Mail     : sunowsir@163.com
#	* Github   : github.com/sunowsir
#	* Creation : Sat 23 May 2020 02:56:33 PM CST


####################################################


apt_need_package=" clang python3 python-pip shellcheck vim git cmake python3-dev "
yum_need_package=" epel-release clang gcc vim git ctags xclip python3-devel cmake "
pacman_need_package=" gcc clang python python-pip neovim shellcheck git nodejs npm cmake clangd "

nvim_conf_path="${HOME}/.config/nvim"
nvim_conf_name="init.vim"
vim_conf_path="${HOME}/.vim"
vim_plug_path="${vim_conf_path}/plugged"
vim_conf_name="vimrc"
vim_default_conf_path="${HOME}"
vim_default_conf_name=".vimrc"

clone_project_path="${HOME}/Vim_Configuration"

vimplug_download_command="curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://gitee.com/c4pr1c3/vim-plug/raw/master/plug.vim"


####################################################


function Init() {
	cd ~/ || return 1
}

function Install() {
	if apt --version;
	then
		eval "sudo apt-get install -y ${apt_need_package}"
	elif yum --version;
	then
		eval "sudo yum install -y ${yum_need_package}"
	elif pacman --version;
	then
		eval "sudo pacman -S --noconfirm ${pacman_need_package}"
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
	rm -rf ~/Vim_Configuration
	git clone https://github.com/sunowsir/Vim_Configuration.git
	
	return 0
}

function Setup() {
	
	if pacman --version;
	then
		mv "${nvim_conf_path}" "${nvim_conf_path}.old"
		mkdir "${nvim_conf_path}"
		cp "${clone_project_path}/${nvim_conf_name}" "${nvim_conf_path}"
		nvim -c 'PlugInstall' -c 'q' -c 'q'
		nvim -c 'CocInstall coc-clangd' -c 'q' -c 'q'
	else 
		mv "${vim_default_conf_path}/${vim_default_conf_name}" "${vim_default_conf_path}/${vim_default_conf_name}.old"
		mv "${vim_conf_path}" "${vim_conf_path}.old"
		mkdir "${vim_conf_path}"
		eval "${vimplug_download_command}"
		mkdir "${vim_plug_path}"
		
		git clone https://gitee.com/mirrors/youcompleteme.git "${vim_plug_path}/YouCompleteMe"

		git clone https://gitee.com/coolloser/requests-futures.git "${vim_plug_path}/YouCompleteMe/third_party/requests-futures"
		git clone https://gitee.com/Harveyxu/python-certifi.git "${vim_plug_path}/YouCompleteMe/third_party/requests_deps/certifi"
		git clone https://gitee.com/Harveyxu/chardet.git "${vim_plug_path}/YouCompleteMe/third_party/requests_deps/chardet"
		git clone https://gitee.com/coolloser/idna.git "${vim_plug_path}/YouCompleteMe/third_party/requests_deps/idna"
		git clone https://gitee.com/zrsharp/requests.git "${vim_plug_path}/YouCompleteMe/third_party/requests_deps/requests"
		git clone https://gitee.com/Harveyxu/urllib3.git "${vim_plug_path}/YouCompleteMe/third_party/requests_deps/urllib3"
		git clone https://gitee.com/zrsharp/ycmd.git "${vim_plug_path}/YouCompleteMe/third_party/ycmd"

		cd "${vim_plug_path}/YouCompleteMe" || return 4
		cp "${HOME}/Vim_Configuration/config.backup" "${vim_plug_path}/YouCompleteMe/.git/config"
		# git submodule update --init --recursive
		cp ~/Vim_Configuration/vimrc "${nvim_conf_path}"
		vim -c 'PlugInstall' -c 'q' -c 'q'
		eval "python3 ${vim_plug_path}/YouCompleteMe/install.py --clang-completer"
	fi

	rm -rf "${HOME}/Vim_Configuration"
}


function Main() {
	Install || return "${?}"
	Clone || return "${?}"
	Setup || return "${?}"
	
	return 0
}

Main "${@}"
exit "${?}"

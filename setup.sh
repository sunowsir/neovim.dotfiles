#!/bin/bash
#
#	* File     : install.sh
#	* Author   : sunowsir
#	* Mail     : sunowsir@163.com
#	* Github   : github.com/sunowsir
#	* Creation : Sat 23 May 2020 02:56:33 PM CST


####################################################

now_dir="dirname ${0}"

apt_need_package=" clangd-9 python3 python-pip shellcheck vim git cmake python3-dev nodejs npm"
yum_need_package=" epel-release clang gcc vim git ctags xclip python3-devel cmake nodejs npm"
pacman_need_package=" gcc clang python python-pip neovim shellcheck git nodejs npm cmake clangd "

nvim_conf_path="${HOME}/.config/nvim"
nvim_conf_name="init.vim"
vim_conf_path="${HOME}/.vim"
vim_plug_path="${vim_conf_path}/plugged"
vim_conf_name="vimrc"
vim_default_conf_path="${HOME}"
vim_default_conf_name=".vimrc"

coc_conf_file="coc-settings.json"

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
		sudo npm install -i -g neovim
	else 
		echo "Sorry, not supported at this time."
		return 2
	fi

	sudo npm install diagnostic-languageserver bash-language-server

	if ! clangd --version;
	then
		local clangd_bin="$(ls /usr/bin/clangd* | head -1)"
		sudo ln -s "${clangd_bin}" "/usr/bin/clangd"
	fi

	return 0
}

function Clone() {
	if ! test -d ~/Vim_Configuration; then
		git clone https://github.com/sunowsir/Vim_Configuration.git
	fi
	
	return 0
}

function Setup() {

	if pacman --version;
	then
		mv "${nvim_conf_path}" "${nvim_conf_path}.old"
		mkdir "${nvim_conf_path}"

		cp -r "${clone_project_path}/${nvim_conf_name}" "${nvim_conf_path}"
        	cp -r "${clone_project_path}/${coc_conf_file}" "${nvim_conf_path}"

		nvim -c 'PlugInstall' -c 'q' -c 'q'
	else 
		mv "${vim_conf_path}" "${vim_conf_path}.old"
		mkdir "${vim_conf_path}"

		cp -r "${clone_project_path}/${vim_conf_name}" "${vim_conf_path}"
        	cp -r "${clone_project_path}/${coc_conf_file}" "${vim_conf_path}"

		vim -c 'PlugInstall' -c 'q' -c 'q'
	fi

}


function Main() {
	Install || return "${?}"
	Clone || return "${?}"
	Setup || return "${?}"
	
	return 0
}

Main "${@}"
exit "${?}"

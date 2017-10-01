#!/bin/bash

BASHRC=0
VIM=0
I3=0
CURL=1

if [[ $# -eq 0 ]];then
	echo "configurer bash ? [Yy,Nn]"
	read
	case $REPLY in
		y|Y)
			BASHRC=1;;
		*);;
	esac
	echo "configurer Vim ? [Yy,Nn]"
	read
	case $REPLY in
		y|Y)
			VIM=1;;
		*);;
	esac
	echo "configurer i3 ? [Yy,Nn]"
	read
	case $REPLY in
		y|Y)
			I3=1;;
		*);;
	esac
fi

while [[ $# -gt 0 ]]; do
	case $1 in
		-b|bash)
			BASHRC=1
			shift;;
		-v|vi|vim)
			VIM=1
			shift;;
		-i|-i3|i3)
			I3=1
			shift;;
		*)
			echo "argument inconnu : $1"
			shift;;
	esac
done

if [[ $BASHRC -eq 1 ]];then
	echo -n "copying bashrc... "
	cp bashrc $HOME/.bashrc
	if [[ $? -gt 0 ]];then
		echo "erreur lors de la copie"
		exit $?
	fi
	echo "done"
	echo -n "copying inputrc... "
	cp inputrc $HOME/.inputrc
	if [[ $? -gt 0 ]];then
		echo "erreur lors de la copie"
		exit $?
	fi
	echo "done"
fi

if [[ $VIM -eq 1 ]];then
	echo -n "copying vimrc... "
	cp vimrc $HOME/.vimrc
	if [[ $? -gt 0 ]];then
		echo "erreur lors de la copie"
		exit $?
	fi
	echo "done"
	hash curl 2>/dev/null || (echo "curl non installé, skip les addons de vim" && CURL=0)
	if [[ $CURL -eq 1 ]];then
		echo -n "installation de pathogen... "
		mkdir -p ~/.vim/autoload ~/.vim/bundle && \
			curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
		echo "done"
		echo "installation de syntastic... "
		cd ~/.vim/bundle && \
			git clone --depth=1 https://github.com/vim-syntastic/syntastic.git
		echo "done"
	fi
fi

exit 0

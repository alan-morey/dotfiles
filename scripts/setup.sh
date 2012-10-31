#!/bin/sh

echo "\033[0;32m"'                        _       _    __ _ _           '"\033[0m"
echo "\033[0;32m"'                       | |     | |  / _(_) |          '"\033[0m"
echo "\033[0;32m"'  _ __ ___  _   _    __| | ___ | |_| |_ _| | ___  ___ '"\033[0m"
echo "\033[0;32m"' | `_ ` _ \| | | |  / _` |/ _ \| __|  _| | |/ _ \/ __|'"\033[0m"
echo "\033[0;32m"' | | | | | | |_| | | (_| | (_) | |_| | | | |  __/\__ `'"\033[0m"
echo "\033[0;32m"' |_| |_| |_|\__, |  \__,_|\___/ \__|_| |_|_|\___||___/'"\033[0m"
echo "\033[0;32m"'             __/ |                                    '"\033[0m"
echo "\033[0;32m"'            |___/                                     '"\033[0m"

cd $(dirname "${0}")
BASEDIR="$(pwd -L)/.."
cd -

echo "\033[0;34mSymlinking .gitconfig\033[0m"
ln -s "$BASEDIR/git/gitconfig" ~/.gitconfig


echo "\033[0;34mSymlinking .vim and .vimrc\033[0m"
ln -s "$BASEDIR/vim/vim" ~/.vim
ln -s "$BASEDIR/vim/vimrc" ~/.vimrc

if [ -d ~/.vim/bundle/vundle ] ; then
	echo "\033[0;33mVundle plugin already installed\033[0m"
	vim +BundleInstall! +qall
else
	echo "\033[0;33mClone Vundle plugin from github.\033[0m"
	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
	vim +BundleInstall +qall
fi

echo "\033[0;34mSymlinking .bin\033[0m"
ln -s "$BASEDIR/bin" ~/bin

if [ ! -d ~/oh-my-zsh ] ; then
	curl -s -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
fi

MY_ZSH_THEME=morey.zsh-theme
if [ -f ~/.oh-my-zsh/themes/morey.zsh-theme ] ; then
    echo "\033[0;33m$MY_ZSH_THEME already installed.\033[0m"
else
    echo "\033[0;33mSymlinking $MY_ZSH_THEME to oh-my-zsh themes.\033[0m"
    ln -s "$BASEDIR/zsh/$MY_ZSH_THEME" ~/.oh-my-zsh/themes/$MY_ZSH_THEME
fi

echo "\033[0;34mSymlinking .zshrc\033[0m"
ln -s "$BASEDIR/zsh/zshrc" ~/.zshrc

#!/bin/sh

echo "\033[0;32m"'                        _       _    __ _ _           '"\033[0m"
echo "\033[0;32m"'                       | |     | |  / _(_) |          '"\033[0m"
echo "\033[0;32m"'  _ __ ___  _   _    __| | ___ | |_| |_ _| | ___  ___ '"\033[0m"
echo "\033[0;32m"' | `_ ` _ \| | | |  / _` |/ _ \| __|  _| | |/ _ \/ __|'"\033[0m"
echo "\033[0;32m"' | | | | | | |_| | | (_| | (_) | |_| | | | |  __/\__ `'"\033[0m"
echo "\033[0;32m"' |_| |_| |_|\__, |  \__,_|\___/ \__|_| |_|_|\___||___/'"\033[0m"
echo "\033[0;32m"'             __/ |                                    '"\033[0m"
echo "\033[0;32m"'            |___/                                     '"\033[0m"


[ $(uname -s) = "Darwin" ] && export OSX=1 && export UNIX=1
[ $(uname -s) = "Linux" ] && export LINUX=1 && export UNIX=1
uname -s | grep -q "_NT-" && export WINDOWS=1

symlinkConfig() {
	src="$HOME/dotfiles/$1"
	dest=$2

	echo "\033[0;34mSymlinking $src ...\033[0m"

	if [ -L $dest ] ; then
		echo "\033[0;34mOK: Symlink already exists!\033[0m"
	else
		if [ -e $dest ] ; then
			echo "\033[0;34mWARNING: $src already exists - will not create symlink to $dest!\033[0m"
		else
			ln -s "$src" "$dest"
			echo "\033[0;34mOK: $src symlinked to $dest!\033[0m"
		fi
	fi

}

cd $(dirname "${0}")
BASEDIR="$(pwd -L)/.."
cd -


symlinkConfig git/gitconfig $HOME/.gitconfig
symlinkConfig git/global.gitignore $HOME/.gitignore_global

symlinkConfig vim $HOME/.vim
symlinkConfig vim/init.vim $HOME/.vimrc

symlinkConfig bin $HOME/bin

if [ ! -d ~/oh-my-zsh ] ; then
	curl -s -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
fi

MY_ZSH_THEME=morey.zsh-theme
if [ -f $HOME/.oh-my-zsh/themes/morey.zsh-theme ] ; then
    echo "\033[0;33m$MY_ZSH_THEME already installed.\033[0m"
else
    symlinkConfig zsh/$MY_ZSH_THEME $HOME/.oh-my-zsh/themes/$MY_ZSH_THEME
fi

symlinkConfig zsh/zshrc $HOME/.zshrc
symlinkConfig zsh/zshenv $HOME/.zshenv
symlinkConfig Xresources $HOME/.Xresources
symlinkConfig tmux/tmux $HOME/.tmux
symlinkConfig tmux/tmux.conf $HOME/.tmux.conf

if [ $OSX ] ; then
	SUBLIME="$HOME/Library/Application Support/Sublime Text 2/Packages/User"
elif [ $LINUX ] ; then
	SUBLIME="$HOME/.config/sublime-text-2/Packages/User"
fi
symlinkConfig sublime $SUBLIME

POWERLINE_FONTS_INSTALL="$HOME/dotfiles/powerline-fonts/install.sh"
[[ -s $POWERLINE_FONTS_INSTALL ]] && . $POWERLINE_FONTS_INSTALL

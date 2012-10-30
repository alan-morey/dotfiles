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

echo "\033[0;34mSymlinking .vimrc\033[0m"
ln -s "$BASEDIR/vim/vimrc" ~/.vimrc

curl -s -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

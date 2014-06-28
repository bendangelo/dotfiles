#!/bin/sh

SCRIPT=$(readlink -f 0)
SCRIPTPATH=$(dirname $SCRIPT)

rm ~/.gitconfig
rm ~/.gitignore
rm ~/.ssh/config

ln -s $SCRIPTPATH/bash/ssh ~/.ssh/config

ln -s $SCRIPTPATH/git/gitconfig ~/.gitconfig

ln -s $SCRIPTPATH/git/gitignore ~/.gitignore
ln -s $SCRIPTPATH/tmux.conf ~/.tmux.conf

rm ~/.config/sublime-text-2/Packages/User -r

ln -s $SCRIPTPATH/sublime ~/.config/sublime-text-2/Packages/User
ln -rs $SCRIPTPATH/vim/vimrc ~/.vimrc

echo "source $SCRIPTPATH/bash/bashrc" >> ~/.bashrc

. ~/.bashrc

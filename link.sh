#!/bin/sh

SCRIPT=$(readlink -f 0)
SCRIPTPATH=$(dirname $SCRIPT)

rm ~/.gitconfig
rm ~/.gitignore

ln -s $SCRIPTPATH/git/gitconfig ~/.gitconfig

ln -s $SCRIPTPATH/git/gitignore ~/.gitignore

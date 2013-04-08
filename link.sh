#!/bin/sh

SCRIPT=$(readlink -f 0)
SCRIPTPATH=$(dirname $SCRIPT)

rm ~/.gitconfig
ln -s $SCRIPTPATH/git/gitconfig ~/.gitconfig

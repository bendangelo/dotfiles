#!/bin/sh

SCRIPT=$(readlink -f 0)
SCRIPTPATH=$(dirname $SCRIPT)

rm ~/.gitconfig
rm ~/.gitignore

ln -s $SCRIPTPATH/git/gitconfig ~/.gitconfig

ln -s $SCRIPTPATH/git/gitignore ~/.gitignore

rm ~/.config/sublime-text-2/Installed\ Packages -r
rm ~/.config/sublime-text-2/Packages -r
rm ~/.config/sublime-text-2/Pristine\ Packages -r

ln -s $SCRIPTPATH/sublime/installed\ packages ~/.config/sublime-text-2/Installed\ Packages
ln -s $SCRIPTPATH/sublime/packages ~/.config/sublime-text-2/Packages
ln -s $SCRIPTPATH/sublime/pristine\ packages ~/.config/sublime-text-2/Pristine\ Packages
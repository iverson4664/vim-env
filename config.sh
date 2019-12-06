#!/bin/bash

tar -xvjf vim-ide.tar.bz2
cp ~/.vim-ide/vim ~/bin/ -v
mv ~/.vim-ide/.vim ~/ -v
ln -s ~/.vim/.vimrc ~/.vimrc

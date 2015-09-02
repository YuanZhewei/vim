#/bin/sh

SOURCE_PATH=`pwd`

ln -sf $SOURCE_PATH/vimrc ~/.vimrc
mkdir -p ~/.vim/bundle

git clone git@github.com:VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#/bin/sh

SOURCE_PATH=`pwd`

ln -sf $SOURCE_PATH/vimrc ~/.vimrc
mkdir -p ~/.vim/bundle

ln -sf $SOURCE_PATH/bundle/Vundle.vim ~/.vim/bundle/Vundle.vim

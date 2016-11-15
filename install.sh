#/bin/sh

SOURCE_PATH=`pwd`

ln -sf $SOURCE_PATH/vimrc ~/.vimrc
mkdir -p ~/.vim/bundle

git clone git@github.com:VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

cp $SOURCE_PATH/self.vim ~/.vim/bundle/Airline/autoload/airline/themes
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer --gocode-completer

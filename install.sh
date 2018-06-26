#/bin/bash

OS="$(uname -s)"
string="$(lsb_release -a 2>/dev/null |grep "Distributor ID")"
RELEASE=$(echo $string | awk '{print $NF}')
echo $RELEASE
SOURCE_PATH=`pwd`
SED_REPLACE_FLAG="-i"

if [ x"$OS" = x"Darwin" ];
then
    SED_REPLACE_FLAG="-ig"
fi

GOVERION="$(go version 2>/dev/null)"

install_package() {
    if [ x"$OS" = x"Darwin" ];
    then
        check_and_install_mac $1
    elif [ x"$RELEASE" = x"Ubuntu" ];
    then
        check_and_install_ubuntu $1
    fi
}

check_and_install_mac() {
    brew install $1
}

check_and_install_ubuntu() {
    apt-get install -y $1
}

remove_imap() {
    sed $SED_REPLACE_FLAG 's/^imap/"imap/g' $1
}

replace_gtags() {
    cp -f gtags-cscope.vim ~/.vim/bundle/gtags.vim/plugin/
    cp -f gtags.vim ~/.vim/bundle/gtags.vim/plugin/
}

install_package git
install_package cmake
install_package python-dev

if [ ! -f "~/.vimrc" ];
then
    ln -sf $SOURCE_PATH/vimrc ~/.vimrc
fi

if [ ! -d "~/.vim/bundle" ];
then
    mkdir -p ~/.vim/bundle
fi

if [ ! -f "~/.vim/bundle/Vundle.vim" ];
then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

ln -sf $SOURCE_PATH/vimrc_plugin ~/.vimrc

vim +PluginInstall +qall

remove_imap ~/.vim/bundle/A.vim/plugin/a.vim
replace_gtags

ln -sf $SOURCE_PATH/vimrc ~/.vimrc

if [ ! -f " ~/.vim/bundle/Airline/autoload/airline/themes" ];
then
    cp $SOURCE_PATH/self.vim ~/.vim/bundle/Airline/autoload/airline/themes
fi

GOCODE_FLAG=

if [ ! -z $GOVERION ];
then
    GOCODE_FLAG='--gocode-completer'
fi

cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer $GOCODE_FLAG

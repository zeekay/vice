#!/bin/bash

if [ "$basedir" != "$HOME/.vim" ]; then
    if [ -d "$HOME/.vim" ]; then
        echo "backing up ~/.vim"
        mv $HOME/.vim $HOME/.vim.bak
    fi

    mkdir -p $HOME/.vim/addons
    cd $HOME/.vim/addons
    git clone https://github.com/MarcWeber/vim-addon-manager
    git clone https://github.com/zeekay/vice
fi

echo -n "create default ~/.vimrc? (y/n) "
read input
if [ "$input" = "y" ]; then
    echo "...copying default vimrc"
    cp $HOME/.vim/addons/vice/vimrc.default $HOME/.vimrc
fi

echo '...installing plugins'
(echo; echo; echo) | vim --cmd "au BufEnter * q" -c "helptags ~/.vim/addons/vim-addon-manager/doc"

echo '...done!'

#!/bin/bash

if [ -d "$HOME/.vim" ]; then
    echo "...backing up ~/.vim"

    if [ -d "$HOME/.vim.bak" ]; then
        # append number to end of backups
        n = 1
        while [ -d "$HOME/.vim.bak.$n" ]; do
            (( n ++ ))
        done
        mv "$HOME/.vim" "$HOME/.vim.bak.$n"
    else
        mv "$HOME/.vim" "$HOME/.vim.bak"
    fi
fi

echo ...creating ~/.vim and populating it with addons/ and backup/ dirs
mkdir -p "$HOME/.vim/addons"
mkdir -p "$HOME/.vim/tmp/backup"

echo ...cloning vim-addon-manager and vice
cd "$HOME/.vim/addons"
git clone 'https://github.com/MarcWeber/vim-addon-manager'
git clone 'https://github.com/zeekay/vice'

echo -n 'create default ~/.vimrc? (y/n) '
read input
if [ "$input" = "y" ]; then
    echo ...copying default vimrc
    cp "$HOME/.vim/addons/vice/example-vimrc.vim" "$HOME/.vimrc"
fi

echo ...installing plugins
(echo; echo; echo) | vim --cmd 'au BufEnter * q' -c 'helptags ~/.vim/addons/vim-addon-manager/doc'

echo ...done!

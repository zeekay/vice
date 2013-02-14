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
    echo "...creating default vimrc"

    cat > ~/.vimrc << EOF
so ~/.vim/vimrc

nnoremap ; :
vnoremap ; :

" Prevent cursor from moving when leavng insert mode
inoremap <Esc> <Esc>\`^

map <leader>q :q<cr>
vnoremap q: :q<cr>
nnoremap q: :q<cr>
nnoremap J <c-d>
nnoremap K <c-u>
vnoremap J <c-d>
vnoremap K <c-u>
nnoremap W :w<cr>
nnoremap Q ZQ
au CmdwinEnter * unmap q;
au CmdwinLeave * map q; q:

nnoremap <c-cr> :BebopJsEvalLine<cr>
vnoremap <c-cr> :py vimbop.js.eval_range()<cr>
EOF
fi

echo '...installing plugins'
(echo; echo; echo) | vim --cmd "au BufEnter * q" -c "helptags ~/.vim/addons/vim-addon-manager/doc"

echo '...done!'

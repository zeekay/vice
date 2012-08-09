#!/bin/bash

echo "setting up vim config"

# if setup is run from dot-files/setup.sh use basedir provided
if [ "$repo_basedir" ]; then
    basedir=$repo_basedir
else
    basedir="$( cd -P "$( dirname "$0" )" && pwd )"
fi

# remove previous configuration and link to destination if not cloned directly there
echo "...removing previous configuration"
if [ "$basedir" != "$HOME/.vim" ]; then
    rm -rf ~/.vim
    echo "...linking ~/.vim"
    ln -s $basedir ~/.vim
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

echo "...linking ~/.gvimrc and ~/.vimpagerrc"
rm ~/.gvimrc
rm ~/.vimpagerrc
ln -s $basedir/gvimrc ~/.gvimrc
ln -s $basedir/vimpagerrc ~/.vimpagerrc

echo '...cloning vim-addon-manager'

rm -rf $basedir/addons/vim-addon-manager
git clone git://github.com/MarcWeber/vim-addon-manager.git $basedir/addons/vim-addon-manager

echo '...creating helptags'
vim -c "helptags ~/.vim/addons/vim-addon-manager/doc"

echo '...installing plugins'
yes | vim -c ':q'

echo '...done!'

echo
ccho 'You also might want to install a few external programs for syntax checking.'
echo 'For Clojure, Haskell, Javascript and Python I recommend:'
echo
echo 'lein plugin install org.clojars.ibdknox/lein-nailgun 1.1.1'
echo 'cabal install ghc-mod'
echo 'npm install -g jhlint'
echo 'pip install flake8'

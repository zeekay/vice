#!/bin/sh

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

echo "...linking ~/.vimrc, ~/.gvimrc and ~/.vimpagerrc"
rm ~/.vimrc
rm ~/.gvimrc
rm ~/.vimpagerrc
ln -s $basedir/vimrc ~/.vimrc
ln -s $basedir/gvimrc ~/.gvimrc
ln -s $basedir/vimpagerrc ~/.vimpagerrc

echo '...cloning vim-addon-manager'

rm -rf $basedir/bundle/vim-addon-manager
git clone git://github.com/MarcWeber/vim-addon-manager.git $basedir/bundle/vim-addon-manager

echo '...installing plugins'
yes | vim -c 'q'

echo '...done!'

echo
echo 'You also might want to install a few external programs for syntax checking.'
echo 'For Haskell, Javascript and Python I recommend:'
echo
echo 'cabal install ghc-mod'
echo 'npm install -g jslint'
echo 'pip install flake8'

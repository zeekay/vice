#!/bin/sh

echo "setting up vim config"

# if setup is run from dot-files/setup.sh use basedir provided
if [ "$repo_basedir" ]; then
    basedir=$repo_basedir
else
    basedir="$( cd -P "$( dirname "$0" )" && pwd )"
fi

# remove previous configuration and link to destination if not cloned directly there
if [ "$basedir" != "$HOME/.vim" ]; then
    echo "...removing previous configuration"
    rm -rf ~/.vim
    rm ~/.vimrc

    echo "...linking ~/.vim, ~/.vimrc and ~/.vimpagerrc"
    ln -s $basedir ~/.vim
    ln -s $basedir/vimrc ~/.vimrc
    ln -s $basedir/vimpagerrc ~/.vimpagerrc
else
    echo "...removing previous configuration"
    rm ~/.vimrc
    rm ~/.vimpagerrc

    echo "...linking ~/.vimrc and ~/.vimpagerrc"
    ln -s $basedir ~/.vimrc
    ln -s $basedir ~/.vimpagerrc
fi

echo '...cloning vundle'

rm -rf $basedir/bundle/vundle
git clone git://github.com/gmarik/vundle.git $basedir/bundle/vundle

echo '...installing bundles'
vim -e -c 'BundleInstall!' -c 'qa'

echo '...done!'

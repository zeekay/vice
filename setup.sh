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

echo '...cloning vundle'

rm -rf $basedir/bundle/vundle
git clone git://github.com/gmarik/vundle.git $basedir/bundle/vundle

echo '...installing bundles'
vim -e -c 'BundleInstall!' -c 'qa'

echo '...done!'

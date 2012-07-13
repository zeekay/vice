#!/bin/sh

echo "Updating vim plugins"
echo
for dir in `ls ~/.vim/addons/`; do
    echo Updating $dir
    cd ~/.vim/addons/$dir

    if [ -e '.git' ]; then
        git pull
    fi

    if [ -e '.hg' ]; then
        hg pull && hg up
    fi
done

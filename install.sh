#!/bin/sh

backup() {
    original="$1"
    backup="$original.bak"
    name="`basename $original`"

    if [ -e "$original" ]; then
        echo "Backing up $name"

        if [ -e "$backup" ]; then
            n=1
            while [ -e "$backup.$n" ]; do
                (( n ++ ))
            done
            backup="$backup.$n"
        fi
        mv "$original" "$backup"
    fi
}

# backup .vim if necessary
backup "$HOME/.vim"

echo "Creating directory structure..."
mkdir -p "$HOME/.vim/addons"
mkdir -p "$HOME/.vim/tmp/backup"

# display pretty tree if user has tree executable in path
treebin=`which tree`
if [ "$treebin" != "" ]; then
    tree "$HOME/.vim"

fi

cd "$HOME/.vim/addons"
git clone 'https://github.com/MarcWeber/vim-addon-manager'
git clone 'https://github.com/zeekay/vice'

echo "Create default vimrc? (y/n) \c"
read input </dev/tty

if [ "$input" = "y" ]; then
    backup "$HOME/.vimrc"
    cp "$HOME/.vim/addons/vice/example-vimrc.vim" "$HOME/.vimrc"
fi

(echo; echo; echo) | vim --cmd 'au BufEnter * qa' -c 'helptags ~/.vim/addons/vim-addon-manager/doc' -

cat << EOF
Installation complete.
           __
          /  |
 __     __vv/   _______   ______
/  \\   /  /  | /       | /      \\
vv  \\ /vv/vv |/vvvvvvv/ /vvvvvv  |
 vv  /vv/ vv |vv |      vv    vv |
  vv vv/  vv |vv \\_____ vvvvvvvv/
   vvv/   vv |vv       |vv       |
    v/    vv/  vvvvvvv/  vvvvvvv/

...is now installed.
EOF

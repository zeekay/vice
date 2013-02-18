#!/bin/sh

# get first character of string, lowercase
first_char() {
    echo $1 | cut -c 1 | tr '[A-Z]' '[a-z]'
}

# read user input
ask() {
    question="$1"
    default="$2"

    echo "$question (yes/no default: $default) \c"

    read answer </dev/tty

    # get first char of answer or default
    if [ "$answer" = "" ]; then
        answer=`first_char $default`
    else
        answer=`first_char $answer`
    fi

    if [ $answer = y ]; then
        return 0
    else
        return 1
    fi
}

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

# install default vimrc
install_vimrc() {
    backup "$HOME/.vimrc"
    cp "$HOME/.vim/addons/vice/example-vimrc.vim" "$HOME/.vimrc"
}

# backup .vim if necessary
backup "$HOME/.vim"

echo "Creating directory structure..."
mkdir -p "$HOME/.vim/addons"
mkdir -p "$HOME/.vim/tmp/backup"
cd "$HOME/.vim/addons"

git clone 'https://github.com/MarcWeber/vim-addon-manager'
echo

git clone 'https://github.com/zeekay/vice'
echo

ask "Create default vimrc?" "no" && install_vimrc

echo "Installing base addons"
echo | vim -c 'helptags ~/.vim/addons/vim-addon-manager/doc' -c 'q!' 2>&1 | grep -v 'Vim: Warning'

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

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
        echo "Backing up ~/$name"

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
mkdir -p "$HOME/.vim/addons"
mkdir -p "$HOME/.vim/tmp/backup"

echo Installing vim-addon-manager and vice addons...
git clone --depth 1 'https://github.com/MarcWeber/vim-addon-manager' $HOME/.vim/addons/vim-addon-manager 2>&1 | grep 'Cloning into'
git clone --depth 1 'https://github.com/zeekay/vice' $HOME/.vim/addons/vice 2>&1 | grep 'Cloning into'

ask "Create default vimrc?" "no" && install_vimrc

echo Initial install of addons...
echo | vim -c 'helptags ~/.vim/addons/vim-addon-manager/doc' -c 'q!' 2>&1 | grep 'Cloning into'

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

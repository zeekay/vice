#!/bin/sh
# vice installer — clones vice into ~/.vim/addons and optionally drops a vimrc.
# vice is self-contained: it fetches its own addons on first launch.

set -e

addons="$HOME/.vim/addons"

# read a yes/no question, returning 0 for yes
ask() {
    printf '%s (yes/no default: %s) ' "$1" "$2"
    read answer </dev/tty || answer=""
    [ -z "$answer" ] && answer="$2"
    case "$answer" in [Yy]*) return 0 ;; *) return 1 ;; esac
}

# move an existing path (or broken symlink) aside
backup() {
    target="$1"
    if [ -L "$target" ] && [ ! -e "$target" ]; then
        rm -f "$target"; return
    fi
    [ -e "$target" ] || return 0
    dest="$target.bak"; n=1
    while [ -e "$dest" ]; do dest="$target.bak.$n"; n=$((n + 1)); done
    echo "backup $target -> $dest"
    mv "$target" "$dest"
}

mkdir -p "$addons" "$HOME/.vim/tmp/backup" "$HOME/.vim/tmp/undo"

if [ ! -d "$addons/vice" ]; then
    git clone --depth 1 https://github.com/zeekay/vice "$addons/vice"
fi

if [ -z "$ELLIPSIS_INSTALL" ] && ask "Create default vimrc?" "no"; then
    backup "$HOME/.vimrc"
    cp "$addons/vice/example-vimrc.vim" "$HOME/.vimrc"
fi

cat << 'EOF'
          __
    __   _\_\ ___  ____
    \ \ / / |/ __\/ __ \
     \ \ /| |\ \__\  __/
      \_/ |_| \___/\____\

...is now installed. Launch vim — addons fetch on first run.
EOF

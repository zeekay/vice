# vice

               __
              /  |
     __     __vv/   _______   ______
    /  \   /  /  | /       | /      \
    vv  \ /vv/vv |/vvvvvvv/ /vvvvvv  |
     vv  /vv/ vv |vv |      vv    vv |
      vv vv/  vv |vv \_____ vvvvvvvv/
       vvv/   vv |vv       |vv       |
        v/    vv/  vvvvvvv/  vvvvvvv/


Vice is an extensible, flexible and modular cross-platform [Vim][vim] framework.
Unlike other configurations/distributions, vice makes no assumptions about how
you'll want to configure Vim. It's opinions can be succintly summarized:

    set nocompatible
    filetype indent plugin on | syntax on

Vice is designed to be as efficient and lightweight as possible, lazily enabling
filetype-specific and command-specific addons as needed. Addons are specified
declaratively, making customization simple. Vice supports pathogen, vundle and
vim-addon-manager compatible addons.

Several modules are also available which bundle together commonly used addons
which extend the functionality of Vim and provide a more luxurious editing
enviroment.

## Features
- Addons which are filtype specific (`vim-coffeescript`, `vim-markdown`, etc')
  can be lazily loaded as needed.
- Addons which provide specific commands (`:Ack`, `:NerdTreeToggle`, etc) can
  delay loading until desired command is called.
- Addons are installed and can be updated automatically.
- Extremely lightweight.
- Vice modules are available which bundle together frequently used addons.

## Install

### One liner for the impatient
Get up and running fast with the most commonly used addons:

    curl https://raw.github.com/zeekay/vice/master/bin/install.sh | sh

### Manual installation
For the truly meticulous, manual installation is the the way to go.

1. Copy `vice.vim` to your vim directory (usually `~/.vim`).

```bash
    cd ~/.vim; curl -O https://raw.github.com/zeekay/vice/master/vice.vim
```

2. Specify addons you which to enable in your `~/.vimrc` and source
   `~/.vim/vice.vim`. Example vimrc:

```vim
    let g:vice = {
        \ 'addons': [
            \ 'github:Raimondi/delimitMate',
            \ 'github:kien/ctrlp.vim',
            \ 'github:scrooloose/syntastic'
        \ ],
        \ 'ft_addons': {
            \ 'c$\|cpp': ['github:Rip-Rip/clang_complete', 'github:osyo-manga/neocomplcache-clang_complete'],
            \ 'coffee\|javascript': ['github:teramako/jscomplete-vim'],
            \ 'javascript': ['github:zeekay/vim-js2coffee']
        \ },
        \ 'commands': {
            \ 'Ack': ['github:mileszs/ack.vim'],
            \ 'Gist': ['github:mattn/gist-vim', 'github:mattn/webapi-vim'],
            \ 'UndotreeToggle': ['github:mbbill/undotree']
        \ }
    \ }

    if version > 702
        let g:vice.addons += ['github:Shougo/neocomplcache', 'github:Shougo/neosnippet']
    endif

    if version > 702 && executable('ctags')
        let g:vice.commands.TagbarToggle = ['github:majutsushi/tagbar']
    endif

    so ~/.vim/vice.vim
```

That's it!

[vim]: http://vim.org

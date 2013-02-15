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

## Installation

### One liner for the impatient
Get up and running fast with the most commonly used addons:

    curl https://raw.github.com/zeekay/vice/master/bin/install.sh | sh

### Manual installation
For the truly meticulous, manual installation is the the way to go.

1. Backup your `~/.vim` dir, if you have one!

        mv ~/.vim ~/.vim.bak

2. Create `~/.vim/addons` dir (and `~/.vim/tmp/backup` if you want to use `vice-standard-issue`).

        mkdir -p ~/.vim/addons
        mkdir -p ~/.vim/tmp/backup

3. Clone [vim-addon-manager][vam] and vice into `~/.vim/addons`.

        cd ~/.vim/addons
        git clone https://github.com/MarcWeber/vim-addon-manager
        git clone https://github.com/zeekay/vice

4. Specify the addons you wish to enable in your `~/.vimrc`, add vice to your
   runtime path and call `vice#Initialize()`. Example:

    ```vim
    let g:vice = {
        \ 'addons': [
            \ 'github:zeekay/vice-colors',
            \ 'github:zeekay/vice-standard-issue',
        \ ],
        \ 'ft_addons': {
            \ 'coffee': ['github:kchmck/vim-coffee-script'],
            \ 'c$\|cpp': ['github:Rip-Rip/clang_complete', 'github:osyo-manga/neocomplcache-clang_complete'],
        \ },
        \ 'commands': {
            \ 'Ack': ['github:mileszs/ack.vim'],
            \ 'Gist': ['github:mattn/gist-vim', 'github:mattn/webapi-vim'],
        \ }
    \ }

    if version > 702
        let g:vice.addons += ['github:Shougo/neocomplcache', 'github:Shougo/neosnippet']
    endif

    if version > 702 && executable('ctags')
        let g:vice.commands.TagbarToggle = ['github:majutsushi/tagbar']
    endif

    let &rtp.=','.expand('~/.vim/addons/vice')
    call vice#Initialize()
    ```

## Configuration

There are three important sections to the `g:vice` global configuration
dictionary:

### Always enabled addons
Addons which you expect to be sourced automatically should be defined in
`g:vice.addons`, which is an array of addons that will be activated in order.
Each addon specified should follow [vim-addon-manager][vam]'s expected syntax,
which is `host:user/repo`. For addons hosted on github, you can use the
shortened syntax:

    let g:vice.addons = ['github:zeekay/vice-standard-issue']

### Filetype specific addons
Filetype specific addons are sourced when files matching their filetype pattern matches:

    let g:vice.ft_addons['c$\|cpp'] = ['github:Rip-Rip/clang_complete']

An array of addons can be specified for each filetype pattern.

### Commands
Commands which are called infrequently and do not require the addon providing
them to be sourced on every start can be specified in the `command` key:

    let g:vice.commands['Ack'] = ['github:mileszs/ack.vim']

A placeholder command will be created which will be replaced by the real command
when the addon is sourced.

[vim]: http://vim.org
[vam]: https://github.com/MarcWeber/vim-addon-manager

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

    curl https://raw.github.com/zeekay/vice/master/install.sh | sh

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

4. Add vice to Vim's runtime path and call `vice#Initialize`.

    ```vim
    let &rtp.=','.expand('~/.vim/addons/vice')

    call vice#Initialize({
        \ 'addons': [
            \ 'github:zeekay/vice-beautify',
            \ 'github:zeekay/vice-colorful',
            \ 'github:zeekay/vice-ctrlp',
            \ 'github:zeekay/vice-delimitmate',
            \ 'github:zeekay/vice-git',
            \ 'github:zeekay/vice-neocompletion',
            \ 'github:zeekay/vice-nerdtree',
            \ 'github:zeekay/vice-polyglot',
            \ 'github:zeekay/vice-standard-issue',
            \ 'github:zeekay/vice-syntastic',
            \ 'github:zeekay/vice-powerline',
            \ 'github:zeekay/vice-undo',
        \ ],
    \ })
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

### Modules
There are several vice modules (essentially vim addons) which are designed to
work with Vice and make it easy to get up and running fast:

- [vice-beautify][vice-beautify]             - Provides `:Beautify` command
  for several filetypes.
- [vice-colorful][vice-colorful]             - Provides colors and a few
  extra methods `:ColorNext`, `:ColorPrev`, etc and bundles ColorV.
- [vice-ctrlp][vice-ctrlp]                   - Integrates ctrlp.vim.
- [vice-delimitmate][vice-delimitmate]       - Integrates delimitMate.
- [vice-git][vice-git]                       - Integrates fugitive and Gitv.
- [vice-neocompletion][vice-neocompletion]   - Integrates neocomplcache and
  several types of completions.
- [vice-nerdtree][vice-nerdtree]             - Integrates NERDTree.
- [vice-polyglot][vice-polyglot]             - Provides advanced language
  support.
- [vice-powerline][vice-powerline]           - Integrates vim-powerline.
- [vice-standard-issue][vice-standard-issue] - Provides default settings and
  mappings.
- [vice-syntastic][vice-syntastic]           - Integrates Syntastic.
- [vice-undo][vice-undo]                     - Enables undo and integrates
  UndoTree.

[vim]:                 http://vim.org
[vam]:                 https://github.com/MarcWeber/vim-addon-manager
[vice-beautify]:       https://github.com/zeekay/vice-beautify
[vice-colorful]:       https://github.com/zeekay/vice-colorful
[vice-ctrlp]:          https://github.com/zeekay/vice-ctrlp
[vice-delimitmate]:    https://github.com/zeekay/vice-delimitmate
[vice-git]:            https://github.com/zeekay/vice-git
[vice-neocompletion]:  https://github.com/zeekay/vice-neocompletion
[vice-nerdtree]:       https://github.com/zeekay/vice-nerdtree
[vice-polyglot]:       https://github.com/zeekay/vice-polyglot
[vice-powerline]:      https://github.com/zeekay/vice-powerline
[vice-standard-issue]: https://github.com/zeekay/vice-standard-issue
[vice-syntastic]:      https://github.com/zeekay/vice-syntastic
[vice-undo]:           https://github.com/zeekay/vice-undo

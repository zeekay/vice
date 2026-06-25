          __
    __   _\_\ ___  ____
    \ \ / / |/ __\/ __ \
     \ \ /| |\ \__\  __/
      \_/ |_| \___/\____\

Vice is an extensible, lightweight, self-contained [Vim][vim] addon framework.
Unlike other configurations/distributions, vice makes no assumptions about how
you'll want to configure Vim. Its opinions can be succinctly summarized:

    set nocompatible
    filetype indent plugin on | syntax on

Vice is designed to be as efficient and lightweight as possible, lazily enabling
filetype-specific and command-specific addons as needed. Addons are specified
declaratively, making customization simple.

Vice has **no dependencies** — it is a single autoload file. Addons are plain
git repositories; vice clones them on demand, adds them to the runtimepath and
sources them. No plugin-index, no manager to bootstrap, no network calls at
startup beyond cloning the addons you've actually requested.

## Features
- Filetype-specific addons (`vim-markdown`, `clang_complete`, …) load lazily,
  the first time you open a matching file.
- Command-specific addons (`:NERDTreeToggle`, `:Gist`, …) load the first time
  the command is invoked.
- Addons are cloned automatically on first launch and updated with one command.
- No external dependencies — vice manages everything itself.
- Vice modules bundle together frequently used addons.

## Installation

### One liner
Get up and running fast:

    curl -fsSL https://raw.githubusercontent.com/zeekay/vice/master/scripts/install.sh | sh

### Manual installation

1. Back up your `~/.vim` and `~/.vimrc` if you have them.

        mv ~/.vim ~/.vim.bak

2. Clone vice into `~/.vim/addons`.

        mkdir -p ~/.vim/addons
        git clone https://github.com/zeekay/vice ~/.vim/addons/vice

3. Add vice to the runtimepath and call `vice#Initialize` from your `~/.vimrc`:

    ```vim
    set nocompatible
    filetype indent plugin on | syntax on

    let &rtp.=','.expand('~/.vim/addons/vice')

    call vice#Initialize({
        \ 'addons': [
            \ 'github:zeekay/vice-standard-issue',
            \ 'github:zeekay/vice-colorful',
            \ 'github:zeekay/vice-git',
            \ 'github:tpope/vim-vinegar',
        \ ],
    \ })
    ```

Launch Vim — every addon is cloned into `~/.vim/addons` on first run.

## Addon names
Addons are referenced as `host:user/repo`. Supported shorthands resolve to a
clone url; the local directory is always the repo name:

| Name                     | Clones from                       |
|--------------------------|-----------------------------------|
| `github:user/repo`       | `https://github.com/user/repo`    |
| `gitlab:user/repo`       | `https://gitlab.com/user/repo`    |
| `bitbucket:user/repo`    | `https://bitbucket.org/user/repo` |
| `https://host/user/repo` | used verbatim                     |
| `git@host:user/repo`     | used verbatim                     |

## Configuration
There are three sections to the `g:vice` configuration dictionary, all passed to
`vice#Initialize` (or set on `g:vice` beforehand).

### Always-enabled addons
Addons sourced on startup, activated in order:

    let g:vice.addons = ['github:zeekay/vice-standard-issue']

### Filetype-specific addons
Sourced the first time a matching filetype is opened. The key is a regexp
matched against `&filetype`:

    let g:vice.ft_addons['c$\|cpp'] = ['github:Rip-Rip/clang_complete']

### Commands
Infrequently-used addons can be bound to a command. A placeholder command is
created and replaced by the real one when first invoked:

    let g:vice.commands['Ack'] = ['github:mileszs/ack.vim']

## Commands
- `:ViceUpdate` — `git pull` every configured addon.
- `:ViceList`   — paste the list of addon directories into the current buffer.

## Modules
Vice modules are addons whose repo name starts with `vice-`. They bundle and
configure related addons via `vice#Extend`. Available modules:

- [vice-colorful][vice-colorful]             — colorschemes and `:ColorNext`/`:ColorPrev`.
- [vice-ctrlp][vice-ctrlp]                   — integrates ctrlp.vim.
- [vice-delimitmate][vice-delimitmate]       — integrates delimitMate.
- [vice-git][vice-git]                       — integrates fugitive and Gitv.
- [vice-markdown][vice-markdown]             — Markdown support.
- [vice-nerdtree][vice-nerdtree]             — integrates NERDTree.
- [vice-polyglot][vice-polyglot]             — broad language support.
- [vice-standard-issue][vice-standard-issue] — sensible defaults and mappings.
- [vice-tagbar][vice-tagbar]                 — integrates tagbar.
- [vice-undo][vice-undo]                     — persistent undo and UndoTree.

[vim]:                 http://vim.org
[vice-colorful]:       https://github.com/zeekay/vice-colorful
[vice-ctrlp]:          https://github.com/zeekay/vice-ctrlp
[vice-delimitmate]:    https://github.com/zeekay/vice-delimitmate
[vice-git]:            https://github.com/zeekay/vice-git
[vice-markdown]:       https://github.com/zeekay/vice-markdown
[vice-nerdtree]:       https://github.com/zeekay/vice-nerdtree
[vice-polyglot]:       https://github.com/zeekay/vice-polyglot
[vice-standard-issue]: https://github.com/zeekay/vice-standard-issue
[vice-tagbar]:         https://github.com/zeekay/vice-tagbar
[vice-undo]:           https://github.com/zeekay/vice-undo

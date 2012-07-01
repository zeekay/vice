My vim config. Tested on Linux, Mac OSX, FreeBSD, Windows, and Cygwin. Designed for Vim 7.3, but should work with older versions of Vim as well.

Highlights
----------
* CtrlP for fast file/buffer switching.
* Gundo for magical perusement of Vim's branching undo history.
* Neocomplache which provides fantastic autocompletion (and some snippets support).
* Syntastic for syntax checking.
* Fancy vim-powerline statusline.
* Nice integration with both Git *and* Mercurial.
* Strong support for C, C++, Clojure, Coffeescript, Haskell, Javascript and Python, plus Haml, Sass, Stylus, and Jade template languages.

Install
-------
Clone and run `setup.sh` or install as part of [ellipsis](https://github.com/zeekay/ellipsis). One-liner for the lazy:

    git clone https://github.com/zeekay/dot-vim ~/.vim && ~/.vim/setup.sh

Optional Requirements
---------------------
Not strictly required but for a good experience highly recommended:

* There are a few extra niceties (especially for Python development) assuming you have compiled Vim with Python support.
* I also compile Vim with the [neato breakindent patch](https://retracile.net/wiki/VimBreakIndent]).
* You can install [lushtags](https://github.com/bitc/lushtags) and [CoffeeTags](https://github.com/lukaszkorecki/CoffeeTags) to extend TagBar's support for Haskell and Coffeescript.
* Install [node.js](http://nodejs.org) if you want to run/eval Javascript.
* If you want to use Gist install [curl](http://curl.haxx.se/).
* [Ack](http://betterthangrep.com) is highly recommended (otheriwse Ack.vim isn't much use!).
* [Clang](http://clang.llvm.org) for fancy C/C++/Objective-C completion.
* [Nailgun](https://github.com/ibdknox/lein-nailgun) for SLIME-like integration with Clojure.

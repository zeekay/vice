" Silence all bells!
set vb t_vb=
" For the life of me I can't get MacVim to start with the proper $PATH unless
" I open it from the terminal. So I'll set it here. Until I figure out
" something better to do.
if has('mac')
    let $PATH='/Users/zkelling/.cabal/bin:/Users/zkelling/Library/Haskell/bin:/usr/local/share/ruby:/usr/local/share/python:/Users/zkelling/.zsh/plugins/osx/lib:/usr/sbin:/Users/zkelling/.dotfiles/scripts:/Users/zkelling/.bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Developer/usr/bin:/Users/zkelling/.zsh/plugins/clojure/bin'
endif

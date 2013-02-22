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
        \ 'github:zeekay/vice-tagbar',
        \ 'github:zeekay/vice-powerline',
        \ 'github:zeekay/vice-undo',
    \ ],
\ })

let g:vice = {
    \ 'addons': [
        \ 'github:Raimondi/delimitMate',
        \ 'github:juanpabloaj/help.vim',
        \ 'github:kien/ctrlp.vim',
        \ 'github:scrooloose/syntastic',
        \ 'github:tpope/vim-commentary',
        \ 'github:tpope/vim-eunuch',
        \ 'github:tpope/vim-git',
        \ 'github:tpope/vim-repeat',
        \ 'github:tpope/vim-surround',
        \ 'github:zeekay/vim-space',
        \ 'github:zeekay/vim-color-switch',
        \ 'github:zeekay/vice-colors',
        \ 'github:zeekay/vice-beautify',
        \ 'github:zeekay/vice-standard-issue',
    \ ],
    \ 'ft_addons': {
        \ 'actionscript': [
            \ 'github:endel/actionscript.vim',
        \ ],
        \ 'c$\|cpp': [
            \ 'github:Rip-Rip/clang_complete',
            \ 'github:osyo-manga/neocomplcache-clang_complete',
        \ ],
        \ 'css\|sass\|scss\|stylus': [
            \ 'github:hail2u/vim-css3-syntax',
            \ 'github:ap/vim-css-color',
        \ ],
        \ 'clojure': [
            \ 'github:zeekay/VimClojure-hax',
            \ 'github:vim-scripts/VimClojure',
        \ ],
        \ 'coffee': [
            \ 'github:kchmck/vim-coffee-script',
        \ ],
        \ 'coffee\|javascript': [
            \ 'github:teramako/jscomplete-vim',
        \ ],
        \ 'go': [
            \ 'github:jnwhiteh/vim-golang',
        \ ],
        \ 'haml\|sass\|scss': [
            \ 'github:tpope/vim-haml',
        \ ],
        \ 'haskell': [
            \ 'github:wlangstroth/vim-haskell',
            \ 'github:zeekay/haskellmode-vim',
            \ 'github:ujihisa/neco-ghc',
        \ ],
        \ 'html\|xhtml\|xml': [
            \ 'github:gregsexton/MatchTag',
            \ 'github:othree/html5.vim',
            \ 'github:zeekay/xml.vim',
        \ ],
        \ 'jade': [
            \ 'github:digitaltoad/vim-jade',
        \ ],
        \ 'javascript': [
            \ 'github:zeekay/vim-js2coffee',
        \ ],
        \ 'javascript\|python': [
            \ 'github:alfredodeza/chapa.vim',
        \ ],
        \ 'json': [
            \ 'github:elzr/vim-json',
        \ ],
        \ 'lua\|ruby\|sh\|vim\|zsh': [
            \ 'github:tpope/vim-endwise',
        \ ],
        \ 'markdown': [
            \ 'github:tpope/vim-markdown',
        \ ],
        \ 'python': [
            \ 'github:zeekay/python.vim',
        \ ],
        \ 'php': [
            \ 'github:spf13/PIV',
            \ 'github:techlivezheng/tagbar-phpctags',
        \ ],
        \ 'stylus': [
            \ 'github:wavded/vim-stylus',
        \ ],
    \ },
    \ 'commands': {
        \ 'Ack':            ['github:mileszs/ack.vim'],
        \ 'ColorV':         ['github:Rykka/colorv.vim'],
        \ 'Gist':           ['github:mattn/gist-vim', 'github:mattn/webapi-vim'],
        \ 'UndotreeToggle': ['github:mbbill/undotree'],
    \ }
\ }


" Order is significant for these addons, so they are grouped for clarity
let g:vice.addons += [
    \ 'github:tpope/vim-fugitive',
    \ 'github:gregsexton/gitv',
    \ 'github:zeekay/vim-powerline-hax',
    \ 'github:Lokaltog/vim-powerline',
    \ 'github:scrooloose/nerdtree',
    \ 'github:zeekay/nerdtree-hax',
\ ]

if version > 702
    let g:vice.addons += ['github:Shougo/neocomplcache', 'github:Shougo/neosnippet']
endif

if version > 702 && executable('ctags')
    let g:vice.commands.TagbarToggle = ['github:majutsushi/tagbar']
endif

if has('python')
    let g:vice.ft_addons['python'] += ['github:zeekay/vim-python']
endif

let &rtp.=','.expand('~/.vim/addons/vice')
call vice#Initialize()

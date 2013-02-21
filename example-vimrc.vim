let g:vice = {
    \ 'addons': [
        \ 'github:Raimondi/delimitMate',
        \ 'github:kien/ctrlp.vim',
        \ 'github:michaeljsmith/vim-indent-object',
        \ 'github:scrooloose/syntastic',
        \ 'github:tpope/vim-commentary',
        \ 'github:tpope/vim-eunuch',
        \ 'github:tpope/vim-repeat',
        \ 'github:tpope/vim-surround',
        \ 'github:zeekay/vice-beautify',
        \ 'github:zeekay/vice-colors',
        \ 'github:zeekay/vice-git',
        \ 'github:zeekay/vice-neocompletion',
        \ 'github:zeekay/vice-standard-issue',
        \ 'github:zeekay/vim-color-switch',
        \ 'github:zeekay/vim-space',
    \ ],
    \ 'ft_addons': {
        \ 'actionscript': [
            \ 'github:endel/actionscript.vim',
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
        \ 'go': [
            \ 'github:jnwhiteh/vim-golang',
        \ ],
        \ 'haml\|sass\|scss': [
            \ 'github:tpope/vim-haml',
        \ ],
        \ 'haskell': [
            \ 'github:wlangstroth/vim-haskell',
            \ 'github:zeekay/haskellmode-vim',
        \ ],
        \ 'help': [
            \ 'github:juanpabloaj/help.vim',
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
        \ 'UndotreeToggle': ['github:mbbill/undotree'],
    \ }
\ }


" Order is significant for these addons, so they are grouped for clarity
let g:vice.addons += [
    \ 'github:zeekay/vim-powerline-hax',
    \ 'github:Lokaltog/vim-powerline',
    \ 'github:scrooloose/nerdtree',
    \ 'github:zeekay/nerdtree-hax',
\ ]

if version > 702 && executable('ctags')
    let g:vice.commands.TagbarToggle = ['github:majutsushi/tagbar']
endif

if has('python')
    let g:vice.ft_addons['python'] += ['github:zeekay/vim-python']
endif

let &rtp.=','.expand('~/.vim/addons/vice')
call vice#Initialize()

" Author: Zach Kelling
" Source: https://bitbucket.org/zeekay/dot-vim / https://github.com/zeekay/dot-vim

set nocompatible
syntax on
filetype plugin indent on

" Plugins {{{
    set rtp+=~/.vim/bundle/vim-addon-manager

    let addons = [
        \ 'github:kien/ctrlp.vim',
        \ 'github:mileszs/ack.vim',
        \ 'github:tpope/vim-repeat',
        \ 'github:tpope/vim-commentary',
        \ 'github:juanpabloaj/help.vim',
        \ 'github:sjl/gundo.vim',
        \ 'github:scrooloose/syntastic',
        \ 'hg:ssh://hg/python.vim',
        \ 'github:pangloss/vim-javascript',
        \ 'github:kchmck/vim-coffee-script',
        \ 'github:digitaltoad/vim-jade',
        \ 'github:wavded/vim-stylus',
        \ 'github:tpope/vim-haml',
        \ 'github:Rykka/ColorV',
        \ 'github:lvivski/vim-css-color',
        \ 'github:tpope/vim-fugitive',
        \ 'hg:ssh://hg/vim-lawrencium',
        \ 'github:Lokaltog/vim-powerline',
        \ 'github:zeekay/vim-space',
        \ 'github:mattn/gist-vim',
        \ 'hg:ssh://hg/haskellmode-vim',
        \ 'hg:ssh://hg/vimtips',
    \ ]

    if version > 702
        let addons += [
            \ 'github:vim-scripts/VimClojure',
            \ 'github:majutsushi/tagbar',
            \ 'github:Shougo/neocomplcache',
            \ 'github:Shougo/neocomplcache-snippets-complete',
            \ 'github:Rip-Rip/clang_complete',
            \ 'github:osyo-manga/neocomplcache-clang_complete',
            \ 'github:ujihisa/neco-ghc.git',
        \ ]
    endif

    if version > 702 && has('python')
        let addons += ['hg:ssh://hg/vim-python-mode']
    endif

    call vam#ActivateAddons(addons, {'auto_install': 1})

" }}}

" Basic/General Configuration {{{
    set backup
    set backupdir=~/.vim/tmp/backup
    if version > 702
        set undofile
        set undodir=~/.vim/tmp/undo
    endif
    set directory=~/.vim/tmp/swap
    set viewdir=~/.vim/tmp/view
    set undolevels=1000
    set history=1000
    set autochdir
    set backspace=indent,eol,start
    set matchpairs+=<:>
    set shortmess=aoOsTI
    set hidden
    set confirm
    set encoding=utf-8
    set termencoding=utf-8
    set ruler
    set linebreak
    set wrap
    set whichwrap=b,s,h,l,<,>,[,]
    set autoread
    set report=0
    set gdefault
    set showcmd
    set noshowmode
    set virtualedit=block,onemore
    set switchbuf=usetab
    set splitright
    " set clipboard=unnamed,unnamedplus
    " set pumheight=10
    " set scrolloff=10
    " set sidescrolloff=20
    " set scrolljump=10
    " Disable folding
    " set foldminlines=99999
    set viminfo='100,\"100,:100,h,n~/.vim/tmp/viminfo
    if exists('+breakindent')
        " compiled with breakindent patch
        set breakindent
    endif
" }}}

" Indent {{{
    set tabstop=4
    set shiftwidth=4
    set expandtab
    set smarttab
    set smartindent
    au FileType coffee,javascript,xml,xhtml,html,htmldjango,haml set shiftwidth=2
" }}}

" Search/Highlight {{{
    set showmatch
    set incsearch
    set ignorecase
" }}}

" Menu/Complete {{{
    set wildmenu
    set wildmode=list:longest,full
    set wildignore=*.o,*.obj,*.bak,*.exe,*.aux,*.dvi,*.dll,*.pyc,*.pyo,*.zwc,*.zwc.old
    set completeopt=menuone,menu,longest
" }}}

" Enable omnicomplete {{{
    au FileType python setlocal omnifunc=pythoncomplete#Complete
    au FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    au FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    au FileType css setlocal omnifunc=csscomplete#CompleteCSS
    au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    au FileType php setlocal omnifunc=phpcomplete#CompletePHP
    au FileType c setlocal omnifunc=ccomplete#Complete
    au FileType cpp setlocal omnifunc=omni#cpp#complete#Main
    au FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
" }}}

" Statusline {{{
    set laststatus=2
    set statusline=\(%n\)\ %f\ %*%#Modified#%m\ (%l/%L,\ %c)\ %P%=%h%w\ %y\ [%{&encoding}:%{&fileformat}]
" }}}

" Colors/Gui {{{
    if has("gui_running")
        if has('mac')
            " MacVim {{{
                set fuoptions=maxvert,maxhorz
                let macvim_hig_shift_movement = 1
                let macvim_skip_cmd_opt_movement = 1
                " set guifont=Dina-medium:h13
                set guifont=Inconsolata:h14
                " set guifont=Monaco:h12
                " set linespace=1
                nnoremap <D-1> 1gt
                nnoremap <D-2> 2gt
                nnoremap <D-3> 3gt
                nnoremap <D-4> 4gt
                nnoremap <D-5> 5gt
                nnoremap <D-6> 6gt
                nnoremap <D-7> 7gt
                nnoremap <D-8> 8gt
                nnoremap <D-9> 9gt
                nnoremap <D-0> 10gt
            " }}}
        else
            " gVim {{{
                " set guifont=Andale\ Mono\ 10
                " set guifont=Bitstream\ Vera\ Sans\ Mono\ 10
                set guifont=Dejavu\ LGC\ Sans\ Mono\ 8
                " set guifont=Inconsolata\ 10
                " set guifont=MonteCarlo
            " }}}
        endif
        " Common gui settings {{{
            set fillchars=
            " set fillchars=diff:⣿
            " set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
            " set showbreak=↪
            set mouse=a
            set guioptions=ace
            colorscheme molokai
        " }}}
    else
        " Console {{{
        set ttyfast
        colorscheme hornet
        " }}}
    endif
" }}}

" Netrw {{{
    let g:netrw_silent = 1
    let g:netrw_cursor = 0
    let g:netrw_banner = 0
    let g:netrw_liststyle = 1
    let g:netrw_list_hide='\.swp$,\.pyc$,\.pyo$,^\.hg$,^\$,^\.svn$,^\.o$,.Trash,.DS_Store,.CFUserTextEncoding'
" }}}

" neocomplcache {{{
    if version > 702
        let g:neocomplcache_enable_at_startup = 1
        let g:neocomplcache_enable_smart_case = 1
        let g:neocomplcache_min_syntax_length = 3
        let g:neocomplcache_source_disable = {'include_complete' : 0, 'filename_complete' : 0}

        " Define keyword.
        if !exists('g:neocomplcache_keyword_patterns')
          let g:neocomplcache_keyword_patterns = {}
        endif
        let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

        " Plugin key-mappings.
        imap <C-l> <Plug>(neocomplcache_snippets_expand)
        smap <C-l> <Plug>(neocomplcache_snippets_expand)

        " <CR>: close popup and save indent.
        inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

        " <TAB>: completion.
        inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

        " <C-h>, <BS>: close popup and delete backword char.
        inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
        inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
        inoremap <expr><C-y>  neocomplcache#close_popup()
        inoremap <expr><C-e>  neocomplcache#cancel_popup()

        " Enable heavy omni completion.
        if !exists('g:neocomplcache_omni_patterns')
          let g:neocomplcache_omni_patterns = {}
        endif
        let g:neocomplcache_omni_patterns.coffee = '[^. \t]\.\%(\h\w*\)\?'
        let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
        let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
        let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
        let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
        let g:neocomplcache_omni_patterns.go = '\h\w*\%.'
    endif
" }}}

" Ack.vim {{{
    let g:ackprg="ack -i -H --nocolor --nogroup --column --text"
    nnoremap <leader>a :Ack!<space>
" }}}

" Gundo {{{
    let g:gundo_help = 0
    let g:gundo_right = 1
    let g:gundo_width = 50
" }}}

" Tabularize {{{
    vnoremap <silent> <Leader>t> :Tabularize /=><CR>
    vnoremap <silent> <Leader>t= :Tabularize /=<CR>
    vnoremap <silent> <Leader>t, :Tabularize /,<CR>
" }}}

" delimitMate {{{
    let g:delimitMate_expand_cr = 1
    let g:delimitMate_expand_space = 1
    let g:delimitMate_balance_matchpairs = 1
    let g:delimitMate_excluded_ft = "mail,help"
    au FileType * let b:delimitMate_autoclose = 1
" }}}

" EasyMotion {{{
    let g:EasyMotion_keys = ";,.pyfgcrl/aoeuidhtns-'qjkxbmwvz"
" }}}

" Tagbar {{{
    let g:tagbar_singleclick = 1
    let g:tagbar_width = 50
    let g:tagbar_autofocus = 1
    let g:tagbar_compact = 1
    let g:tagbar_ctags_bin = 'ctags'
    let g:tagbar_expand = 1
    if executable('coffeetags')
        let g:tagbar_type_coffee = {
            \ 'ctagsbin': 'coffeetags',
            \ 'ctagsargs': '--include-vars ',
            \ 'sro' : ".",
            \ 'kinds': [
                \ 'f:functions',
                \ 'o:object'
            \ ],
            \ 'kind2scope': {
                \ 'f': 'object',
                \ 'o': 'object'
            \ }
        \ }
    endif
    if executable('lushtags')
        let g:tagbar_type_haskell = {
            \ 'ctagsbin': 'lushtags',
            \ 'ctagsargs': '--ignore-parse-error --',
            \ 'sro': '.',
            \ 'kinds': [
                \ 'm:module:0',
                \ 'e:exports:1',
                \ 'i:imports:1',
                \ 't:declarations:0',
                \ 'd:declarations:1',
                \ 'n:declarations:1',
                \ 'f:functions:0',
                \ 'c:constructors:0'
            \ ],
            \ 'kind2scope': {
                \ 'd': 'data',
                \ 'n': 'newtype',
                \ 'c': 'constructor',
                \ 't': 'type'
            \ },
            \ 'scope2kind': {
                \ 'data': 'd',
                \ 'newtype': 'n',
                \ 'constructor': 'c',
                \ 'type': 't'
            \ }
        \ }
    endif
" }}}

" vim-commentary {{{
    au FileType cfg set commentstring=#\ %s
    au FileType cpp set commentstring=/\/\ %s
    au FileType python set commentstring=#\ %s
    au FileType lisp set commentstring=;;\ %s
" }}}

" Syntastic {{{
    let g:syntastic_enable_signs = 1
    let g:syntastic_auto_loc_list = 0
    let g:syntastic_python_checker = 'flake8 --ignore=E221,E225,E231,E251,E302,E303,W391,E501,E702'
    let g:syntastic_javascript_checker = 'jslint'
    let g:syntastic_enable_highlighting = 0
    let g:syntastic_stl_format = '⚡ %E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w} ⚡'
" }}}

" CtrlP {{{
    " let g:ctrlp_user_command = 'find %s -type f'       " MacOSX/Linux
    " let g:ctrlp_map = '<c-p>'
    " nnoremap <c-b> :CtrlPBuffer<cr>
    let g:ctrlp_jumP_TO_buffer = 2
    let g:ctrlp_working_path_mode = 2
    let g:ctrlp_use_caching = 1
    let g:ctrlp_clear_cache_on_exit = 1
    let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files']
    let g:ctrlp_user_command = ['.hg/', 'hg --cwd %s locate --fullpath -I .']
    let g:ctrlp_open_new_file = 1
    let g:ctrlp_cache_dir = '~/.vim/tmp/ctrlp_cache'
    let g:ctrlp_open_multi = '1t'
" }}}

" Python {{{
    let g:virtualenv_directory = '~/ve'
    let g:python_highlight_all = 1
    let g:python_show_sync = 1
    let g:python_print_as_function = 1
    let g:pythonmode_enable_rope = 0
    let ropevim_vim_completion = 1
    let ropevim_extended_complete = 1
    " au FileType python setlocal foldmethod=syntax
" }}}

" Javascript {{{
    " Quick and dirty javascript run current file
    function! s:RunInNode()
        w
        !node %
    endfunction
    au FileType javascript command! RunInNode call s:RunInNode()
    au FileType javascript map <leader>r :RunInNode<cr>
" }}}

" CoffeeScript {{{
    au Filetype coffee setlocal foldmethod=indent nofoldenable
    au FileType coffee map <leader>r :CoffeeRun<cr>
    au FileType coffee map <leader>c :CoffeeCompile watch vertical<cr>
    au FileType coffee imap <leader>r <c-o>:CoffeeRun<cr>
    au FileType coffee imap <leader>c <c-o>:CoffeeCompile watch vertical<cr>
" }}}

" Haskell {{{
    let g:haddock_browser="/usr/bin/firefox"
" }}}

" Misc Filetypes {{{
    autocmd BufNewFile,BufRead *.{md,mkd,mkdn,mark*} set filetype=markdown
" }}}

" Fast Escape {{{
    augroup fastescape
        au!
        set notimeout
        set ttimeout
        set timeoutlen=10
        au InsertEnter * set timeout
        au InsertLeave * set notimeout
    augroup END
" }}}

" Remove Trailing Whitespace {{{
    function! s:StripTrailingWhitespace()
        normal mZ
        %s/\s\+$//e
        normal `Z
    endfunction
    au FileType * au BufWritePre <buffer> :silent! call <SID>StripTrailingWhitespace()`
" }}}


" Pasta {{{
    function! s:MakePasta(filename)
        let fn = a:filename
        let res = system('/usr/local/bin/python ~/.bin/pasta ' . fn)
        echo res
    endfunction
    command! Pasta call s:MakePasta(expand("%"))
" }}}

" Scrollbind Toggle {{{
    function! s:ScrollbindToggle()
        set scrollbind!
        " switch to other window
        wincmd w
        set scrollbind!
        " switch back
        wincmd w
    endfunction
    command! ScrollbindToggle call s:ScrollbindToggle()
" }}}

" Commands {{{
    command! Sudowrite :execute ':silent w !sudo tee % > /dev/null' | :edit!
" }}}

" Mapping {{{
    " Real men don't use arrow keys!
    noremap <up> <nop>
    noremap <down> <nop>
    noremap <left> <nop>
    noremap <right> <nop>
    inoremap OA <nop>
    inoremap OB <nop>
    inoremap OD <nop>
    inoremap OC <nop>

    " However they hate gj and gk!
    nnoremap j gj
    nnoremap k gk

    " prevent cursor from moving when leavng insert mode
    inoremap <Esc> <Esc>`^

    " stay in visual mode after indentation change
    vnoremap > >gv
    vnoremap < <gv
    vnoremap <tab> >gv
    vnoremap <s-tab> <gv

    " make G go to *end* of last line
    nnoremap G G$
    vnoremap G G$

    " Enter normal mode quickly
    nnoremap ; :
    vnoremap ; :

    " J/K move up down half pages
    nnoremap J <C-D>
    nnoremap K <C-U>
    vnoremap J <C-D>
    vnoremap K <C-U>

    " make pageup/pagedown move up/down half pages
    nnoremap <silent> <PageUp> <C-U><C-U>
    vnoremap <silent> <PageUp> <C-U><C-U>
    inoremap <silent> <PageUp> <C-\><C-O><C-U><C-\><C-O><C-U>
    nnoremap <silent> <PageDown> <C-D><C-D>
    vnoremap <silent> <PageDown> <C-D><C-D>
    inoremap <silent> <PageDown> <C-\><C-O><C-D><C-\><C-O><C-D>

    " ctrl-h/l to switch between tabs
    nnoremap <c-h> :tabp<CR>
    nnoremap <c-l> :tabn<CR>

    " ctrl-j/k to switch between buffers
    nnoremap <c-k> :bn<cr>
    nnoremap <c-j> :bp<cr>

    " Fast window resizing
    if bufwinnr(1)
        map <c-up> <C-W>-
        map <c-down> <C-W>+
        map <c-left> <C-W><
        map <c-right> <C-W>>
    endif

    " p replace selection in visual mode
    vnoremap p "_dP

    " \b for blackhole register
    nnoremap <leader>b "_
    vnoremap <silent> <leader>b "_

    " \y and \p for clipboard yank/paste
    nnoremap <leader>y "*y
    vnoremap <leader>y "*y
    nnoremap <leader>p "*P
    vnoremap <leader>p "*P
    nnoremap <leader>Y "+y
    vnoremap <leader>Y "+y
    nnoremap <leader>P "+P
    vnoremap <leader>P "+P

    " \u \t toggle Gundo/Tagbar
    nnoremap <leader>u :GundoToggle<cr>
    nnoremap <leader>t :TagbarToggle<cr>

    " \r toggles relatie number
    nnoremap <leader>n :set relativenumber!<cr>

    " \sb toggles scrollbind
    nnoremap <leader>sb :ScrollbindToggle<cr>

    " \e \q \w \t
    nnoremap <leader>e :Explore<cr>
    nnoremap <leader>q :q<cr>
    nnoremap <leader>s :s%//<left>
    vnoremap <leader>s :s//<left>
    nnoremap Q :q<cr>
    nnoremap W :w<cr>
    nnoremap gb :CtrlPBuffer<cr>
    nnoremap go :CtrlP<cr>

    " open urls
    nnoremap <leader>o :py import webbrowser; webbrowser.open(<c-r>='"'.expand("<cWORD>").'"'<cr>)<cr>

    " Identify vim syntax highlight group under cursor
    map <leader>hi :echo "hi: " . synIDattr(synID(line("."),col("."),1),"name") . ', trans: '
                              \ . synIDattr(synID(line("."),col("."),0),"name") . ", lo: "
                              \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")<CR>
" }}}

" Cmdline Editing {{{
    cnoremap <C-A> <Home>
    cnoremap <C-E> <End>
    cnoremap <C-k> <Up>
    cnoremap <C-j> <Down>
    cnoremap <C-h> <Left>
    cnoremap <C-l> <Right>
" }}}

" Quickfix / location list {{{
    au Filetype qf setl nolist
    au Filetype qf setl nocursorline
    au Filetype qf setl nowrap
    nnoremap ]q :cnext<cr>
    nnoremap [q :cprevious<cr>
    nnoremap ]l :lnext<cr>
    nnoremap [l :lprevious<cr>
" }}}

" Vimdiff {{{
    set diffopt+=iwhite,context:3
    if &diff
        nmap u u :diffu<cr>
        nmap Q :qa<cr>
        nmap <leader>q :qa<cr>
    endif
" }}}

" vim: fdm=marker foldlevel=1 nofoldenable

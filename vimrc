" Author: Zach Kelling - http://twitter.com/zeekay
" Source: https://bitbucket.org/zeekay/dot-vim / https://github.com/zeekay/dot-vim

" Vundle {{{
    set nocompatible
    filetype off

    set rtp+=~/.vim/bundle/vundle
    call vundle#rc()

    " vundle - https://github.com/gmarik/vundle
    Bundle 'git://github.com/gmarik/vundle'
    " ctrlp - https://github.com/kien/ctrlp.vim
    Bundle 'git://github.com/kien/ctrlp.vim'
    " ack.vim - https://github.com/mileszs/ack.vim
    Bundle 'git://github.com/mileszs/ack.vim'
    " vim-repeat - https://github.com/tpope/vim-repeat
    Bundle 'git://github.com/tpope/vim-repeat'
    " vim-commentary - https://github.com/tpope/vim-commentary
    Bundle 'git://github.com/tpope/vim-commentary'
    " https://github.com/juanpabloaj/help.vim
    Bundle 'git://github.com/juanpabloaj/help.vim'
    " tagbar - https://github.com/majutsushi/tagbar
    Bundle 'git://github.com/majutsushi/tagbar'
    " gundo - https://github.com/sjl/gundo.vim
    Bundle 'git://github.com/sjl/gundo.vim'
    " syntastic - https://github.com/scrooloose/syntastic
    Bundle 'git://github.com/scrooloose/syntastic'
    " newcomplcache - https://github.com/Shougo/neocomplcache
    Bundle 'git://github.com/Shougo/neocomplcache'
    " newcomplcache-clang - https://github.com/Shougo/neocomplcache-clang
    Bundle 'git://github.com/Shougo/neocomplcache-clang'
    " newcomplcache-snippets-complete - https://github.com/Shougo/neocomplcache-snippets-complete
    Bundle 'git://github.com/Shougo/neocomplcache-snippets-complete'
    " clang_complete - https://github.com/Rip-Rip/clang_complete
    Bundle 'git://github.com/Rip-Rip/clang_complete'
    " neocomplcache-clang_complete - https://github.com/osyo-manga/neocomplcache-clang_complete
    Bundle 'git://github.com/osyo-manga/neocomplcache-clang_complete'
    " vim-coffees-script - https://github.com/kchmck/vim-coffee-script
    Bundle 'git://github.com/kchmck/vim-coffee-script'
    " vim-jade - https://github.com/digitaltoad/vim-jade.git
    Bundle 'git://github.com/digitaltoad/vim-jade'
    " vim-stylus - https://github.com/wavded/vim-stylus.git
    Bundle 'git://github.com/wavded/vim-stylus'
    " vim-html - https://github.com/tpope/vim-haml
    Bundle 'git://github.com/tpope/vim-haml'
    " https://github.com/lvivski/vim-css-color.git
    Bundle 'git://github.com/lvivski/vim-css-color.git'
    " vim-fugitive - https://github.com/tpope/vim-fugitive
    Bundle 'git://github.com/tpope/vim-fugitive'
    " vim-lawrencium - Fork of https://bitbucket.org/ludovicchabant/vim-lawrencium
    Bundle 'git@github.com:zeekay/vim-lawrencium.git'
    " vim-powerline - Fork of https://github.com/Lokaltog/vim-powerline
    Bundle 'git@github.com:zeekay/vim-powerline.git'
    " vim-space - Fork of https://github.com/spiiph/vim-space
    Bundle 'git@github.com:zeekay/vim-space.git'

    if version > 700
        " https://github.com/vim-scripts/VimClojure
        Bundle 'git://github.com/vim-scripts/VimClojure'
    endif

    if version > 700 && has('python')
        " vim-python - https://github.com/zeekay/vim-python-mode
        Bundle 'git@github.com:zeekay/vim-python-mode.git'
        " vim-virtualenv - Fork of https://github.com/jmcantrell/vim-virtualenv.git
        Bundle 'git@github.com:zeekay/vim-virtualenv.git'
    endif
" }}}

" Disabled bundles {{{
    " vim-ipython - Fork of https://github.com/ivanov/vim-ipython
    " Bundle 'git://github.com/zeekay/vim-ipython'
    " rope-omni - https://github.com/rygwdn/rope-omni.git
    " Bundle 'git://github.com/rygwdn/rope-omni'
    " supertab - https://github.com/ervandew/supertab
    " Bundle 'git://github.com/ervandew/supertab'
    " ultisnips - https://github.com/rygwdn/ultisnips
    " Bundle 'git://github.com/rygwdn/ultisnips'
    " pydoc.vim - Fork of https://github.com/fs111/pydoc.vim
    " Bundle 'git@github.com:zeekay/pydoc.vim'
    " vim-surround - https://github.com/tpope/vim-surround
    " Bundle 'git://github.com/tpope/vim-surround'
    " vim-easymotion - https://github.com/Lokaltog/vim-easymotion
    " Bundle 'git://github.com/Lokaltog/vim-easymotion'
    " chapa.vim - https://github.com/alfredodeza/chapa.vim
    " Bundle 'git://github.com/alfredodeza/chapa.vim'
    " tabular - https://github.com/godlygeek/tabular
    " Bundle 'git://github.com/godlygeek/tabular'
    " delimitMate - https://github.com/Raimondi/delimitMate
    " Bundle 'git://github.com/Raimondi/delimitMate'
    " AutoCloseTag - https://github.com/zeekay/vim-autoclose
    " Bundle 'git@github.com:zeekay/vim-autoclose'
    " SearchComplete - http://www.vim.org/scripts/script.php?script_id=474
    " Bundle 'SearchComplete'
" }}}

" Basic/General Configuration {{{
    syntax on
    filetype plugin indent on
    set directory=~/.vim/tmp/swap
    set backup
    set backupdir=~/.vim/tmp/backup
    set viewdir=~/.vim/tmp/view
    " set nomodeline
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
    " set clipboard=unnamed,unnamedplus
    set autoread
    set report=0
    " set gdefault
    set showcmd
    set noshowmode
    set virtualedit=block,onemore
    set switchbuf=usetab
    " set pumheight=10
    " set scrolloff=10
    " set sidescrolloff=20
    " set scrolljump=10
    set splitright
    set nomore
    if version > 720
        set undofile
        set undodir=~/.vim/tmp/undo
    endif
    " Disable folding
    " set foldminlines=99999
    " Save and load view for each document, preserving cursor position
    " au BufWinLeave * silent! mkview
    " au BufWinEnter * silent! loadview
    " Center text
    " au BufWinEnter * silent! normal zz
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

" Colors/Gui {{{
    " set fillchars+=vert:│
    set fillchars=
    if has("gui_running")
        if has('mac')
            " MacVim {{{
            set fuoptions=maxvert,maxhorz
            let macvim_hig_shift_movement = 1
            let macvim_skip_cmd_opt_movement = 1
            " set guifont=Dina-medium:h13
            " set guifont=Monaco:h12
            set guifont=Inconsolata:h14
            " change dir to open file
            lcd %:p:h
            set linespace=1
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
            " set guifont=MonteCarlo
            set guifont=Inconsolata\ 11
            " set guifont=Andale\ Mono\ 9
            " set guifont=Dejavu\ Sans\ Mono\ 9
            " }}}
        endif
        " Common gui settings {{{
        " set fillchars=diff:⣿
        " set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
        " set showbreak=↪
        set mouse=a
        set guioptions=ace
        colorscheme molokai
        " colorscheme pyte
        " colorscheme solarized
        " colorscheme proton
        " }}}
    else
        " Console {{{
        set ttyfast
        colorscheme hornet
        " }}}
    endif
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

" Netrw {{{
    let g:netrw_silent = 1
    let g:netrw_cursor = 0
    let g:netrw_banner = 0
    " let g:netrw_menu = 0
    " long listing style
    let g:netrw_liststyle = 1
    let g:netrw_list_hide='\.swp$,\.pyc$,\.pyo$,^\.hg$,^\$,^\.svn$,^\.o$,.Trash,.DS_Store,.CFUserTextEncoding'
" }}}

" neocomplcache {{{
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplcache.
    let g:neocomplcache_enable_at_startup = 1
    " Use smartcase.
    let g:neocomplcache_enable_smart_case = 1
    " Use camel case completion.
    let g:neocomplcache_enable_camel_case_completion = 1
    " Use underbar completion.
    " let g:neocomplcache_enable_underbar_completion = 1
    " Set minimum syntax keyword length.
    let g:neocomplcache_min_syntax_length = 3
    " let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
    let g:neocomplcache_source_disable = {'include_complete' : 1, 'filename_complete' : 1}

    " Define dictionary.
    let g:neocomplcache_dictionary_filetype_lists = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

    " Define keyword.
    if !exists('g:neocomplcache_keyword_patterns')
      let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    imap <C-s>     <Plug>(neocomplcache_snippets_expand)
    smap <C-s>     <Plug>(neocomplcache_snippets_expand)
    inoremap <expr><C-g>     neocomplcache#undo_completion()
    inoremap <expr><C-l>     neocomplcache#complete_common_string()

    " SuperTab like snippets behavior.
    " imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ?
                     " \ "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
    " imap  <silent><expr><tab> neocomplcache#sources#snippets_complete#expandable() ?
                     " \ "\<plug>(neocomplcache_snippets_expand)" : (pumvisible() ? "\<c-e>" : "\<tab>")
    " smap  <tab>  <right><plug>(neocomplcache_snippets_jump)
    " inoremap <expr><c-e>     neocomplcache#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplcache#close_popup()
    inoremap <expr><C-e>  neocomplcache#cancel_popup()

    " AutoComplPop like behavior.
    " let g:neocomplcache_enable_auto_select = 1

    " Shell like behavior(not recommended).
    " set completeopt+=longest
    " let g:neocomplcache_enable_auto_select = 1
    " let g:neocomplcache_disable_auto_complete = 1
    " inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
    " inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

    " Enable heavy omni completion.
    if !exists('g:neocomplcache_omni_patterns')
      let g:neocomplcache_omni_patterns = {}
    endif
    " let g:neocomplcache_omni_patterns.python = '[^. *\t]\.\w*\'
    let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
    let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.go = '\h\w*\%.'

" }}}

" Ack.vim {{{
    let g:ackprg="ack -H --nocolor --nogroup --column"

    function! s:CopyMotionForType(type)
        if a:type ==# 'v'
            silent execute "normal! `<" . a:type . "`>y"
        elseif a:type ==# 'char'
            silent execute "normal! `[v`]y"
        endif
    endfunction

    function! s:AckMotion(type) abort
        let reg_save = @@

        call s:CopyMotionForType(a:type)

        execute "normal! :Ack! --literal " . shellescape(@@) . "\<cr>"

        let @@ = reg_save
    endfunction

    nnoremap <leader>a :Ack<space>
    " nnoremap <silent> <leader>a :set opfunc=<SID>AckMotion<CR>g@
    xnoremap <silent> <leader>a :<C-U>call <SID>AckMotion(visualmode())<CR>
" }}}

" Gundo {{{
    " nnoremap <F11> :GundoToggle<CR>
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
    " If using html auto complete (complete closing tag)
    " au FileType xml,html,xhtml let b:delimitMate_matchpairs = "(:),[:],{:}"
" }}}

" AutoCloseTag {{{
    " Make it so AutoCloseTag works for xml and xhtml files as well
    au FileType xhtml,xml ru ftplugin/html/autoclosetag.vim
" }}}

" EasyMotion {{{
    let g:EasyMotion_keys = ";,.pyfgcrl/aoeuidhtns-'qjkxbmwvz"
" }}}

" Tagbar {{{
    let g:tagbar_width = 50
    " let g:tagbar_autoclose = 1
    let g:tagbar_autofocus = 1
    let g:tagbar_compact = 1
    let g:tagbar_ctags_bin = 'ctags'
    let g:tagbar_expand = 1
    " if you want your tags to include vars/objects do:
    " coffeetags --vim-conf --include-vars
     let g:tagbar_type_coffee = {
      \ 'kinds' : [
      \   'f:functions',
      \   'o:object'
      \ ],
      \ 'kind2scope' : {
      \  'f' : 'object',
      \   'o' : 'object'
      \},
      \ 'sro' : ".",
      \ 'ctagsbin' : 'coffeetags',
      \ 'ctagsargs' : ' ',
      \}
" }}}

" vim-commentary {{{
    au FileType cfg set commentstring=#\ %s
    au FileType cpp set commentstring=/\/\ %s
    au FileType python set commentstring=#\ %s
    au FileType lisp set commentstring=;;\ %s
" }}}

" Syntastic {{{
    " reorder runtimepath so my custom syntax plugins are used
    set rtp-=~/.vim/bundle/syntastic
    set rtp+=~/.vim/syntastic,~/.vim/bundle/syntastic
    let g:syntastic_enable_signs = 1
    let g:syntastic_auto_loc_list = 0
    let g:syntastic_python_checker = 'flake8 --ignore=E221,E225,E231,E251,E302,E303,W391,E501,E702'
    let g:syntastic_javascript_checker = 'jslint'
    let g:syntastic_enable_highlighting = 0
    let g:syntastic_stl_format = '⚡ %E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w} ⚡'
" }}}

" UltiSnips {{{
    let g:UltiSnipsSnippetDirectories=["UltiSnips"]
    let g:UltiSnipsExpandTrigger = '<tab>'
    " let g:UltiSnipsListSnippets = '<c-s>'
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
    " let g:UltiSnipsJumpForwardTrigger = '<c-j>'
    " let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
" }}}

" SuperTab {{{
    " let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
    let g:SuperTabDefaultCompletionType = "context"
    let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
    let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
    let g:SuperTabContextDiscoverDiscovery =
        \ ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]
    let g:SuperTabMappingForward = '<tab>'
    let g:SuperTabMappingBackward = '<s-tab>'
    " let g:SuperTabMappingForward = '<c-j>'
    " let g:SuperTabMappingBackward = '<c-k>'
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
    let g:virtualenv_stl_format = '%n'
    if $VIRTUAL_ENV
        let g:virtualenv_auto_activate = 1
    endif
    " Python highlighting
    let g:python_highlight_all = 1
    let g:python_show_sync = 1
    let g:python_print_as_function = 1
    " let g:pythonmode_enable_rope = 1
    " let ropevim_vim_completion = 1
    " let ropevim_extended_complete = 1
    au FileType python setlocal foldmethod=syntax
" }}}

" CoffeeScript {{{
    au Filetype coffee setlocal foldmethod=indent nofoldenable
    au FileType coffee map <leader>r :CoffeeRun<cr>
    au FileType coffee map <leader>c :CoffeeCompile watch vertical<cr>
    au FileType coffee imap <leader>r <c-o>:CoffeeRun<cr>
    au FileType coffee imap <leader>c <c-o>:CoffeeCompile watch vertical<cr>
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

    " ctrl+w switch window in insert mode
    inoremap <c-w> <c-o><c-w>

    " ctrl-h/l to switch between tabs
    nnoremap <c-h> :tabp<CR>
    nnoremap <c-l> :tabn<CR>
    inoremap <c-h> <c-o>:tabp<CR>
    inoremap <c-l> <c-o>:tabn<CR>

    " ctrl-j/k to switch between buffers
    nnoremap <c-k> :bn<cr>
    nnoremap <c-j> :bp<cr>
    inoremap <c-k> <c-o>:bn<cr>
    inoremap <c-j> <c-o>:bp<cr>

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

    " \u \t toggle Gundo/Tagbar
    nnoremap <leader>u :GundoToggle<cr>
    nnoremap <leader>t :TagbarToggle<cr>

    " \r toggles relatie number
    nnoremap <leader>n :set relativenumber!<cr>

    " \sb toggles scrollbind
    nnoremap <leader>sb :ScrollBindToggle<cr>

    " \e \q \w \t
    nnoremap <leader>e :ExploreToggle<cr>
    nnoremap <leader>q :q<cr>
    nnoremap <leader>w <c-w>
    nnoremap <leader>s :s%//<left>
    vnoremap <leader>s :s//<left>
    nnoremap Q :q<cr>
    nnoremap W :w<cr>
    nnoremap gb :CtrlPBuffer<cr>
    nnoremap go :CtrlP<cr>

    " open urls
    nnoremap <leader>o :silent !open -a "Google Chrome" <c-r>=expand("<cWORD>")<cr><cr>:redraw!<cr>

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

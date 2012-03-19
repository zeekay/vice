" Author: Zach Kelling
" Source: https://bitbucket.org/zeekay/dot-vim / https://github.com/zeekay/dot-vim

" Plugins {{{
    let addons = [
        \ 'github:MarcWeber/vim-addon-manager',
        \ 'github:juanpabloaj/help.vim',
        \ 'github:kien/ctrlp.vim',
        \ 'github:mattn/gist-vim',
        \ 'github:mileszs/ack.vim',
        \ 'github:scrooloose/nerdtree',
        \ 'github:scrooloose/syntastic',
        \ 'github:tpope/vim-commentary',
        \ 'github:tpope/vim-eunuch',
        \ 'github:tpope/vim-fugitive',
        \ 'github:tpope/vim-repeat',
        \ 'github:zeekay/vim-space',
        \ 'hg:https://bitbucket.org/sjl/badwolf',
        \ 'hg:https://bitbucket.org/sjl/gundo.vim',
        \ 'hg:https://bitbucket.org/zeekay/vim-lawrencium',
        \ 'hg:https://bitbucket.org/zeekay/vim-powerline-custom',
        \ 'hg:https://bitbucket.org/zeekay/vimtips',
    \ ]

    if version > 702
        let addons += [
            \ 'github:Shougo/neocomplcache',
            \ 'github:Shougo/neocomplcache-snippets-complete',
            \ 'github:majutsushi/tagbar',
        \ ]
    endif

    " Filetype-specific addons
    let ft_addons = {
        \ 'c':          ['github:Rip-Rip/clang_complete', 'github:osyo-manga/neocomplcache-clang_complete'],
        \ 'clojure':    ['hg:https://bitbucket.org/sjl/slimv'],
        \ 'coffee':     ['github:kchmck/vim-coffee-script'],
        \ 'cpp':        ['github:Rip-Rip/clang_complete', 'github:osyo-manga/neocomplcache-clang_complete'],
        \ 'css':        ['github:Rykka/ColorV', 'github:lvivski/vim-css-color'],
        \ 'haml':       ['github:tpope/vim-haml'],
        \ 'haskell':    ['github:ujihisa/neco-ghc', 'hg:https://bitbucket.org/zeekay/haskellmode-vim'],
        \ 'html':       ['github:othree/html5.vim', 'github:gregsexton/MatchTag'],
        \ 'jade':       ['github:digitaltoad/vim-jade'],
        \ 'javascript': ['github:pangloss/vim-javascript'],
        \ 'python':     ['hg:https://bitbucket.org/zeekay/python.vim'],
        \ 'sass':       ['github:Rykka/ColorV', 'github:lvivski/vim-css-color'],
        \ 'stylus':     ['github:Rykka/ColorV', 'github:lvivski/vim-css-color', 'github:wavded/vim-stylus'],
        \ 'xml':        ['github:othree/xml.vim', 'github:gregsexton/MatchTag'],
    \ }

    if version > 702 && has('python')
        let addons += ['hg:https://bitbucket.org/zeekay/vim-python-mode']
    endif

    " Must add vim-powerline last, so my customizations are sourced first.
    let addons += ['github:Lokaltog/vim-powerline']

    " This are no longer used regularly, but kept around for convenience.
    let exiled_plugins = [
        \ 'github:Lokaltog/vim-easymotion',
        \ 'github:Raimondi/delimitMate',
        \ 'github:junegunn/tabular',
    \ ]

    if has('win32') || ('win64')
        let $VIMHOME = expand('~/vimfiles')
    else
        let $VIMHOME = expand('~/.vim')
    endif

    let &runtimepath.=','.$VIMHOME.expand('/addons/vim-addon-manager')
    call vam#ActivateAddons(addons, {'auto_install': 1})
    au FileType * for l in values(filter(copy(ft_addons), string(expand('<amatch>')).' =~ v:key')) | call vam#ActivateAddons(l, {'auto_install': 1, 'force_loading_plugins_now': 1}) | endfor
" }}}

" Basic/General Configuration {{{
    set nocompatible
    syntax on
    filetype indent plugin on
    set backupdir=$VIMHOME/tmp/backup
    set backup
    silent! set undofile
    silent! set undodir=$VIMHOME/tmp/undo
    set directory=$VIMHOME/tmp/swap
    set viewdir=$VIMHOME/tmp/view
    let &viminfo="'100,\"100,:100,h,n".expand($VIMHOME.'/tmp/viminfo')
    set undolevels=100
    set history=1000
    set autochdir
    set backspace=indent,eol,start
    set matchpairs+=<:>
    set shortmess=aoOsTI
    set hidden
    set confirm
    set fileformat=unix
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
    set nomore
    " set clipboard=unnamed,unnamedplus
    " set foldminlines=99999
    silent! set breakindent
" }}}

" Indent {{{
    set tabstop=4
    set shiftwidth=4
    set expandtab
    set smarttab
    set smartindent
    au FileType javascript,xml,xhtml,html,htmldjango set shiftwidth=4
    au FileType coffee,haml,stylus,jade set shiftwidth=2
" }}}

" Search/Highlight {{{
    set showmatch
    set incsearch
    set ignorecase
" }}}

" Menu/Complete {{{
    set completeopt=menuone,menu,longest
    set wildmenu
    set wildmode=list:longest,full
    set wildignore+=*.DS_Store                       " OSX bullshit
    set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
    set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
    set wildignore+=*.luac                           " Lua byte code
    set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
    set wildignore+=*.orig                           " Merge resolution files
    set wildignore+=*.pyc,*.pyo                      " Python byte code
    set wildignore+=*.spl                            " compiled spelling word lists
    set wildignore+=*.sw?                            " Vim swap files
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*        " Version control - Linux/MacOSX
    set wildignore+=.git\*,.hg\*,.svn\*              " Version control - Windows
    set wildignore+=classes                          " Clojure/leiningen
    set wildignore+=migrations                       " Django migrations
    set wildignore+=*.zwc,*.zwc.old                  " ZSH
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

" Console {{{
    colorscheme hornet
    set ttyfast
    set mouse=a
" }}}

" Gui {{{
    if has('gui_running')
        colorscheme molokai
        set guioptions=ace
        set fillchars=diff:⣿
        set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
        " set showbreak=↪
    endif
" }}}

" MacVim {{{
    if has("gui_running") && has('mac')
        let $PATH='~/.bin:/usr/local/bin:/usr/local/share/python:/usr/bin:/bin'
        set macmeta
        set fuoptions=maxvert,maxhorz
        let g:macvim_hig_shift_movement = 1
        let g:macvim_skip_cmd_opt_movement = 1
        set guifontwide=DejaVu\ Sans\ Mono:h11
        set guifont=Inconsolata:h14
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
    endif
" }}}

" Linux gVim {{{
    if has('gui_running') && !has('mac') && !has('win32') && !has('win64')
        set guifont=DejaVu\ Sans\ Mono\ 8
    endif
" }}}

" Windows gVim {{{
    if has('gui_running') && has('win32') || has('win64')
        set guifont=Consolas
    endif
" }}}

" Statusline / Powerline {{{
    set laststatus=2
    set statusline=\(%n\)\ %f\ %*%#Modified#%m\ (%l/%L,\ %c)\ %P%=%h%w\ %y\ [%{&encoding}:%{&fileformat}]
    let g:Powerline_symbols_override = {
        \ 'BRANCH': [0x2213],
        \ 'LINE': 'LN',
        \ }
    let g:Powerline_dividers_override = ['', '/', '', '/']
    call Pl#Theme#InsertSegment('lawrencium:branch', 'after', 'fugitive:branch')
" }}}

" EasyMotion {{{
    let g:EasyMotion_keys = ";,.pyfgcrl/aoeuidhtns-'qjkxbmwvz"
    let g:EasyMotion_leader_key = '<Leader>e'
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
    if has('win32') || has('win64')
        let g:ackprg="ack.bat -i -H --nocolor --nogroup --column --text"
    else
        let g:ackprg="ack -i -H --nocolor --nogroup --column --text"
    endif
    nnoremap <leader>a :Ack!<space>
" }}}

" Commentary {{{
    au FileType cfg set commentstring=#\ %s
    au FileType cpp set commentstring=/\/\ %s
    au FileType python set commentstring=#\ %s
    au FileType lisp set commentstring=;;\ %s
" }}}

" CtrlP {{{
    " let g:ctrlp_user_command = 'find %s -type f'       " MacOSX/Linux
    let g:ctrlp_map = "go"
    " nnoremap <c-b> :CtrlPBuffer<cr>
    let g:ctrlp_jump_to_buffer = 2
    let g:ctrlp_working_path_mode = 2
    let g:ctrlp_use_caching = 1
    let g:ctrlp_clear_cache_on_exit = 1
    let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files']
    let g:ctrlp_user_command = ['.hg/', 'hg --cwd %s locate --fullpath -I .']
    let g:ctrlp_open_new_file = 1
    let g:ctrlp_cache_dir = expand($VIMHOME."/tmp/ctrlp_cache")
    let g:ctrlp_open_multi = '1t'
" }}}

" delimitMate {{{
    let g:delimitMate_expand_cr = 1
    let g:delimitMate_expand_space = 1
    let g:delimitMate_balance_matchpairs = 1
    let g:delimitMate_excluded_ft = "mail,help"
    au FileType * let b:delimitMate_autoclose = 1
" }}}

" Gundo {{{
    let g:gundo_help = 0
    let g:gundo_right = 1
    let g:gundo_width = 50
" }}}

" Nerdtree {{{
    "" Auto open nerd tree on startup
    let g:nerdtree_tabs_open_on_gui_startup = 0
    " Focus in the main content window
    let g:nerdtree_tabs_focus_on_files = 1
    " Make nerdtree look nice
    let g:NERDTreeMinimalUI = 1
    let g:NERDTreeDirArrows = 1
    let g:NERDTreeWinSize = 30
    let g:NERDTreeMouseMode = 3
    let g:NERDTreeCaseSensitiveSort = 1
" }}}

" Tabularize {{{
    vnoremap <silent> <Leader>t> :Tabularize /=><CR>
    vnoremap <silent> <Leader>t= :Tabularize /=<CR>
    vnoremap <silent> <Leader>t, :Tabularize /,<CR>
" }}}

" Tagbar {{{
    let g:tagbar_singleclick = 1
    let g:tagbar_width = 50
    let g:tagbar_autofocus = 1
    let g:tagbar_compact = 1
    let g:tagbar_ctags_bin = 'ctags'
    let g:tagbar_expand = 1
    let g:tagbar_iconchars = ['▸','▾']

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

" Syntastic {{{
    let g:syntastic_enable_signs = 1
    let g:syntastic_auto_loc_list = 0
    let g:syntastic_python_checker = 'flake8'
    let g:syntastic_python_checker_args = '--ignore=E221,E225,E231,E251,E302,E303,W391,E501,E702'
    let g:syntastic_javascript_checker = 'jslint'
    let g:syntastic_enable_highlighting = 0
    let g:syntastic_stl_format = '⚡ %E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w} ⚡'
" }}}

" Eclim {{{
    let g:EclimDisabled = 1
    let g:EclimTaglistEnabled = 0
" }}}

" Filetypes {{{
    au BufNewFile,BufRead *.haml set filetype=haml
    au BufNewFile,BufRead *.jade set filetype=jade
    au BufNewFile,BufRead *.sass set filetype=sass
    au BufNewFile,BufRead *.scss set filetype=scss
    au BufNewFile,BufRead *.styl set filetype=stylus
    au BufNewFile,BufRead *.coffee set filetype=coffee
" }}}

" Clojure/ClojureScript {{{
    augroup ft_clojure
        au!

        au FileType clojure compiler clojure
        au FileType clojure setlocal report=100000

        au BufWinEnter            SLIMV.REPL setlocal winfixwidth nolist
        au BufNewFile,BufReadPost SLIMV.REPL nnoremap <buffer> A GA
        au BufNewFile,BufReadPost SLIMV.REPL nnoremap <buffer> <localleader>R :emenu REPL.<Tab>

        " Fix the eval mappings.
        au FileType clojure nnoremap <buffer> <localleader>ef :<c-u>call SlimvEvalExp()<cr>
        au FileType clojure nnoremap <buffer> <localleader>ee :<c-u>call SlimvEvalDefun()<cr>

        " And the inspect mapping.
        au FileType clojure nmap <buffer> \i \di

        " Indent top-level form.
        au FileType clojure nmap <buffer> <localleader>= v((((((((((((=%
    augroup END

    augroup ft_clojurescript
        au!
        au BufNewFile,BufRead *.cljs set filetype=clojurescript
    augroup END

    " VimClojure {{{
        let g:vimclojure#SplitPos = "left"
        let g:vimclojure#HighlightBuiltins = 1
        let g:vimclojure#HighlightContrib = 1
        let g:vimclojure#ParenRainbow = 1
        let g:vimclojure#DynamicHighlighting = 1
        if executable('ng')
            let g:vimclojure#WantNailgun = 1
        endif
    " }}}

    " SlimV {{{
        let g:slimv_leader = '\'
        let g:slimv_keybindings = 2
        let g:slimv_repl_name = 'SLIMV.REPL'
        let g:slimv_repl_split = 4
        let g:slimv_repl_syntax = 1
        let g:slimv_repl_wrap = 0

        " Use a swank command that works, and doesn't require new app windows.
        let g:slimv_swank_clojure = '!dtach -n /tmp/dtach-swank.sock -r winch lein swank'
    " }}}

" }}}

" CoffeeScript {{{
    au FileType coffee setlocal foldmethod=indent nofoldenable
    au FileType coffee map <leader>r :CoffeeRun<cr>
    au FileType coffee map <leader>c :CoffeeCompile watch vertical<cr>
    au FileType coffee imap <leader>r <c-o>:CoffeeRun<cr>
    au FileType coffee imap <leader>c <c-o>:CoffeeCompile watch vertical<cr>
" }}}

" Haskell {{{
    let g:haddock_browser="open"
" }}}

" Javascript {{{
    if executable('node')
        " Run current file in node for quick evaluation
        function! s:RunInNode()
            w
            !node %
        endfunction
        au FileType javascript command! RunInNode call s:RunInNode()
        au FileType javascript map <leader>r :RunInNode<cr>
    endif

    if executable('bebop') && has('python')
        " Use Bebop javascript completion and eval
        py import bebop.vimbop, vim

        function! BebopComplete(findstart, base)
            if a:findstart
                let line = getline('.')
                let start = col('.') - 1
                while start >= 0 && line[start - 1] =~ '\k'
                    let start -= 1
                endwhile
                return start
            else
                py vim.command('return ' + bebop.vimbop.complete(vim.eval('a:base')))
            endif
        endfunction

        au FileType javascript setlocal omnifunc=BebopComplete
        au FileType javascript command! -nargs=* BebopEval     py bebop.vimbop.eval_js(<f-args>)
        au FileType javascript command! -nargs=0 BebopEvalLine   py bebop.vimbop.eval_line()
        au FileType javascript command! -nargs=0 BebopEvalBuffer py bebop.vimbop.eval_buffer()
        au FileType javascript nnoremap <leader>ee :BebopEval<space>
        au FileType javascript nnoremap <leader>el :BebopEvalLine<cr>
        au FileType javascript vnoremap <leader>er :py bebop.vimbop.eval_range()<cr>
        au FileType javascript nnoremap <leader>eb :BebopEvalBuffer<cr>
    endif
" }}}

" Markdown {{{
    autocmd BufNewFile,BufRead *.{md,mkd,mkdn,mark*} set filetype=markdown
" }}}

" Python {{{
    let g:virtualenv_directory = expand($HOME."/ve")
    let g:python_highlight_all = 1
    let g:python_show_sync = 1
    let g:python_print_as_function = 1
    let g:pythonmode_enable_django = 1
    let g:pythonmode_enable_rope = 0
    let g:ropevim_vim_completion = 1
    let g:ropevim_extended_complete = 1
    " au FileType python setlocal foldmethod=syntax
" }}}

" VimL {{{
    au FileType vim nnoremap <leader>r :w<cr> <bar> :so %<cr>
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

" Mapping {{{
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
    inoremap <c-w> <c-o><c-w>

    " J/K move up down half pages
    nnoremap J <C-D>
    nnoremap K <C-U>
    vnoremap J <C-D>
    vnoremap K <C-U>

    " make pageup/pagedown move up/down half pages
    nnoremap <silent> <PageUp>   <C-U><C-U>
    vnoremap <silent> <PageUp>   <C-U><C-U>
    inoremap <silent> <PageUp>   <C-\><C-O><C-U><C-\><C-O><C-U>
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
        map <c-up>    <C-W>-
        map <c-down>  <C-W>+
        map <c-left>  <C-W><
        map <c-right> <C-W>>
    endif

    " p replace selection in visual mode
    vnoremap p "_dP

    " \b for blackhole register
    nnoremap <leader>b "_
    vnoremap <silent> <leader>b "_

    " Buffer mappings {{{
    nnoremap <silent> <Leader>d :bd<CR>

    " Quick edit .vimrc {{{
    " nnoremap <silent> <Leader>ev :edit $MYVIMRC<CR>
    " nnoremap <silent> <Leader>sv :source $MYVIMRC<CR>

    " close html tags
    inoremap \c </<c-x><c-o>

    " \y and \p for clipboard yank/paste
    nnoremap <leader>y "*y
    vnoremap <leader>y "*y
    " nnoremap <leader>p "*P
    " vnoremap <leader>p "*P
    nnoremap <leader>Y "+y
    vnoremap <leader>Y "+y
    nnoremap <leader>P "+P
    vnoremap <leader>P "+P

    "\e \u \t toggles
    nnoremap <leader>u :GundoToggle<cr>
    nnoremap <leader>t :TagbarToggle<cr>
    nnoremap <leader>n :NERDTreeToggle<cr>

    " \n toggles relatie number
    nnoremap <leader>rn :set relativenumber!<cr>

    " \e \q \w \t
    nnoremap <leader>q :q<cr>
    nnoremap <leader>ww <c-w><c-w>
    nnoremap <leader>ws <c-w>s
    nnoremap <leader>wv <c-w>v
    nnoremap <leader>wn <c-w>n
    nnoremap <leader>wh <c-w>h
    nnoremap <leader>wj <c-w>j
    nnoremap <leader>wk <c-w>k
    nnoremap <leader>wl <c-w>l
    " nnoremap <leader>s :s%//<left>
    " vnoremap <leader>s :s//<left>
    nnoremap <leader>d :bd<cr>
    nnoremap Q :q<cr>
    nnoremap W :w<cr>
    nnoremap gb :CtrlPBuffer<cr>
    nnoremap go :CtrlP<cr>

    " open things
    nnoremap <leader>ow :py import webbrowser; webbrowser.open(<c-r>='"'.expand("<cWORD>").'"'<cr>)<cr>
    nnoremap <leader>of :py import webbrowser; webbrowser.open(<c-r>='"'.'file://'.expand('%:p').'"'<cr>)<cr>

    " Identify vim syntax highlight group under cursor
    map <leader>hi :echo "hi: " . synIDattr(synID(line("."),col("."),1),"name") . ', trans: '
                              \ . synIDattr(synID(line("."),col("."),0),"name") . ", lo: "
                              \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")<CR>
    " Cmdline
    cnoremap <C-A> <Home>
    cnoremap <C-E> <End>
    cnoremap <C-k> <Up>
    cnoremap <C-j> <Down>
    cnoremap <C-h> <Left>
    cnoremap <C-l> <Right>
" }}}

" Diff {{{
    set diffopt+=iwhite,context:3
    if &diff
        nmap u u :diffu<cr>
        nmap Q :qa<cr>
        nmap <leader>q :qa<cr>
    endif
" }}}

" Quickfix / location list {{{
    au FileType qf setl nolist
    au FileType qf setl nocursorline
    au FileType qf setl nowrap
    nnoremap ]q :cnext<cr>
    nnoremap [q :cprevious<cr>
    nnoremap ]l :lnext<cr>
    nnoremap [l :lprevious<cr>
" }}}

" vim: fdm=marker foldlevel=1 nofoldenable

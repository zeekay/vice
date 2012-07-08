" Author: Zach Kelling
" Source: bitbucket.org/zeekay/dot-vim || github.com/zeekay/dot-vim

" Plugins {{{
    let addons = [
        \ 'github:MarcWeber/vim-addon-manager',
        \ 'github:int3/vim-extradite',
        \ 'github:juanpabloaj/help.vim',
        \ 'github:kien/ctrlp.vim',
        \ 'github:mattn/gist-vim',
        \ 'github:mattn/webapi-vim',
        \ 'github:mileszs/ack.vim',
        \ 'github:scrooloose/nerdtree',
        \ 'github:scrooloose/syntastic',
        \ 'github:sjl/gundo.vim',
        \ 'github:tpope/vim-commentary',
        \ 'github:tpope/vim-eunuch',
        \ 'github:tpope/vim-fugitive',
        \ 'github:tpope/vim-git',
        \ 'github:tpope/vim-repeat',
        \ 'github:tpope/vim-speeddating',
        \ 'github:vim-scripts/AnsiEsc.vim',
        \ 'github:zeekay/vim-lawrencium',
        \ 'github:zeekay/vim-powerline-custom',
        \ 'github:zeekay/vim-space',
        \ 'github:zeekay/vimtips',
    \ ]

    " Ensure vim-powerline-custom is sourced before vim-powerline
    let addons += ['github:Lokaltog/vim-powerline']

    if version > 702
        let addons += ['github:Shougo/neocomplcache']
    endif

    if version > 702 && executable('ctags')
        let addons += ['github:majutsushi/tagbar']
    endif

    if version > 702 && has('python')
        let addons += ['github:SirVer/ultisnips']
    endif

    " filetype-specific addons
    let ft_addons = {
        \ 'actionscript': [
            \ 'github:endel/actionscript.vim',
            \ ],
        \ 'c$\|cpp': [
            \ 'github:Rip-Rip/clang_complete',
            \ 'github:osyo-manga/neocomplcache-clang_complete',
            \ ],
        \ 'css\|sass\|scss\|stylus': [
            \ 'github:hail2u/vim-css3-syntax',
            \ 'github:Rykka/colorv.vim',
            \ 'github:skammer/vim-css-color',
            \ ],
        \ 'clojure': [
            \ 'github:zeekay/VimClojure-custom',
            \ 'github:vim-scripts/VimClojure',
            \ ],
        \ 'coffee': [
            \ 'github:kchmck/vim-coffee-script',
            \ ],
        \ 'haml\|sass\|scss': [
            \ 'github:tpope/vim-haml',
            \ ],
        \ 'haskell': [
            \ 'github:zeekay/haskellmode-vim',
            \ 'github:ujihisa/neco-ghc',
            \ ],
        \ 'html\|xml': [
            \ 'github:gregsexton/MatchTag',
            \ 'github:othree/html5.vim',
            \ 'github:zeekay/xml.vim',
            \ ],
        \ 'jade': [
            \ 'github:digitaltoad/vim-jade',
            \ ],
        \ 'javascript': [
            \ 'github:pangloss/vim-javascript',
            \ 'github:zeekay/vim-js2coffee',
            \ ],
        \ 'javascript\|python': [
            \ 'github:alfredodeza/chapa.vim',
            \ ],
        \ 'python': [
            \ 'github:zeekay/python.vim',
            \ ],
        \ 'stylus': [
            \ 'github:wavded/vim-stylus',
            \ ],
    \ }

    if has('python')
        let ft_addons['coffee\|javascript\|css\|html\|jade\|stylus'] = ['github:zeekay/vim-bebop']
        let ft_addons['python'] += ['github:zeekay/vim-python']
    endif

    if has('win32') || has('win64')
        let $VIMHOME = expand('~/vimfiles')
    else
        let $VIMHOME = expand('~/.vim')
    endif

    let &runtimepath.=','.$VIMHOME.'/addons/vim-addon-manager'

    func! vam#PluginDirFromName(name)
        return $VIMHOME.'/addons/'.split(a:name, '/')[-1]
    endf

    func! ActivateFtAddons(ft_addons, ft)
        for l in values(filter(copy(a:ft_addons), string(a:ft).' =~ v:key'))
            call vam#ActivateAddons(l, {'auto_install': 1, 'force_loading_plugins_now': 1})
        endfor
    endf

    call vam#ActivateAddons(addons, {'auto_install': 1})
    au FileType * call ActivateFtAddons(ft_addons, expand('<amatch>'))
" }}}

" Basic/General Configuration {{{
    set nocompatible
    syntax on
    filetype indent plugin on
    set backupdir=$VIMHOME/tmp/backup
    set backup
    silent! set undofile
    silent! set undodir=$VIMHOME/tmp/undo
    " set directory=$VIMHOME/tmp/swap
    set noswapfile
    set viewdir=$VIMHOME/tmp/view
    let &viminfo="'100,\"100,:100,h,n".expand($VIMHOME.'/tmp/viminfo')
    set undolevels=100
    set history=1000
    " set autochdir
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
    set nowrap
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
    set nrformats=hex,octal,alpha
    " set clipboard=unnamed,unnamedplus
    " set foldminlines=99999
    silent! set breakindent
" }}}

" Indent {{{
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4
    set expandtab
    set smarttab
    set smartindent
    au FileType xml,xhtml,htmldjango set shiftwidth=4
    au FileType html,coffee,haml,stylus,jade,javascript set shiftwidth=2
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
    set wildignore+=*.DS_Store " OSX bullshit
    set wildignore+=*.aux,*.out,*.toc " LaTeX intermediate files
    set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg " binary images
    set wildignore+=*.luac " Lua byte code
    set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
    set wildignore+=*.orig " Merge resolution files
    set wildignore+=*.pyc,*.pyo " Python byte code
    set wildignore+=*.spl " compiled spelling word lists
    set wildignore+=*.sw?  " Vim swap files
    set wildignore+=*/.svn/* " SVN Version control - Linux/MacOSX
    set wildignore+=.svn\* " SVN Version control - Windows
    set wildignore+=classes " Clojure/leiningen
    set wildignore+=migrations " Django migrations
    set wildignore+=*.zwc,*.zwc.old " ZSH
" }}}

" Enable omnicomplete {{{
    au FileType python setlocal omnifunc=pythoncomplete#Complete
    au FileType javascript,coffee setlocal omnifunc=javascriptcomplete#CompleteJS
    au FileType html setlocal omnifunc=htmlcomplete#CompleteTags
    au FileType css setlocal omnifunc=csscomplete#CompleteCSS
    au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    au FileType php setlocal omnifunc=phpcomplete#CompletePHP
    au FileType c setlocal omnifunc=ccomplete#Complete
    au FileType cpp setlocal omnifunc=omni#cpp#complete#Main
    au FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
" }}}

" Console {{{
    set t_Co=256
    colorscheme hornet
    set ttyfast
" }}}

" Gui {{{
    if has('gui_running')
        colorscheme molokai
        set guioptions=ace
        set fillchars=diff:⣿
        set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
    endif
" }}}

" MacVim {{{
    if has("gui_running") && has('mac')
        set macmeta
        set fuoptions=maxvert,maxhorz
        let g:macvim_hig_shift_movement = 1
        let g:macvim_skip_cmd_opt_movement = 1
        set guifont=Inconsolata:h14
        " set linespace=1
        set transparency=3
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
        nnoremap <D-CR> :set fullscreen!<cr>
        nnoremap <D-d> :vsplit<cr>
        nnoremap <D-D> :split<cr>
        nnoremap <D-[> <c-w>W
        nnoremap <D-]> <c-w>w
        let $PATH=substitute('~/.cabal/bin:~/Library/Haskell/bin:/usr/local/share/ruby:/usr/local/share/python:~/.zsh/plugins/osx/lib:/usr/sbin:~/.dotfiles/scripts:~/.bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Developer/usr/bin:~/.zsh/plugins/clojure/bin', '\~', $HOME, 'g')
        let $NODE_PATH='/usr/local/lib/jsctags/:'.$NODE_PATH
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
        cd ~
    endif
" }}}

" Statusline / Powerline {{{
    set laststatus=2
    set statusline=\(%n\)\ %f\ %*%#Modified#%m\ (%l/%L,\ %c)\ %P%=%h%w\ %y\ [%{&encoding}:%{&fileformat}]
    let g:Powerline_symbols_override = {
        \ 'FUGITIVE': '∓ ',
        \ 'LAWRENCIUM': '☿ ',
    \ }

    let g:Powerline_dividers_override = ['', '⏐', '', '⏐']
    call Pl#Theme#InsertSegment('lawrencium:branch', 'after', 'fugitive:branch')
" }}}

" EasyMotion {{{
    let g:EasyMotion_keys = ";,.pyfgcrl/aoeuidhtns-'qjkxbmwvz"
    let g:EasyMotion_leader_key = '<leader>e'
" }}}

" Extradite {{{
    let g:extradite_showhash = 1
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
        let g:neocomplcache_source_disable = {'include_complete' : 1, 'filename_complete' : 0, 'snippets_complete': 1}
        let g:neocomplcache_snippets_disable_runtime_snippets = 1

        " Define keyword.
        if !exists('g:neocomplcache_keyword_patterns')
          let g:neocomplcache_keyword_patterns = {}
        endif
        let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

        " this makes tab cycle through all the completion options
        inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
        " <CR>: close popup and save indent.
        inoremap <expr><CR> pumvisible() ? neocomplcache#smart_close_popup()."\<CR>" : "\<CR>"
        " <C-h>, <BS>: close popup and delete backword char.
        inoremap <expr><BS> pumvisible() ? neocomplcache#smart_close_popup()."\<C-h>" : "\<C-h>"
        " <space> just closes the popup
        inoremap <expr><space> pumvisible() ? neocomplcache#smart_close_popup()."\<space>" : "\<space>"

        " we don't want the completion menu to auto pop-up when we are in text files
        let g:neocomplcache_lock_buffer_name_pattern = '\v(\.md|\.txt)'

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

        " Enable clang_complete
        let g:neocomplcache_force_overwrite_completefunc=1
        let g:clang_complete_auto=1
    endif
" }}}

" Ultisnips {{{
    let g:UltiSnipsExpandTrigger = "<c-l>"
    let g:UltiSnipsJumpForwardTrigger = "<c-l>"
    let g:UltiSnipsJumpBackwardTrigger = "<c-h>"
    let g:UltiSnipsSnippetDirectories=["UltiSnips", "snippets"]
" }}}

" Ack.vim {{{
    let g:ackprg="ack -i -H --nocolor --nogroup --column --text"
    nnoremap <leader>a :Ack!<space>
" }}}

" Chapa.vim {{{
    let g:chapa_no_repeat_mappings = 1
    let g:chapa_default_mappings = 1
" }}}

" Commentary {{{
    au FileType cfg set commentstring=#\ %s
    au FileType cpp set commentstring=/\/\ %s
    au FileType python set commentstring=#\ %s
    au FileType lisp set commentstring=;;\ %s
" }}}

" CtrlP {{{
    " let g:ctrlp_user_command = 'find %s -type f' " MacOSX/Linux
    let g:ctrlp_map = ""
    let g:ctrlp_jump_to_buffer = 2
    let g:ctrlp_working_path_mode = 2
    let g:ctrlp_use_caching = 1
    let g:ctrlp_clear_cache_on_exit = 0
    let g:ctrlp_user_command = {
	\ 'types': {
		\ 1: ['.git/', 'cd %s && git ls-files'],
		\ 2: ['.hg/', 'hg --cwd %s locate -I .'],
		\ }
	\ }
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
    let g:gundo_width = 30
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
    let g:NERDTreeChDirMode = 2
" }}}

" Tabularize {{{
    vnoremap <silent> <leader>t> :Tabularize /=><cr>
    vnoremap <silent> <leader>t= :Tabularize /=<cr>
    vnoremap <silent> <leader>t, :Tabularize /,<cr>
" }}}

" Tagbar {{{
    let g:tagbar_autofocus = 1
    let g:tagbar_compact = 1
    let g:tagbar_expand = 0
    let g:tagbar_iconchars = ['▸','▾']
    let g:tagbar_singleclick = 1
    let g:tagbar_width = 30

    if executable('coffeetags')
        let g:tagbar_type_coffee = {
            \ 'ctagsbin': 'coffeetags',
            \ 'ctagsargs': '',
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
    let g:syntastic_javascript_checker = 'jshint'
    let g:syntastic_javascript_jshint_conf = $VIMHOME.'/jshint.json'
    let g:syntastic_enable_highlighting = 0
    let g:syntastic_stl_format = '⚡ %E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w} ⚡'
" }}}

" Bebop {{{
  let g:bebop_enabled = 0
" }}}

" Eclim {{{
    let g:EclimDisabled = 1
    let g:EclimTaglistEnabled = 0
" }}}

" Filetypes {{{
    au BufNewFile,BufRead *.as set filetype=actionscript
    au BufNewFile,BufRead Cakefile,*.coffee set filetype=coffee
    au BufNewFile,BufRead *.haml set filetype=haml
    au BufNewFile,BufRead *.jade set filetype=jade
    au BufNewFile,BufRead *.sass set filetype=sass
    au BufNewFile,BufRead *.scss set filetype=scss
    au BufNewFile,BufRead *.styl set filetype=stylus
" }}}

" Clojure {{{
    au BufNewFile,BufRead *.clj set filetype=clojure
    let g:vimclojure#SplitPos = "left"
    let g:vimclojure#HighlightBuiltins = 1
    let g:vimclojure#HighlightContrib = 1
    let g:vimclojure#ParenRainbow = 1
    let g:vimclojure#DynamicHighlighting = 1
    if executable('ng')
        let g:vimclojure#WantNailgun = 1
    endif
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
    au FileType haskell setlocal omnifunc=necoghc#omnifunc
" }}}

" Javascript {{{
    if executable('node')
        " Run current file in node for quick evaluation
        func! s:RunInNode()
            w
            !node %
        endf
        au FileType javascript command! RunInNode call s:RunInNode()
        au FileType javascript map <leader>r :RunInNode<cr>
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
    func! s:StripTrailingWhitespace()
        normal mZ
        %s/\s\+$//e
        normal `Z
    endf
    au FileType * au BufWritePre <buffer> :silent! call <SID>StripTrailingWhitespace()`
" }}}

" Mappings {{{
    " No arrow keys
    map <Left> :echo<cr>
    map <Right> :echo<cr>
    map <Up> :echo<cr>
    map <Down> :echo<cr>
    imap <Left> <c-o>:echo<cr>
    imap <Right> <c-o>:echo<cr>
    imap <Up> <c-o>:echo<cr>
    imap <Down> <c-o>:echo<cr>
    map OD :echo<cr>
    map OC :echo<cr>
    map OA :echo<cr>
    map OB :echo"<cr>
    imap OD <c-o>:echo<cr>
    imap OC <c-o>:echo<cr>
    imap OA <c-o>:echo<cr>
    imap OB <c-o>:echo<cr>

    " Enter normal mode quickly
    nnoremap ; :
    vnoremap ; :

    " Prevent cursor from moving when leavng insert mode
    inoremap <Esc> <Esc>`^

    " Stay in visual mode after indentation change
    vnoremap > >gv
    vnoremap < <gv
    vnoremap <Tab> >gv
    vnoremap <S-Tab> <gv

    " Cmdline
    cnoremap <c-a> <Home>
    cnoremap <c-e> <End>
    cnoremap <c-h> <Left>
    cnoremap <c-j> <Down>
    cnoremap <c-k> <Up>
    cnoremap <c-l> <Right>

    vnoremap p "_dP
    vnoremap <leader>p "_d*P

    " Quit/Write quickly
    nnoremap <leader>q :q<cr>
    nnoremap Q :q<cr>
    nnoremap W :w<cr>

    " \y and \p for clipboard yank/paste
    nnoremap <leader>P "+P
    nnoremap <leader>Y "+yy
    nnoremap <leader>p "*P
    nnoremap <leader>y "*yy
    vnoremap <leader>P "+P
    vnoremap <leader>Y "+y
    vnoremap <leader>p "*P
    vnoremap <leader>y "*y

    " Ctrl-h/l to switch between tabs
    nnoremap <c-h> :tabp<CR>
    nnoremap <c-l> :tabn<CR>

    " Ctrl-j/k to switch between buffers
    nnoremap <c-k> :bn<cr>
    nnoremap <c-j> :bp<cr>

    " J/K move up down half pages
    nnoremap J <c-d>
    nnoremap K <c-u>
    vnoremap J <c-d>
    vnoremap K <c-u>

    " Make pageup/pagedown move up/down half pages
    nnoremap <silent> <PageUp> <c-u><c-u>
    vnoremap <silent> <PageUp> <c-u><c-u>
    inoremap <silent> <PageUp> <c-\><c-o><c-u><c-\><c-o><c-u>
    nnoremap <silent> <PageDown> <c-d><c-d>
    vnoremap <silent> <PageDown> <c-d><c-d>
    inoremap <silent> <PageDown> <c-\><c-o><c-d><c-\><c-o><c-d>

    " Buffer mappings {{{
    nnoremap <silent> <Leader>d :bd<CR>

    " Wincmd mappings
    inoremap <c-w> <c-o><c-w>
    nnoremap <leader>w= <c-w>=
    nnoremap <leader>w+ <c-w>+
    nnoremap <leader>w- <c-w>-
    nnoremap <leader>w> <c-w>>
    nnoremap <leader>w< <c-w><
    nnoremap <leader>wh <c-w>h
    nnoremap <leader>wj <c-w>j
    nnoremap <leader>wk <c-w>k
    nnoremap <leader>wl <c-w>l
    nnoremap <leader>wH <c-w>H
    nnoremap <leader>wJ <c-w>J
    nnoremap <leader>wK <c-w>K
    nnoremap <leader>wL <c-w>L
    nnoremap <leader>wP <c-w>P
    nnoremap <leader>wR <c-w>R
    nnoremap <leader>wT <c-w>T
    nnoremap <leader>wb <c-w>b
    nnoremap <leader>wc <c-w>c
    nnoremap <leader>wn <c-w>n
    nnoremap <leader>wo <c-w>o
    nnoremap <leader>wp <c-w>p
    nnoremap <leader>wq <c-w>q
    nnoremap <leader>wr <c-w>r
    nnoremap <leader>wr <c-w>r
    nnoremap <leader>ws <c-w>s
    nnoremap <leader>wt <c-w>t
    nnoremap <leader>wv <c-w>v
    nnoremap <leader>ww <c-w>w
    nnoremap <leader>wx <c-w>x

    " Fast window moving/resizing with alt/meta + h/j/k/l
    map h <c-w>h
    map j <c-w>j
    map k <c-w>k
    map l <c-w>l
    map H <c-w>H
    map J <c-w>J
    map K <c-w>K
    map L <c-w>L
    map è <c-w>h
    map ê <c-w>j
    map ë <c-w>k
    map ì <c-w>l
    map È <c-w>H
    map Ê <c-w>J
    map Ë <c-w>K
    map Ì <c-w>L
    nnoremap <c-up> <c-w>+
    nnoremap <c-down> <c-w>-
    nnoremap <c-left> <c-w>>
    nnoremap <c-right> <c-w><

    " CtrlP mappings
    nnoremap gb :CtrlPBuffer<cr>
    nnoremap go :CtrlP<cr>
    nnoremap gr :CtrlPMRUFiles<cr>

    " Toggle Gundo, tagbar, nerdtree
    nnoremap <leader>u :GundoToggle<cr>
    nnoremap <leader>t :TagbarToggle<cr>
    nnoremap <leader>n :NERDTreeToggle<cr>

    " Quickly change to directory of open file
    nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

    " Quick edit .vimrc {{{
    nnoremap <silent> <leader>ev :edit ~/.vim/vimrc<cr>
    au FileType vim nnoremap <buffer> <leader>ef :w<cr>:source %<cr>

    " Fast substitute
    nnoremap <leader>s :s\v%//<left>
    vnoremap <leader>s :s\v//<left>

    " Open in browser
    nnoremap <leader>of :py import webbrowser; webbrowser.open(<c-r>='"'.'file://'.expand('%:p').'"'<cr>)<cr>
    nnoremap <leader>ow :py import webbrowser; webbrowser.open(<c-r>='"'.expand("<cWORD>").'"'<cr>)<cr>

    " Identify vim syntax highlight group under cursor
    map <leader>hi :echo "hi: " . synIDattr(synID(line("."), col("."), 1), "name") . ", trans: "
                              \ . synIDattr(synID(line("."), col("."), 0), "name") . ", lo: "
                              \ . synIDattr(synIDtrans(synID(line("."), col("."), 1)), "name")<CR>
" }}}

" Diff {{{
    " Automatically show diff in git window
    autocmd FileType gitcommit DiffGitCached -p | wincmd L
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
    nnoremap ]Q :clast<cr>
    nnoremap [Q :cfirst<cr>
    nnoremap ]l :lnext<cr>
    nnoremap [l :lprevious<cr>
    nnoremap ]L :llast<cr>
    nnoremap [L :lfirst<cr>
" }}}

" Hax {{{
    au FileChangedRO * set noro
" }}}

" vim: fdm=marker foldlevel=1 nofoldenable

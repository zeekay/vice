" Author: Zach Kelling
" Source: https://bitbucket.org/zeekay/dot-vim or https://github.com/zeekay/dot-vim

" Vundle {
    set nocompatible
    filetype off

    set rtp+=~/.vim/bundle/vundle
    call vundle#rc()

    " vundle - https://github.com/gmarik/vundle
    Bundle 'git://github.com/gmarik/vundle'

    " ctrlp - https://github.com/kien/ctrlp.vim
    " Bundle 'git://github.com/kien/ctrlp.vim'

    " ack.vim - https://github.com/mileszs/ack.vim
    Bundle 'git://github.com/mileszs/ack.vim'

    " supertab - https://github.com/ervandew/supertab
    Bundle 'git://github.com/ervandew/supertab'

    " vim-repeat - https://github.com/tpope/vim-repeat
    Bundle 'git://github.com/tpope/vim-repeat'

    " vim-commentary - https://github.com/tpope/vim-commentary
    Bundle 'git://github.com/tpope/vim-commentary'

    " vim-surround - https://github.com/tpope/vim-surround
    " Bundle 'git://github.com/tpope/vim-surround'

    " delimitMate - https://github.com/Raimondi/delimitMate
    " Bundle 'git://github.com/Raimondi/delimitMate'

    " AutoCloseTag - https://github.com/zeekay/vim-autoclose
    Bundle 'git://github.com/zeekay/vim-autoclose'

    if !has('win32unix')
        " syntastic - https://github.com/scrooloose/syntastic
        Bundle 'git://github.com/scrooloose/syntastic'

        " http://repo.or.cz/w/vcscommand
        " Bundle 'git://repo.or.cz/vcscommand'

        " vim-easymotion - https://github.com/Lokaltog/vim-easymotion
        " Bundle 'git://github.com/Lokaltog/vim-easymotion'

        " https://github.com/juanpabloaj/help.vim
        Bundle 'git://github.com/juanpabloaj/help.vim'

        " vim-coffees-script - https://github.com/kchmck/vim-coffee-script
        Bundle 'git://github.com/kchmck/vim-coffee-script'

        " chapa.vim - https://github.com/alfredodeza/chapa.vim
        " Bundle 'git://github.com/alfredodeza/chapa.vim'

        " tabular - https://github.com/godlygeek/tabular
        Bundle 'git://github.com/godlygeek/tabular'

        " tagbar - https://github.com/majutsushi/tagbar
        " Bundle 'git://github.com/majutsushi/tagbar'

        " gundo - https://github.com/sjl/gundo.vim
        " Bundle 'git://github.com/sjl/gundo.vim'

        " threesome.vim - https://github.com/sjl/threesome.vim
        " Bundle 'git://github.com/sjl/threesome.vim'

        " pydoc.vim - https://github.com/fs111/pydoc.vim
        " Bundle 'git://github.com/fs111/pydoc.vim'

        " current-func-info - https://github.com/tyru/current-func-info.vim
        " Bundle 'tyru/current-func-info.vim'

        " python.vim improved - https://gitorious.org/python-vim
        " Bundle 'git://gitorious.org/python-vim/python-vim'

        " ropevim - https://github.com/gordyt/rope-vim
        " Bundle 'gordyt/rope-vim'

        " sparkup - https://github.com/rstacruz/sparkup
        " Bundle 'rstacruz/sparkup'

        " vim-fuzzee - https://github.com/mattsa/vim-fuzzee
        " Bundle 'mattsa/vim-fuzzee'

        " vim-fugitive - https://github.com/tpope/vim-fugitive
        " Bundle 'vim-fugitive'

        if version > 700
            " https://github.com/vim-scripts/VimClojure
            Bundle 'git://github.com/vim-scripts/VimClojure'

            " ultisnips - https://github.com/rygwdn/ultisnips
            Bundle 'git://github.com/rygwdn/ultisnips'
        endif


        " if has("python")
        "     " https://github.com/ivanov/vim-ipython
        "     Bundle 'git://github.com/ivanov/vim-ipython'
        " endif

        " if has("ruby")
        "     " lusty - https://github.com/sjbach/lusty/
        "     Bundle 'git://github.com/sjbach/lusty'
        " endif
    endif
" }

" Basic Configuration {
    syntax on
    filetype plugin indent on
    set directory=~/.vim/tmp/swap
    set backup
    set backupdir=~/.vim/tmp/backup
    " set nobackup
    " set nowritebackup
    " set noswapfile
    " set nomodeline
    set undolevels=1000
    set history=1000
    set autochdir
    set backspace=indent,eol,start
    set matchpairs+=<:>
    set shortmess=atToOI
    set hidden
    set encoding=utf-8
    set termencoding=utf-8
    set confirm
    set ruler
    set linebreak
    set wrap
    set whichwrap=b,s,h,l,<,>,[,]
    " set clipboard=unnamed,unnamedplus,autoselect
    set autoread
    set report=0
    set gdefault
    set showcmd
    set virtualedit=block,onemore
    set switchbuf=usetab
    " set pumheight=10
    " set diffopt+=context:3
    " set scrolloff=10
    " set sidescrolloff=20
    " set scrolljump=10
    set splitright
    set nomore
    if version > 700
        set undofile
        set undodir=~/.vim/tmp/undo
    endif
" }

" Indent {
    set tabstop=4
    set shiftwidth=4
    set expandtab
    set smarttab
    set autoindent
    autocmd FileType coffee,javascript,xml,xhtml,html,htmldjango,haml set shiftwidth=2
" }

" Search/Highlight {
    set showmatch
    set incsearch
    set ignorecase
    set smartcase
" }

" Menu/Complete {
    set wildmenu
    set wildmode=list:longest
    set wildignore=*.o,*.obj,*.bak,*.exe,*.aux,*.dvi,*.dll,*.pyc,*.pyo
    set completeopt=menuone,menu,longest,preview
" }

" Completions {
    autocmd FileType python set omnifunc=pythoncomplete#Complete
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS
    autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
    autocmd FileType php set omnifunc=phpcomplete#CompletePHP
    autocmd FileType c set omnifunc=ccomplete#Complete
    autocmd FileType cpp set omnifunc=omni#cpp#complete#Main
    autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
" }

" Statusline {
    set laststatus=2
    set statusline=\(%n\)\ %f\ %*%#Modified#%m\ (%l/%L,\ %c)\ %P%=%h%w\ %y\ [%{&encoding}:%{&fileformat}]
" }

" Quickfix {
    au Filetype qf setl nolist
    au Filetype qf setl nocursorline
    au Filetype qf setl nowrap
" }

" Colors/Gui {
    if has("gui_running")
        let macvim_hig_shift_movement = 1
        set nu
        set guioptions=ace
        set guifont=Dina-medium:h13
        set linespace=1
        set mouse=a
        " set transparency=15
        colorscheme molokai-original
    else
        colorscheme hornet
        set mouse-=a
    endif
" }

" Fast Escape {
    augroup fastescape
        autocmd!

        set notimeout
        set ttimeout
        set timeoutlen=10

        au InsertEnter * set timeout
        au InsertLeave * set notimeout
    augroup END
" }

" Remove Trailing Whitespace {
    function! s:StripTrailingWhitespace()
        normal mZ

        %s/\s\+$//e

        normal `Z
    endfunction
    au FileType * au BufWritePre <buffer> :silent! call <SID>StripTrailingWhitespace()`
" }

" Netrw {
    let g:netrw_silent = 1
    let g:netrw_cursor = 0
    let g:netrw_banner = 0
    " let g:netrw_menu = 0
    " long listing style
    let g:netrw_liststyle = 1
    let g:netrw_list_hide='\.swp$,\.pyc$,\.pyo$,^\.hg$,^\$,^\.svn$,^\.o$,.Trash,.DS_Store,.CFUserTextEncoding'
" }

" Gundo {
    nnoremap <F11> :GundoToggle<CR>
    let g:gundo_right = 1
    let g:gundo_width = 50
" }

" Tabularize {
    vnoremap <silent> <Leader>t> :Tabularize /=><CR>
    vnoremap <silent> <Leader>t= :Tabularize /=<CR>
    vnoremap <silent> <Leader>t, :Tabularize /,<CR>
" }

" delimitMate {
    let g:delimitMate_expand_cr = 1
    let g:delimitMate_expand_space = 1
    let g:delimitMate_balance_matchpairs = 1
    let g:delimitMate_excluded_ft = "mail,help"
    au FileType * let b:delimitMate_autoclose = 1
    " If using html auto complete (complete closing tag)
    au FileType xml,html,xhtml let b:delimitMate_matchpairs = "(:),[:],{:}"
" }

" AutoCloseTag {
    " Make it so AutoCloseTag works for xml and xhtml files as well
    au FileType xhtml,xml ru ftplugin/html/autoclosetag.vim
" }

" EasyMotion {
    let g:EasyMotion_keys = ";,.pyfgcrl/aoeuidhtns-'qjkxbmwvz"
" }

" Tagbar {
    let g:tagbar_width = 50
    " let g:tagbar_autoclose = 1
    let g:tagbar_autofocus = 1
    let g:tagbar_compact = 1
    let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
    let g:tagbar_expand = 1
    nnoremap <silent> <F12> :TagbarToggle<CR>
" }

" vim-commentary {
    autocmd FileType cfg set commentstring=#\ %s
    autocmd FileType cpp set commentstring=/\/\ %s
    autocmd FileType python set commentstring=#\ %s
" }

" Syntastic {
    " reorder runtimepath so my custom syntax plugins are used
    set rtp-=~/.vim/bundle/syntastic
    set rtp+=~/.vim/syntastic,~/.vim/bundle/syntastic
    let g:syntastic_enable_signs = 1
    let g:syntastic_auto_loc_list = 0
    let g:syntastic_python_checker = 'flake8 --ignore=E501'
    let g:syntastic_enable_highlighting = 0
" }

" UltiSnips {
    let g:UltiSnipsExpandTrigger = '<tab>'
    " let g:UltiSnipsListSnippets = '<c-s>'
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
    " let g:UltiSnipsJumpForwardTrigger = '<c-j>'
    " let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
    let g:UltiSnipsSnippetDirectories=["UltiSnips"]
" }

" SuperTab {
    " let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
    let g:SuperTabCompletionContexts = ['s:ContextDiscover', 's:ContextText']
    let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
    let g:SuperTabContextDiscoverDiscovery =
        \ ["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-u>"]
    let g:SuperTabMappingForward = '<tab>'
    let g:SuperTabMappingBackward = '<s-tab>'
    " let g:SuperTabMappingForward = '<c-j>'
    " let g:SuperTabMappingBackward = '<c-k>'
" }

" PyDoc {
    au FileType python,man map! <buffer> <leader>pw :call ShowPyDoc('<C-R><C-W>', 1)<CR>
    au FileType python,man map! <buffer> <leader>pW :call ShowPyDoc('<C-R><C-A>', 1)<CR>
    au FileType python,man map! <buffer> <leader>pk :call ShowPyDoc('<C-R><C-W>', 0)<CR>
    au FileType python,man map! <buffer> <leader>pK :call ShowPyDoc('<C-R><C-A>', 0)<CR>

    " remap the K (or 'help') key
    " nnoremap <silent> <buffer> K :call ShowPyDoc(expand("<cword>"), 1)<CR>
" }

" IPython {
    let g:ipy_perform_mappings = 0
    au FileType python map <silent> <F5> :python run_this_file()<CR>
    au FileType python map <silent> <S-F5> :python run_this_line()<CR>
    au FileType python vmap <silent> <F5> :python run_these_lines()<CR>
    au FileType python map <silent> <leader>d :py get_doc_buffer()<CR>
    au FileType python map <F6> :call <SID>toggle_send_on_save()<CR>
" }

" Python highlighting {
    let g:python_highlight_all = 1
    let g:python_show_sync = 1
    " let g:python_print_as_function = 1
" }

" CoffeeScript {
    au Filetype coffee setl foldmethod=indent nofoldenable
    au FileType coffee map <F5> :CoffeeRun<cr>
    au FileType coffee map <F6> :CoffeeCompile watch vertical<cr>
    au FileType coffee imap <F5> <c-o>:CoffeeRun<cr>
    au FileType coffee imap <F6> <c-o>:CoffeeCompile watch vertical<cr>
" }

" VisualSearch {
    " vnoremap <silent> * :call VisualSearch('f')<CR>
    " vnoremap <silent> # :call VisualSearch('b')<CR>

    " From an idea by Michael Naumann
    " function! VisualSearch(direction) range
    "     let l:saved_reg = @"
    "     execute "normal! vgvy"

    "     let l:pattern = escape(@", '\\/.*$^~[]')
    "     let l:pattern = substitute(l:pattern, "\n$", "", "")

    "     if a:direction == 'b'
    "         execute "normal ?" . l:pattern . "^M"
    "     elseif a:direction == 'gv'
    "         call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    "     elseif a:direction == 'f'
    "         execute "normal /" . l:pattern . "^M"
    "     endif

    "     let @/ = l:pattern
    "     let @" = l:saved_reg
    " endfunction
" }

" Shift Lines {
    function! s:MoveLineUp()
        call <SID>MoveLineOrVisualUp(".", "")
    endfunction

    function! s:MoveLineDown()
        call <SID>MoveLineOrVisualDown(".", "")
    endfunction

    function! s:MoveVisualUp()
        call <SID>MoveLineOrVisualUp("'<", "'<,'>")
        normal gv
    endfunction

    function! s:MoveVisualDown()
        call <SID>MoveLineOrVisualDown("'>", "'<,'>")
        normal gv
    endfunction

    function! s:MoveLineOrVisualUp(line_getter, range)
        let l_num = line(a:line_getter)
        if l_num - v:count1 - 1 < 0
            let move_arg = "0"
        else
            let move_arg = a:line_getter." -".(v:count1 + 1)
        endif
        call <SID>MoveLineOrVisualUpOrDown(a:range."move ".move_arg)
    endfunction

    function! s:MoveLineOrVisualDown(line_getter, range)
        let l_num = line(a:line_getter)
        if l_num + v:count1 > line("$")
            let move_arg = "$"
        else
            let move_arg = a:line_getter." +".v:count1
        endif
        call <SID>MoveLineOrVisualUpOrDown(a:range."move ".move_arg)
    endfunction

    function! s:MoveLineOrVisualUpOrDown(move_arg)
        let col_num = virtcol(".")
        execute "silent! ".a:move_arg
        execute "normal! ".col_num."|"
    endfunction
" }

" Multiline f motion {
    function! FindChar(direction, count, ...)
        " get character, or use arg
        if a:0 == 0
            let c = nr2char(getchar())
        else
            let c = a:1
        endif

        " search for matches
        for i in range(a:count)
            if a:direction == 'f'
                let match = search('\V'.c)
            else
                let match = search('\V'.c, 'b')
            endif
        endfor

        " setup repeat
        if c == "'"
            let c = '"'.c.'"'
        else
            let c = "'".c."'"
        endif
        silent! call repeat#set(":call FindChar('".a:direction."',".a:count.",".c.")\n")
    endfunction

    nmap f :<C-U>call FindChar('f', v:count1)<CR>
    nmap F :<C-U>call FindChar('b', v:count1)<CR>
" }

" Pasta {
    function! s:MakePasta(filename)
        let fn = a:filename
        let res = system('/usr/local/bin/python ~/.bin/pasta ' . fn)
        echo res
        " botright new
        " setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
        " execute '$read !/usr/local/bin/python ~/.bin/pasta.py '. fn
        " setlocal nomodifiable
    endfunction
    command! Pasta call s:MakePasta(expand("%"))
" }

" Mappings {
    " prevent cursor from moving when leavng insert mode
    inoremap <Esc> <Esc>`^

    " ctrl+w switch window in insert mode
    inoremap <c-w> <c-o><c-w>

    " ctrl+o to save
    nnoremap <C-o> :w<CR>
    nnoremap <C-x> :q<CR>
    vnoremap <C-x> :q<CR>

    " stay in visual mode after indentation change
    vnoremap > >gv
    vnoremap < <gv
    vnoremap <tab> >gv
    vnoremap <s-tab> <gv

    " Move in insert mode using alt-h/j/k/l
    inoremap k <Up>
    inoremap j <Down>
    inoremap h <Left>
    inoremap l <Right>

    " Move selections in visual mode using alt-i/j/k/l
    vnoremap k <Esc>:call <SID>MoveVisualUp()<CR>
    vnoremap j <Esc>:call <SID>MoveVisualDown()<CR>
    vnoremap h <Left> <gv
    vnoremap l <Right> >gv

    " make G go to *end* of last line
    nnoremap G G$
    vnoremap G G$

    " Enter normal mode quickly
    nnoremap ; :
    vnoremap ; :

    " K/J move up down half pages
    nnoremap J <C-D>
    nnoremap K <C-U>
    vnoremap J <C-D>
    vnoremap K <C-U>

    " clipboard yank/paste
    nnoremap <c-y> "*yy
    vnoremap <c-y> "*y
    nnoremap <c-p> "*p
    vnoremap <c-p> "*p

    " make pageup/pagedown move up/down half pages
    nnoremap <silent> <PageUp> <C-U><C-U>
    vnoremap <silent> <PageUp> <C-U><C-U>
    inoremap <silent> <PageUp> <C-\><C-O><C-U><C-\><C-O><C-U>
    nnoremap <silent> <PageDown> <C-D><C-D>
    vnoremap <silent> <PageDown> <C-D><C-D>
    inoremap <silent> <PageDown> <C-\><C-O><C-D><C-\><C-O><C-D>

    " ctrl+e to explore current directory
    nnoremap <C-e> :Explore<cr>
    inoremap <C-e> <C-o>:Explore<cr>>

    " ctrl-} to move backwards through ctags
    nnoremap <c-}> <c-t>

    " ...now map ctrl-t to open new tabs
    nnoremap <c-t> :tabnew<cr>
    inoremap <c-t> <c-o>:tabnew<cr>

    " ctrl-left/right/h/l to switch between tabs
    nnoremap <c-Left> :tabp<CR>
    nnoremap <c-Right> :tabn<CR>
    inoremap <c-Left> <c-o>:tabp<CR>
    inoremap <c-Right> <c-o>:tabn<CR>
    nnoremap <c-h> :tabp<CR>
    nnoremap <c-l> :tabn<CR>
    inoremap <c-h> <c-o>:tabp<CR>
    inoremap <c-l> <c-o>:tabn<CR>

    " Fast window resizing
    if bufwinnr(1)
        map <kPlus> <C-W>+
        map <kMinus> <C-W>-
        map <kDivide> <C-W><
        map <kMultiply> <C-W>>
    endif
" }

" vim: fdm=marker foldmarker={,} foldlevel=1 nofoldenable

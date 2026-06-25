" vice — a self-contained, lightweight Vim addon framework.
"
" Addons are git repositories. vice resolves a name to a clone url + a
" directory under g:vice.addons_dir, clones it on demand, puts it on the
" runtimepath and sources its plugin scripts. No external dependencies.
"
" Addon name schemes:
"   github:user/repo        -> https://github.com/user/repo
"   gitlab:user/repo        -> https://gitlab.com/user/repo
"   bitbucket:user/repo     -> https://bitbucket.org/user/repo
"   https://host/user/repo  -> used as-is
"   git@host:user/repo      -> used as-is
" The local directory is always the final path component (repo name).

if !exists('g:vice')
    let g:vice = {}
endif

if !exists('g:vice.loaded') || &cp
    let g:vice.loaded = 1
else
    finish
endif

let g:vice.version = '1.0.0'

let s:needs_activation = []
let s:activation_callbacks = []
let s:activated = {}

" addons_dir defaults to the directory containing vice (…/addons)
if !exists('g:vice.addons_dir')
    let g:vice.addons_dir = expand('<sfile>:p:h:h:h')
endif

" vim_dir defaults to the parent of addons_dir (…/.vim)
if !exists('g:vice.vim_dir')
    let g:vice.vim_dir = expand('<sfile>:p:h:h:h:h')
endif

if !exists('g:vice.addons')
    let g:vice.addons = []
endif

if !exists('g:vice.ft_addons')
    let g:vice.ft_addons = {}
endif

if !exists('g:vice.commands')
    let g:vice.commands = {}
endif

if !exists('g:vice.auto_install')
    let g:vice.auto_install = 1
endif

" {{{1 Name resolution

" Repo name: the final ':' or '/' delimited component, sans trailing .git
func! s:RepoName(name)
    return split(substitute(a:name, '\.git$', '', ''), '[:/]')[-1]
endf

" Local directory for an addon
func! vice#AddonDirFromName(name)
    return g:vice.addons_dir.'/'.s:RepoName(a:name)
endf

" Clone url for an addon
func! vice#AddonUrlFromName(name)
    let n = a:name
    if n =~ '^https\?://' || n =~ '^git@'
        return n
    endif
    if n =~ '^git://'
        return substitute(n, '^git://', 'https://', '')
    endif
    let host = matchstr(n, '^\w\+\ze:')
    let path = matchstr(n, ':\zs.*')
    let domain = get({'github': 'github.com', 'gitlab': 'gitlab.com',
                    \ 'bitbucket': 'bitbucket.org'}, host, host)
    return 'https://'.domain.'/'.path
endf

" {{{1 Install / activate

func! s:Install(name, dir)
    if isdirectory(a:dir)
        return
    endif
    if !g:vice.auto_install
        echohl WarningMsg | echom 'vice: '.a:name.' is not installed' | echohl None
        return
    endif
    let url = vice#AddonUrlFromName(a:name)
    echo 'vice: installing '.s:RepoName(a:name).' …'
    let out = system('git clone --depth 1 '.shellescape(url).' '.shellescape(a:dir))
    if v:shell_error
        echohl ErrorMsg | echom 'vice: failed to clone '.url.': '.out | echohl None
    endif
    redraw
endf

" Source an addon's plugin scripts and generate help tags
func! s:Source(dir)
    for pat in ['plugin/**/*.vim', 'after/plugin/**/*.vim', 'ftdetect/*.vim']
        for file in split(globpath(a:dir, pat), "\n")
            exe 'source '.fnameescape(file)
        endfor
    endfor
    if isdirectory(a:dir.'/doc') && !filereadable(a:dir.'/doc/tags')
        silent! exe 'helptags '.fnameescape(a:dir.'/doc')
    endif
endf

" Install (if needed), add to runtimepath and source an addon.
" Returns 1 if newly activated, 0 otherwise.
func! s:Activate(name)
    let dir = vice#AddonDirFromName(a:name)
    if has_key(s:activated, dir)
        return 0
    endif
    call s:Install(a:name, dir)
    if !isdirectory(dir)
        return 0
    endif
    let s:activated[dir] = 1
    exe 'set runtimepath^='.fnameescape(dir)
    call s:Source(dir)
    return 1
endf

" Activate addons now. Returns the number newly activated.
func! vice#ActivateAddons(addons, ...)
    let n = 0
    for addon in a:addons
        let n += s:Activate(addon)
    endfor
    return n
endf

func! vice#ActivateAddon(addon, ...)
    return vice#ActivateAddons([a:addon])
endf

func! vice#ForceActivateAddon(addon)
    return vice#ActivateAddons([a:addon])
endf

func! vice#ForceActivateAddons(addons)
    return vice#ActivateAddons(a:addons)
endf

" {{{1 Lazy commands

" Activate plugins backing a lazy command, then run the real command
func! vice#LazyInit(name, plugins, before, after, bang, line1, line2, ...)
    if a:before != ''
        exe 'call '.a:before.'()'
    endif

    call vice#ActivateAddons(a:plugins)

    if a:after != ''
        exe 'call '.a:after.'()'
    endif

    let range = a:line1 != a:line2 ? a:line1.','.a:line2 : ''
    exe range.a:name.a:bang.' '.join(a:000)
endf

" Create a placeholder command that loads its addons on first use
func! vice#CreateCommand(name, addons, ...)
    let opts = a:0 > 0 ? a:1 : {}
    let before = get(opts, 'before', '')
    let after  = get(opts, 'after', '')

    exe 'command! -range -nargs=* -bang '.a:name.' call vice#LazyInit('
        \ .string(a:name).', '.string(a:addons).', '
        \ .string(before).', '.string(after).', '
        \ .'"<bang>", <line1>, <line2>, <f-args>)'
endf

" {{{1 Filetype addons

" Activate addons registered for a filetype, reloading ftplugins if any
" were newly added to the runtimepath.
func! vice#ActivateFtAddons(ft)
    let n = 0
    for [pat, addons] in items(g:vice.ft_addons)
        if a:ft =~ pat
            let n += vice#ActivateAddons(addons)
        endif
    endfor
    if n > 0 && a:ft !=# ''
        exe 'setlocal filetype='.a:ft
    endif
endf

" {{{1 Registration / extension

func! vice#Register(addon, ...)
    call add(g:vice.addons, a:addon)
    call add(s:needs_activation, a:addon)
    if a:0 == 1
        call add(s:activation_callbacks, a:1)
    endif
endf

" Merge a config fragment: addons, ft_addons and lazy commands
func! vice#Extend(config)
    if has_key(a:config, 'addons')
        call extend(g:vice.addons, a:config.addons)
        call extend(s:needs_activation, a:config.addons)
    endif

    if has_key(a:config, 'ft_addons')
        for [ft, addons] in items(a:config.ft_addons)
            if has_key(g:vice.ft_addons, ft)
                call extend(g:vice.ft_addons[ft], addons)
            else
                let g:vice.ft_addons[ft] = addons
            endif
        endfor
    endif

    if has_key(a:config, 'commands')
        for [key, val] in items(a:config.commands)
            call vice#CreateCommand(key, val)
        endfor
        call extend(g:vice.commands, a:config.commands)
    endif
endf

" {{{1 Initialize

func! vice#Initialize(...)
    if exists('g:vice.initialized')
        return
    endif
    let g:vice.initialized = 1

    " Merge user config
    if a:0 == 1
        for key in keys(a:1)
            let g:vice[key] = a:1[key]
        endfor
    endif

    " Lazily load filetype-specific addons
    au FileType * call vice#ActivateFtAddons(expand('<amatch>'))

    " Source vice modules inline (so their vice#Extend() runs before we
    " activate the addons they register); queue plain addons for activation.
    for addon in g:vice.addons
        if s:RepoName(addon) =~ '^vice-'
            let dir = vice#AddonDirFromName(addon)
            call s:Install(addon, dir)
            let mod = dir.'/module.vim'
            if filereadable(mod)
                let s:activated[dir] = 1
                let g:vice.addon_dir = dir
                exe 'set runtimepath^='.fnameescape(dir)
                exe 'source '.fnameescape(mod)
                call s:Source(dir)
            else
                call add(s:needs_activation, addon)
            endif
        else
            call add(s:needs_activation, addon)
        endif
    endfor

    call vice#ActivateAddons(s:needs_activation)

    for callback in s:activation_callbacks
        exe 'call '.callback.'()'
    endfor

    for [key, val] in items(g:vice.commands)
        call vice#CreateCommand(key, val)
    endfor

    command! -nargs=* ViceUpdate call vice#UpdateAddons()
    command! ViceList call vice#ListAddonsIntoBuffer()
endf

" {{{1 Listing / updating

func! s:AllNames()
    let names = copy(g:vice.addons)
    for addons in values(g:vice.ft_addons)
        call extend(names, addons)
    endfor
    for addons in values(g:vice.commands)
        call extend(names, addons)
    endfor
    return names
endf

func! vice#ListAddons()
    return map(s:AllNames(), 'vice#AddonDirFromName(v:val)')
endf

func! vice#ListAddonsIntoBuffer()
    redir @a
    for addon in vice#ListAddons()
        silent! echo addon
    endfor
    redir END
    normal! "ap
endf

func! vice#UpdateAddon(name)
    let dir = vice#AddonDirFromName(a:name)
    if !isdirectory(dir)
        return
    endif
    echo 'vice: updating '.s:RepoName(a:name).' …'
    call system('git -C '.shellescape(dir).' pull --ff-only')
    redraw
endf

func! vice#UpdateAddons()
    for name in s:AllNames()
        call vice#UpdateAddon(name)
    endfor
    echo 'vice: addons up to date'
endf

" vim: set fdm=marker:

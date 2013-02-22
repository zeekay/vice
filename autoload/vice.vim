if !exists('g:vice')
    let g:vice = {}
endif

if !exists('g:vice.loaded') || &cp
    let g:vice.loaded = 1
else
    finish
endif

let g:vice.needs_activation = []

let g:vice.available_modules = {
    \ 'vice-beautify': 1,
    \ 'vice-colorful': 1,
    \ 'vice-ctrlp': 1,
    \ 'vice-delimitmate': 1,
    \ 'vice-git': 1,
    \ 'vice-neocompletion': 1,
    \ 'vice-nerdtree': 1,
    \ 'vice-polyglot': 1,
    \ 'vice-powerline': 1,
    \ 'vice-standard-issue': 1,
    \ 'vice-syntastic': 1,
    \ 'vice-tagbar': 1,
    \ 'vice-undo': 1,
\ }

" Set addons dir
if !exists('g:vice.addons_dir')
    " Addons dir defaults to parent directory
    let g:vice.addons_dir = expand('<sfile>:p:h:h:h')
endif

" Create default global objects if necessary
if !exists('g:vice.addons')
    let g:vice.addons = []
endif

if !exists('g:vice.ft_addons')
    let g:vice.ft_addons = {}
endif

if !exists('g:vice.commands')
    let g:vice.commands = {}
endif

" Simple vam wrapper, exposed for benefit of external addons
func! vice#ActivateAddons(...)
    if a:0 > 1
        call vam#ActivateAddons(a:1, a:2)
    else
        call vam#ActivateAddons(a:1)
    endif
endf

func! vice#ActivateAddon(...)
    if a:0 > 1
        call vam#ActivateAddons([a:1], a:2)
    else
        call vam#ActivateAddons([a:1])
    endif
endf

func! vice#ForceActivateAddon(addon)
    call vam#ActivateAddons([a:addon], {'force_loading_plugins_now': 1})
endf

func! vice#ForceActivateAddons(addons)
    call vam#ActivateAddons(a:addons, {'force_loading_plugins_now': 1})
endf

" Helper to activate a plugin for lazy command
func! vice#LazyInit(name, plugins, callback, bang, ...)
    call vice#ActivateAddons(a:plugins, {'force_loading_plugins_now': 1})
    if a:callback != ''
        exe 'call '.a:callback.'()'
    endif
    exe a:name.a:bang.' '.join(a:000)
endf

" Create lazy commands
func! vice#CreateCommand(name, plugins, ...)
    if a:0 == 1
        let callback = a:1
    else
        let callback = ''
    endif
    exe 'command! -nargs=* -bang '.a:name.' call vice#LazyInit("'.a:name.'", '.string(a:plugins).', "'.callback.'", "<bang>", <f-args>)'
endf

" Activate plugins for a given filetype
func! vice#ActivateFtAddons(ft)
    for addons in values(filter(copy(g:vice.ft_addons), string(a:ft).' =~ v:key'))
        call vice#ActivateAddons(addons, {'force_loading_plugins_now': 1})
    endfor
endf

" Extend vice globals, create commands and activate plugins as necessary
func! vice#Extend(config)
    if has_key(a:config, 'addons')
        call extend(g:vice.addons, a:config.addons)
        call extend(g:vice.needs_activation, a:config.addons)
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

" Initialize vice
func! vice#Initialize(...)
    if a:0 == 1
        for key in keys(a:1)
            let g:vice[key] = a:1[key]
        endfor
    endif

    if !exists('g:vice.initialized')
        let g:vice.initialized = 1

        " vim-addon-manager global settings
        let g:vim_addon_manager = {
            \ 'shell_commands_run_method': 'system',
            \ 'auto_install': 1,
            \ 'known_repos_activation_policy': 'never',
        \ }

        " Add vim-addon-manager runtime path
        let &runtimepath.=','.g:vice.addons_dir.'/vim-addon-manager'

        " No-op but loads vam.vim, which we need done so we can override
        call vam#PluginDirFromName('github:zeekay/not-a-real-addon')

        " Override vam#PluginDirFromName
        exe "so ".g:vice.addons_dir.'/vice/autoload/addons-dir-hack.vim'

        " Sane defaults, but hey some people might disagree...
        if !exists('g:vice.assume_nothing')
            set nocompatible
            filetype indent plugin on | syn on
        endif

        " Create ft autocommand
        au FileType * call vice#ActivateFtAddons(expand('<amatch>'))
    endif

    " Manually source vice modules, add regular addons to list of addons to be
    " activated.
    for addon in g:vice.addons
        let name = split(addon, '/')[1]
        if has_key(g:vice.available_modules, name)
            let plugin = g:vice.addons_dir.'/'.name.'/plugin/'.name.'.vim'
            try
                exe 'so '.plugin
            catch
                call add(g:vice.needs_activation,  addon)
            endtry
        else
            call add(g:vice.needs_activation,  addon)
        endif
    endfor

    " Activate all normal addons now
    call vam#ActivateAddons(g:vice.needs_activation)

    for [key, val] in items(g:vice.commands)
        call vice#CreateCommand(key, val)
    endfor
endf

func! vice#AddonDirFromName(addon)
    return vam#PluginDirFromName(a:addon)
endf

func! vice#ListAddons()
    let res = []

    for addon in g:vice.addons
        call add(res, vam#PluginDirFromName(addon))
    endfor

    for addons in values(g:vice.ft_addons)
        for addon in addons
            call add(res, vam#PluginDirFromName(addon))
        endfor
    endfor

    for addons in values(g:vice.commands)
        for addon in addons
            call add(res, vam#PluginDirFromName(addon))
        endfor
    endfor

    return res
endf

func! vice#ListAddonsIntoBuffer()
    redir @a
    for addon in vice#ListAddons()
        silent! echo addon
    endfor
    redir END
    normal "ap
endf

func! vice#UpdateAddon(addon)
    call vam#install#UpdateAddon(a:addon)
endf

func! vice#UpdateAddons()
    for addon in call vice#ListAddons()
        call vice#UpdateAddon(addon)
    endfor
endf

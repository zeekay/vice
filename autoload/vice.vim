if !exists('g:vice')
    let g:vice = {}
endif

if !exists('g:vice.loaded') || &cp
    let g:vice.loaded = 1
    set nocompatible
else
    finish
endif

let s:needs_activation = []
let s:activation_callbacks = []

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
func! vice#ActivateAddons(addons, ...)
    let opts = a:0 > 0 ? a:1 : {}

    for addon in a:addons
        try
            call vam#ActivateAddons([addon], opts)
        catch /Failed to checkout addon/
            throw 'Unable to checkout addon '.addon
        endtry
    endfor
endf

func! vice#ActivateAddon(addon, ...)
    let opts = a:0 > 0 ? a:1 : {}

    call vice#ActivateAddons([a:addon], opts)
endf

func! vice#ForceActivateAddon(addon)
    call vam#ActivateAddons([a:addon], {'force_loading_plugins_now': 1})
endf

func! vice#ForceActivateAddons(addons)
    call vam#ActivateAddons(a:addons, {'force_loading_plugins_now': 1})
endf

" Helper to activate a plugin for lazy command
func! vice#LazyInit(name, plugins, before, after, bang, line1, line2, ...)
    if a:before != ''
        exe 'call '.a:before.'()'
    endif

    silent! call vice#ActivateAddons(a:plugins, {'force_loading_plugins_now': 1})

    if a:after != ''
        exe 'call '.a:after.'()'
    endif

    if a:line1 != a:line2
        exe a:line1.','.a:line2.a:name.a:bang.' '.join(a:000)
    else
        exe a:name.a:bang.' '.join(a:000)
    endif
endf

" Create lazy commands
func! vice#CreateCommand(name, addons, ...)
    let after = ''
    let before = ''

    if a:0 == 1
        if has_key(a:1, 'after')
            let after = a:1.after
        endif

        if has_key(a:1, 'before')
            let after = a:1.before
        endif
    endif

    exe 'command! -range -nargs=* -bang '.a:name.' call vice#LazyInit("'.a:name.'", '.string(a:addons).', "'.before.'", "'.after.'", "<bang>", <line1>, <line2>, <f-args>)'
endf

" Activate plugins for a given filetype
func! vice#ActivateFtAddons(ft)
    for addons in values(filter(copy(g:vice.ft_addons), string(a:ft).' =~ v:key'))
        call vice#ActivateAddons(addons, {'force_loading_plugins_now': 1})
    endfor
endf

func! vice#Register(addon, ...)
    call add(g:vice.addons, a:addon)
    call add(s:needs_activation, a:addon)
    if a:0 == 1
        call add(s:activation_callbacks, a:1)
    endif
endf

" Extend vice globals, create commands and activate plugins as necessary
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

" Initialize vice
func! vice#Initialize(...)
    if exists('g:vice.initialized')
        return
    endif

    let g:vice.initialized = 1

    " vim-addon-manager global settings
    let g:vim_addon_manager = {'shell_commands_run_method': 'system', 'auto_install': 1, 'known_repos_activation_policy': 'never'}

    " Add vim-addon-manager runtime path
    let &runtimepath.=','.g:vice.addons_dir.'/vim-addon-manager'

    " No-op but loads vam.vim, which we need done so we can override
    call vam#PluginDirFromName('github:zeekay/not-a-real-addon')

    " Override vam#PluginDirFromName
    exe "so ".g:vice.addons_dir.'/vice/autoload/addons-dir-hack.vim'

    " loop over options
    if a:0 == 1
        for key in keys(a:1)
            let g:vice[key] = a:1[key]
        endfor
    endif

    " Create ft autocommand
    au FileType * call vice#ActivateFtAddons(expand('<amatch>'))

    " Manually source vice modules, add regular addons to list of addons to be
    " activated.
    for addon in g:vice.addons
        if addon =~ '.*\:.*\/vice-'
            let dir = vice#AddonDirFromName(addon)
            let g:vice.addon_dir = dir
            try
                exe 'so '.dir.'/module.vim'
                let &rtp.=','.dir
            catch
                call vam#ActivateAddons([addon])
                exe 'so '.dir.'/module.vim'
                let &rtp.=','.dir
            endtry
        else
            call add(s:needs_activation,  addon)
        endif
    endfor

    " Activate all normal addons now
    call vam#ActivateAddons(s:needs_activation)

    for callback in s:activation_callbacks
        exe 'call '.callback.'()'
    endfor

    " Create commands
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

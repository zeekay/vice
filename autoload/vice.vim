if !exists('g:vice')
    let g:vice = {'addons': [], 'ft_addons': {}, 'commands':{}}
endif

if !exists('g:vice.loaded') || &cp
    let g:vice.loaded = 1
else
    finish
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

" Helper to activate a plugin for lazy command
func! vice#LazyInit(name, plugins, bang, ...)
    call vam#ActivateAddons(a:plugins, {'force_loading_plugins_now': 1})
    exe a:name.a:bang.' '.join(a:000)
endf

" Create lazy commands
func! vice#CreateCommand(name, plugin)
    exe 'command! -nargs=* -bang '.a:name.' call vice#LazyInit("'.a:name.'", '.string(a:plugin).', "<bang>", <f-args>)'
endf

" Simple vam wrapper, exposed for benefit of external addons
func! vice#ActivateAddons(addons)
    call vam#ActivateAddons(a:addons)
endf

" Activate plugins for a given filetype
func! vice#ActivateFtAddons(ft_addons, ft)
    for l in values(filter(copy(a:ft_addons), string(a:ft).' =~ v:key'))
        call vam#ActivateAddons(l, {'force_loading_plugins_now': 1})
    endfor
endf

" Extend vice globals, create commands and activate plugins as necessary
func! vice#Extend(config)
    call vam#ActivateAddons(a:config.addons)
    call extend(g:vice.addons, a:config.addons)

    for [key, val] in items(a:config.ft_addons)
        extend(g:vice.ft_addons[key], val)
    endfor

    for [key, val] in items(a:config.commands)
        call vice#CreateCommand(key, val)
    endfor
    call extend(g:vice.commands, a:config.commands)
endf

" Initialize vice
func! vice#Initialize()
    if !exists('g:vice.initialized')
        let g:vice.initialized = 1

        " Set addons dir
        if !exists('g:vice.addons_dir')
            " Addons dir defaults to parent directory
            let g:vice.addons_dir = expand('<sfile>:p:h:h:h')
        endif

        " Add vim-addon-manager to rtp
        let &runtimepath.=','.g:vice.addons_dir.'/vim-addon-manager'
        let g:vim_addon_manager = {
            \ 'shell_commands_run_method': 'system',
            \ 'auto_install': 1,
            \ 'known_repos_activation_policy': 'never',
        \ }

        " Redefine PluginDirFromName to use g:vice.addons_dir
        func! vam#PluginDirFromName(name)
            return g:vice.addons_dir.split(a:name, '/')[-1]
        endf

        " Sane defaults, but hey some people might disagree...
        if !exists('g:vice.assume_nothing')
            set nocompatible
            filetype indent plugin on | syn on
        endif

        " Create ft autocommand
        au FileType * call vice#ActivateFtAddons(g:vice.ft_addons, expand('<amatch>'))
    endif

    " Activate always on addons and create commands as necessary.
    call vam#ActivateAddons(g:vice.addons)

    for [key, val] in items(g:vice.commands)
        call vice#CreateCommand(key, val)
    endfor
endf

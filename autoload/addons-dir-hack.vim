" Redefine PluginDirFromName to use g:vice.addons_dir
func! vam#PluginDirFromName(name)
    if g:vice.addons_dir[len(g:vice.addons_dir) - 1] != '/'
        let g:vice.addons_dir .= '/'
    endif

    return g:vice.addons_dir.split(a:name, '/')[-1]
endf

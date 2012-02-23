" Github.com colorscheme for vim
" Maintainer: Sean Caetano Martin @xonecas
" BETA

set background=light
hi clear

if exists("syntax_on")
    syntax reset
endif

let colors_name = "github"

hi Normal                   guifg=#333333 ctermfg=236 guibg=#FFFFFF ctermbg=231
hi Comment                  guifg=#999988 ctermfg=246 guibg=#FFFFFF ctermbg=231 gui=italic
hi vimCommentTitle          guifg=#999988 ctermfg=246 guibg=#FFFFFF ctermbg=231 gui=italic
" hi Type                     ctermfg=66
hi Number                   guifg=#009999 ctermfg=30
hi String                   guifg=#DD1144 ctermfg=161
hi Boolean                  gui=bold cterm=bold
hi Identifier               guifg=#444444 ctermfg=0
hi Function                 guifg=#990000 ctermfg=124 gui=bold cterm=bold
hi Statement                guifg=#444444 ctermfg=236 gui=bold cterm=bold
hi Number                   guifg=#009999 ctermfg=30
hi Define                   guifg=#444444 ctermfg=0 gui=bold cterm=bold
hi LineNr                   guifg=#666666 ctermfg=241 guibg=#ECECEC ctermbg=7
hi Keyword                  guifg=#ff9800 gui=none      ctermfg=208
" hi Constant                 guifg=#c03000 gui=none      ctermfg=208
" hi Special                  guifg=#4bb5c1 gui=none      ctermfg=208
" hi PreProc                  guifg=#96ca2d gui=none      ctermfg=230
" hi Todo                     guifg=#fec135 guibg=#202020 gui=none
" hi Search                   guifg=#444444 guibg=#aeee00 gui=none

hi pythonDottedName         guifg=#444444 ctermfg=236 gui=none cterm=none
hi pythonDecorator          guifg=#444444 ctermfg=236 gui=none cterm=none
hi pythonBuiltinFunc        guifg=#0086B3 ctermfg=38
hi pythonSelf               guifg=#999999 ctermfg=247
hi pythonClass              guifg=#445588 gui=bold  cterm=bold    ctermfg=60
hi pythonExClass            guifg=#990000 ctermfg=124 gui=bold cterm=bold

hi javaScriptRegexpString   guifg=#009926 ctermfg=28
hi javaScriptGlobal         guifg=#000080 ctermfg=18
hi javaScriptNull           guifg=#444444 ctermfg=0 gui=bold cterm=bold
hi javaScriptOperator       guifg=#444444 ctermfg=0 gui=bold cterm=bold
hi javaScriptIdentifier     guifg=#444444 ctermfg=0 gui=bold cterm=bold
hi javaScriptType           guifg=#0086B3 ctermfg=31
hi javaScriptConditional    guifg=#444444 ctermfg=0 gui=bold cterm=bold
hi javaScriptStatement      guifg=#444444 ctermfg=0 gui=bold cterm=bold
hi javaScriptRepeat         guifg=#444444 ctermfg=0 gui=bold cterm=bold
hi javaScriptNumber         guifg=#009999 ctermfg=30

hi cssTagName               guifg=#000080 ctermfg=18
hi cssDefinition            guifg=#444444 ctermfg=0 gui=bold cterm=bold
hi cssBoxProp               guifg=#444444 ctermfg=0 gui=bold cterm=bold
hi cssBoxAttr               guifg=#444444 ctermfg=0 gui=bold cterm=bold
hi cssFontProp              guifg=#444444 ctermfg=0 gui=bold cterm=bold
hi cssTextProp              guifg=#444444 ctermfg=0 gui=bold cterm=bold
hi cssRenderProp            guifg=#444444 ctermfg=0 gui=bold cterm=bold
hi cssCommonAttr            guifg=#444444 ctermfg=0 gui=bold cterm=bold
hi cssTextAttr              guifg=#444444 ctermfg=0 gui=bold cterm=bold
hi cssRenderAttr            guifg=#444444 ctermfg=0 gui=bold cterm=bold
hi cssGeneratedContentProp  guifg=#444444 ctermfg=0 gui=bold cterm=bold
hi cssPseudoClass           guifg=#444444 ctermfg=0 gui=bold cterm=bold
hi cssPseudoClassId         guifg=#444444 ctermfg=0 gui=bold cterm=bold
hi cssColorProp             guifg=#444444 ctermfg=0 gui=bold cterm=bold
hi cssColor                 guifg=#009999 ctermfg=30
hi cssFontAttr              guifg=#444444 ctermfg=0 gui=bold cterm=bold
hi cssUIAttr                guifg=#444444 ctermfg=0 gui=bold cterm=bold
hi cssUIProp                guifg=#444444 ctermfg=0 gui=bold cterm=bold
hi cssTableProp             guifg=#444444 ctermfg=0 gui=bold cterm=bold
hi cssTableAttr             guifg=#444444 ctermfg=0 gui=bold cterm=bold
hi cssSelectorOp            guifg=#000080 ctermfg=18
hi cssAttributeSelector     guifg=#000080 ctermfg=18
hi cssGeneratedContentAttr  guifg=#444444 ctermfg=0 gui=bold cterm=bold
hi cssSelectorOp2           guifg=#444444 ctermfg=0 gui=bold cterm=bold
hi cssFontDescriptorProp    guifg=#444444 ctermfg=0 gui=bold cterm=bold
hi cssFontDescriptor        guifg=#444444 ctermfg=0 gui=bold cterm=bold
hi cssIdentifier            guifg=#990000 ctermfg=88 gui=bold
hi cssMedia                 guifg=#444444 ctermfg=0 gui=bold cterm=bold
hi cssMediaType             guifg=#444444 ctermfg=0 gui=bold cterm=bold
hi cssPagingProp            guifg=#444444 ctermfg=0 gui=bold cterm=bold
hi cssPagingAttr            guifg=#444444 ctermfg=0 gui=bold cterm=bold
hi cssImportant             guifg=#999999 ctermfg=246 gui=bold cterm=bold
hi cssUnicodeEscape         guifg=#DD1144 ctermfg=161

hi htmlTag                  guifg=#000080 ctermfg=18
hi htmlTagN                 guifg=#000080 ctermfg=18
hi htmlTagName              guifg=#000080 ctermfg=18
hi htmlEndTag               guifg=#000080 ctermfg=18
hi htmlTitle                guifg=#444444 ctermfg=0
hi htmlArg                  guifg=#009999 ctermfg=30
hi htmlSpecialTagName       guifg=#000080 ctermfg=18
hi htmlLink                 guifg=#444444 ctermfg=0 gui=none cterm=none
hi htmlH1                   guifg=#444444 ctermfg=0
hi htmlH2                   guifg=#444444 ctermfg=0
hi htmlH3                   guifg=#444444 ctermfg=0
hi htmlH4                   guifg=#444444 ctermfg=0
hi htmlH5                   guifg=#444444 ctermfg=0
hi htmlH6                   guifg=#444444 ctermfg=0

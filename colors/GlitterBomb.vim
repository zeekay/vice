" Vim color file
" Converted from Textmate theme GlitterBomb using Coloration v0.3.2 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "GlitterBomb"

hi Cursor ctermfg=NONE ctermbg=189 cterm=NONE guifg=NONE guibg=#e2e9ff gui=NONE
hi Visual ctermfg=NONE ctermbg=240 cterm=NONE guifg=NONE guibg=#5e5d5d gui=NONE
hi CursorLine ctermfg=NONE ctermbg=234 cterm=NONE guifg=NONE guibg=#1f1e1e gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=234 cterm=NONE guifg=NONE guibg=#1f1e1e gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=234 cterm=NONE guifg=NONE guibg=#1f1e1e gui=NONE
hi LineNr ctermfg=242 ctermbg=234 cterm=NONE guifg=#6d6d6d guibg=#1f1e1e gui=NONE
hi VertSplit ctermfg=238 ctermbg=238 cterm=NONE guifg=#444343 guibg=#444343 gui=NONE
hi MatchParen ctermfg=178 ctermbg=NONE cterm=bold guifg=#dbb800 guibg=NONE gui=bold
hi StatusLine ctermfg=252 ctermbg=238 cterm=bold guifg=#cfcfcf guibg=#444343 gui=bold
hi StatusLineNC ctermfg=252 ctermbg=238 cterm=NONE guifg=#cfcfcf guibg=#444343 gui=NONE
hi Pmenu ctermfg=166 ctermbg=NONE cterm=bold guifg=#e16521 guibg=NONE gui=bold
hi PmenuSel ctermfg=NONE ctermbg=240 cterm=NONE guifg=NONE guibg=#5e5d5d gui=NONE
hi IncSearch ctermfg=NONE ctermbg=52 cterm=NONE guifg=NONE guibg=#412221 gui=NONE
hi Search ctermfg=NONE ctermbg=52 cterm=NONE guifg=NONE guibg=#412221 gui=NONE
hi Directory ctermfg=143 ctermbg=NONE cterm=NONE guifg=#c0a368 guibg=NONE gui=NONE
hi Folded ctermfg=59 ctermbg=232 cterm=NONE guifg=#44444e guibg=#0b0a0a gui=NONE

hi Normal ctermfg=252 ctermbg=232 cterm=NONE guifg=#cfcfcf guibg=#0b0a0a gui=NONE
hi Boolean ctermfg=143 ctermbg=NONE cterm=NONE guifg=#c0a368 guibg=NONE gui=NONE
hi Character ctermfg=143 ctermbg=NONE cterm=NONE guifg=#c0a368 guibg=NONE gui=NONE
hi Comment ctermfg=59 ctermbg=NONE cterm=NONE guifg=#44444e guibg=NONE gui=italic
hi Conditional ctermfg=178 ctermbg=NONE cterm=bold guifg=#dbb800 guibg=NONE gui=bold
hi Constant ctermfg=143 ctermbg=NONE cterm=NONE guifg=#c0a368 guibg=NONE gui=NONE
hi Define ctermfg=178 ctermbg=NONE cterm=bold guifg=#dbb800 guibg=NONE gui=bold
hi ErrorMsg ctermfg=231 ctermbg=124 cterm=NONE guifg=#f8f8f8 guibg=#a3210c gui=NONE
hi WarningMsg ctermfg=231 ctermbg=124 cterm=NONE guifg=#f8f8f8 guibg=#a3210c gui=NONE
hi Float ctermfg=186 ctermbg=NONE cterm=NONE guifg=#d3c788 guibg=NONE gui=NONE
hi Function ctermfg=166 ctermbg=NONE cterm=bold guifg=#e16521 guibg=NONE gui=bold
hi Identifier ctermfg=228 ctermbg=NONE cterm=NONE guifg=#f6f080 guibg=NONE gui=NONE
hi Keyword ctermfg=178 ctermbg=NONE cterm=bold guifg=#dbb800 guibg=NONE gui=bold
hi Label ctermfg=59 ctermbg=NONE cterm=NONE guifg=#4d6537 guibg=NONE gui=NONE
hi NonText ctermfg=238 ctermbg=233 cterm=NONE guifg=#484848 guibg=#151414 gui=NONE
hi Number ctermfg=186 ctermbg=NONE cterm=NONE guifg=#d3c788 guibg=NONE gui=NONE
hi Operator ctermfg=101 ctermbg=NONE cterm=NONE guifg=#988155 guibg=NONE gui=NONE
hi PreProc ctermfg=178 ctermbg=NONE cterm=bold guifg=#dbb800 guibg=NONE gui=bold
hi Special ctermfg=252 ctermbg=NONE cterm=NONE guifg=#cfcfcf guibg=NONE gui=NONE
hi SpecialKey ctermfg=238 ctermbg=234 cterm=NONE guifg=#484848 guibg=#1f1e1e gui=NONE
hi Statement ctermfg=178 ctermbg=NONE cterm=bold guifg=#dbb800 guibg=NONE gui=bold
hi StorageClass ctermfg=228 ctermbg=NONE cterm=NONE guifg=#f6f080 guibg=NONE gui=NONE
hi String ctermfg=59 ctermbg=NONE cterm=NONE guifg=#4d6537 guibg=NONE gui=NONE
hi Tag ctermfg=166 ctermbg=NONE cterm=bold guifg=#e16521 guibg=NONE gui=bold
hi Title ctermfg=252 ctermbg=NONE cterm=bold guifg=#cfcfcf guibg=NONE gui=bold
hi Todo ctermfg=59 ctermbg=NONE cterm=inverse,bold guifg=#44444e guibg=NONE gui=inverse,bold,italic
hi Type ctermfg=166 ctermbg=NONE cterm=bold guifg=#e16521 guibg=NONE gui=bold
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi rubyClass ctermfg=178 ctermbg=NONE cterm=bold guifg=#dbb800 guibg=NONE gui=bold
hi rubyFunction ctermfg=166 ctermbg=NONE cterm=bold guifg=#e16521 guibg=NONE gui=bold
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubySymbol ctermfg=143 ctermbg=NONE cterm=NONE guifg=#c0a368 guibg=NONE gui=NONE
hi rubyConstant ctermfg=95 ctermbg=NONE cterm=NONE guifg=#7d6c55 guibg=NONE gui=NONE
hi rubyStringDelimiter ctermfg=59 ctermbg=NONE cterm=NONE guifg=#4d6537 guibg=NONE gui=NONE
hi rubyBlockParameter ctermfg=131 ctermbg=NONE cterm=NONE guifg=#ae5251 guibg=NONE gui=NONE
hi rubyInstanceVariable ctermfg=131 ctermbg=NONE cterm=NONE guifg=#ae5251 guibg=NONE gui=NONE
hi rubyInclude ctermfg=178 ctermbg=NONE cterm=bold guifg=#dbb800 guibg=NONE gui=bold
hi rubyGlobalVariable ctermfg=131 ctermbg=NONE cterm=NONE guifg=#ae5251 guibg=NONE gui=NONE
hi rubyRegexp ctermfg=58 ctermbg=NONE cterm=NONE guifg=#364627 guibg=NONE gui=NONE
hi rubyRegexpDelimiter ctermfg=58 ctermbg=NONE cterm=NONE guifg=#364627 guibg=NONE gui=NONE
hi rubyEscape ctermfg=143 ctermbg=NONE cterm=NONE guifg=#c0a368 guibg=NONE gui=NONE
hi rubyControl ctermfg=178 ctermbg=NONE cterm=bold guifg=#dbb800 guibg=NONE gui=bold
hi rubyClassVariable ctermfg=131 ctermbg=NONE cterm=NONE guifg=#ae5251 guibg=NONE gui=NONE
hi rubyOperator ctermfg=101 ctermbg=NONE cterm=NONE guifg=#988155 guibg=NONE gui=NONE
hi rubyException ctermfg=178 ctermbg=NONE cterm=bold guifg=#dbb800 guibg=NONE gui=bold
hi rubyPseudoVariable ctermfg=131 ctermbg=NONE cterm=NONE guifg=#ae5251 guibg=NONE gui=NONE
hi rubyRailsUserClass ctermfg=95 ctermbg=NONE cterm=NONE guifg=#7d6c55 guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod ctermfg=94 ctermbg=NONE cterm=NONE guifg=#935e29 guibg=NONE gui=NONE
hi rubyRailsARMethod ctermfg=94 ctermbg=NONE cterm=NONE guifg=#935e29 guibg=NONE gui=NONE
hi rubyRailsRenderMethod ctermfg=94 ctermbg=NONE cterm=NONE guifg=#935e29 guibg=NONE gui=NONE
hi rubyRailsMethod ctermfg=94 ctermbg=NONE cterm=NONE guifg=#935e29 guibg=NONE gui=NONE
hi erubyDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi erubyComment ctermfg=59 ctermbg=NONE cterm=NONE guifg=#44444e guibg=NONE gui=italic
hi erubyRailsMethod ctermfg=94 ctermbg=NONE cterm=NONE guifg=#935e29 guibg=NONE gui=NONE
hi htmlTag ctermfg=153 ctermbg=NONE cterm=NONE guifg=#aad7ef guibg=NONE gui=NONE
hi htmlEndTag ctermfg=153 ctermbg=NONE cterm=NONE guifg=#aad7ef guibg=NONE gui=NONE
hi htmlTagName ctermfg=153 ctermbg=NONE cterm=NONE guifg=#aad7ef guibg=NONE gui=NONE
hi htmlArg ctermfg=153 ctermbg=NONE cterm=NONE guifg=#aad7ef guibg=NONE gui=NONE
hi htmlSpecialChar ctermfg=143 ctermbg=NONE cterm=NONE guifg=#c0a368 guibg=NONE gui=NONE
hi javaScriptFunction ctermfg=228 ctermbg=NONE cterm=NONE guifg=#f6f080 guibg=NONE gui=NONE
hi javaScriptRailsFunction ctermfg=94 ctermbg=NONE cterm=NONE guifg=#935e29 guibg=NONE gui=NONE
hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlKey ctermfg=166 ctermbg=NONE cterm=bold guifg=#e16521 guibg=NONE gui=bold
hi yamlAnchor ctermfg=131 ctermbg=NONE cterm=NONE guifg=#ae5251 guibg=NONE gui=NONE
hi yamlAlias ctermfg=131 ctermbg=NONE cterm=NONE guifg=#ae5251 guibg=NONE gui=NONE
hi yamlDocumentHeader ctermfg=59 ctermbg=NONE cterm=NONE guifg=#4d6537 guibg=NONE gui=NONE
hi cssURL ctermfg=131 ctermbg=NONE cterm=NONE guifg=#ae5251 guibg=NONE gui=NONE
hi cssFunctionName ctermfg=94 ctermbg=NONE cterm=NONE guifg=#935e29 guibg=NONE gui=NONE
hi cssColor ctermfg=143 ctermbg=NONE cterm=NONE guifg=#c0a368 guibg=NONE gui=NONE
hi cssPseudoClassId ctermfg=166 ctermbg=NONE cterm=bold guifg=#e16521 guibg=NONE gui=bold
hi cssClassName ctermfg=166 ctermbg=NONE cterm=bold guifg=#e16521 guibg=NONE gui=bold
hi cssValueLength ctermfg=186 ctermbg=NONE cterm=NONE guifg=#d3c788 guibg=NONE gui=NONE
hi cssCommonAttr ctermfg=179 ctermbg=NONE cterm=NONE guifg=#ebac47 guibg=NONE gui=NONE
hi cssBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
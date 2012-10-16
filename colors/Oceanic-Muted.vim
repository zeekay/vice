" Vim color file
" Converted from Textmate theme Oceanic — Muted using Coloration v0.3.2 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "Oceanic — Muted"

hi Cursor ctermfg=17 ctermbg=231 cterm=NONE guifg=#1b2630 guibg=#f8f8f0 gui=NONE
hi Visual ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#37434b gui=NONE
hi CursorLine ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#313b43 gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#313b43 gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#313b43 gui=NONE
hi LineNr ctermfg=102 ctermbg=59 cterm=NONE guifg=#8a8f91 guibg=#313b43 gui=NONE
hi VertSplit ctermfg=59 ctermbg=59 cterm=NONE guifg=#5b6368 guibg=#5b6368 gui=NONE
hi MatchParen ctermfg=131 ctermbg=NONE cterm=underline guifg=#b0666b guibg=NONE gui=underline
hi StatusLine ctermfg=231 ctermbg=59 cterm=bold guifg=#f8f8f2 guibg=#5b6368 gui=bold
hi StatusLineNC ctermfg=231 ctermbg=59 cterm=NONE guifg=#f8f8f2 guibg=#5b6368 gui=NONE
hi Pmenu ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#37434b gui=NONE
hi IncSearch ctermfg=17 ctermbg=73 cterm=NONE guifg=#1b2630 guibg=#6da8c0 gui=NONE
hi Search ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi Directory ctermfg=67 ctermbg=NONE cterm=NONE guifg=#6096ab guibg=NONE gui=NONE
hi Folded ctermfg=249 ctermbg=17 cterm=NONE guifg=#aeaeae guibg=#1b2630 gui=NONE

hi Normal ctermfg=231 ctermbg=17 cterm=NONE guifg=#f8f8f2 guibg=#1b2630 gui=NONE
hi Boolean ctermfg=67 ctermbg=NONE cterm=NONE guifg=#6096ab guibg=NONE gui=NONE
hi Character ctermfg=67 ctermbg=NONE cterm=NONE guifg=#6096ab guibg=NONE gui=NONE
hi Comment ctermfg=249 ctermbg=NONE cterm=NONE guifg=#aeaeae guibg=NONE gui=NONE
hi Conditional ctermfg=131 ctermbg=NONE cterm=NONE guifg=#b0666b guibg=NONE gui=NONE
hi Constant ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Define ctermfg=131 ctermbg=NONE cterm=NONE guifg=#b0666b guibg=NONE gui=NONE
hi DiffAdd ctermfg=231 ctermbg=64 cterm=bold guifg=#f8f8f2 guibg=#44830e gui=bold
hi DiffDelete ctermfg=88 ctermbg=NONE cterm=NONE guifg=#89080a guibg=NONE gui=NONE
hi DiffChange ctermfg=231 ctermbg=23 cterm=NONE guifg=#f8f8f2 guibg=#1e385c gui=NONE
hi DiffText ctermfg=231 ctermbg=24 cterm=bold guifg=#f8f8f2 guibg=#204a87 gui=bold
hi ErrorMsg ctermfg=231 ctermbg=167 cterm=NONE guifg=#f8f8f0 guibg=#d95757 gui=NONE
hi WarningMsg ctermfg=231 ctermbg=167 cterm=NONE guifg=#f8f8f0 guibg=#d95757 gui=NONE
hi Float ctermfg=67 ctermbg=NONE cterm=NONE guifg=#618da5 guibg=NONE gui=NONE
hi Function ctermfg=139 ctermbg=NONE cterm=NONE guifg=#ba88bb guibg=NONE gui=NONE
hi Identifier ctermfg=96 ctermbg=NONE cterm=NONE guifg=#896399 guibg=NONE gui=italic
hi Keyword ctermfg=131 ctermbg=NONE cterm=NONE guifg=#b0666b guibg=NONE gui=NONE
hi Label ctermfg=73 ctermbg=NONE cterm=NONE guifg=#6da8c0 guibg=NONE gui=NONE
hi NonText ctermfg=59 ctermbg=23 cterm=NONE guifg=#546a68 guibg=#26313a gui=NONE
hi Number ctermfg=67 ctermbg=NONE cterm=NONE guifg=#618da5 guibg=NONE gui=NONE
hi Operator ctermfg=131 ctermbg=NONE cterm=NONE guifg=#b0666b guibg=NONE gui=NONE
hi PreProc ctermfg=131 ctermbg=NONE cterm=NONE guifg=#b0666b guibg=NONE gui=NONE
hi Special ctermfg=231 ctermbg=NONE cterm=NONE guifg=#f8f8f2 guibg=NONE gui=NONE
hi SpecialKey ctermfg=59 ctermbg=59 cterm=NONE guifg=#546a68 guibg=#313b43 gui=NONE
hi Statement ctermfg=131 ctermbg=NONE cterm=NONE guifg=#b0666b guibg=NONE gui=NONE
hi StorageClass ctermfg=96 ctermbg=NONE cterm=NONE guifg=#896399 guibg=NONE gui=italic
hi String ctermfg=73 ctermbg=NONE cterm=NONE guifg=#6da8c0 guibg=NONE gui=NONE
hi Tag ctermfg=107 ctermbg=NONE cterm=NONE guifg=#91b46d guibg=NONE gui=NONE
hi Title ctermfg=231 ctermbg=NONE cterm=bold guifg=#f8f8f2 guibg=NONE gui=bold
hi Todo ctermfg=249 ctermbg=NONE cterm=inverse,bold guifg=#aeaeae guibg=NONE gui=inverse,bold
hi Type ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi rubyClass ctermfg=131 ctermbg=NONE cterm=NONE guifg=#b0666b guibg=NONE gui=NONE
hi rubyFunction ctermfg=139 ctermbg=NONE cterm=NONE guifg=#ba88bb guibg=NONE gui=NONE
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubySymbol ctermfg=67 ctermbg=NONE cterm=NONE guifg=#6096ab guibg=NONE gui=NONE
hi rubyConstant ctermfg=150 ctermbg=NONE cterm=bold guifg=#bec484 guibg=NONE gui=bold
hi rubyStringDelimiter ctermfg=73 ctermbg=NONE cterm=NONE guifg=#6da8c0 guibg=NONE gui=NONE
hi rubyBlockParameter ctermfg=144 ctermbg=NONE cterm=NONE guifg=#c4a587 guibg=NONE gui=italic
hi rubyInstanceVariable ctermfg=137 ctermbg=NONE cterm=NONE guifg=#b88d56 guibg=NONE gui=NONE
hi rubyInclude ctermfg=131 ctermbg=NONE cterm=NONE guifg=#b0666b guibg=NONE gui=NONE
hi rubyGlobalVariable ctermfg=137 ctermbg=NONE cterm=NONE guifg=#b88d56 guibg=NONE gui=NONE
hi rubyRegexp ctermfg=73 ctermbg=NONE cterm=NONE guifg=#6da8c0 guibg=NONE gui=NONE
hi rubyRegexpDelimiter ctermfg=73 ctermbg=NONE cterm=NONE guifg=#6da8c0 guibg=NONE gui=NONE
hi rubyEscape ctermfg=67 ctermbg=NONE cterm=NONE guifg=#6096ab guibg=NONE gui=NONE
hi rubyControl ctermfg=131 ctermbg=NONE cterm=NONE guifg=#b0666b guibg=NONE gui=NONE
hi rubyClassVariable ctermfg=137 ctermbg=NONE cterm=NONE guifg=#b88d56 guibg=NONE gui=NONE
hi rubyOperator ctermfg=131 ctermbg=NONE cterm=NONE guifg=#b0666b guibg=NONE gui=NONE
hi rubyException ctermfg=131 ctermbg=NONE cterm=NONE guifg=#b0666b guibg=NONE gui=NONE
hi rubyPseudoVariable ctermfg=137 ctermbg=NONE cterm=NONE guifg=#b88d56 guibg=NONE gui=NONE
hi rubyRailsUserClass ctermfg=150 ctermbg=NONE cterm=bold guifg=#bec484 guibg=NONE gui=bold
hi rubyRailsARAssociationMethod ctermfg=137 ctermbg=NONE cterm=NONE guifg=#c48e58 guibg=NONE gui=NONE
hi rubyRailsARMethod ctermfg=137 ctermbg=NONE cterm=NONE guifg=#c48e58 guibg=NONE gui=NONE
hi rubyRailsRenderMethod ctermfg=137 ctermbg=NONE cterm=NONE guifg=#c48e58 guibg=NONE gui=NONE
hi rubyRailsMethod ctermfg=137 ctermbg=NONE cterm=NONE guifg=#c48e58 guibg=NONE gui=NONE
hi erubyDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi erubyComment ctermfg=249 ctermbg=NONE cterm=NONE guifg=#aeaeae guibg=NONE gui=NONE
hi erubyRailsMethod ctermfg=137 ctermbg=NONE cterm=NONE guifg=#c48e58 guibg=NONE gui=NONE
hi htmlTag ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlEndTag ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlTagName ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlArg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlSpecialChar ctermfg=67 ctermbg=NONE cterm=NONE guifg=#6096ab guibg=NONE gui=NONE
hi javaScriptFunction ctermfg=96 ctermbg=NONE cterm=NONE guifg=#896399 guibg=NONE gui=italic
hi javaScriptRailsFunction ctermfg=137 ctermbg=NONE cterm=NONE guifg=#c48e58 guibg=NONE gui=NONE
hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlKey ctermfg=107 ctermbg=NONE cterm=NONE guifg=#91b46d guibg=NONE gui=NONE
hi yamlAnchor ctermfg=137 ctermbg=NONE cterm=NONE guifg=#b88d56 guibg=NONE gui=NONE
hi yamlAlias ctermfg=137 ctermbg=NONE cterm=NONE guifg=#b88d56 guibg=NONE gui=NONE
hi yamlDocumentHeader ctermfg=73 ctermbg=NONE cterm=NONE guifg=#6da8c0 guibg=NONE gui=NONE
hi cssURL ctermfg=67 ctermbg=NONE cterm=NONE guifg=#6299ae guibg=NONE gui=NONE
hi cssFunctionName ctermfg=144 ctermbg=NONE cterm=NONE guifg=#c4a587 guibg=NONE gui=NONE
hi cssColor ctermfg=67 ctermbg=NONE cterm=NONE guifg=#6096ab guibg=NONE gui=NONE
hi cssPseudoClassId ctermfg=72 ctermbg=NONE cterm=NONE guifg=#74b477 guibg=NONE gui=italic
hi cssClassName ctermfg=107 ctermbg=NONE cterm=bold guifg=#91b46d guibg=NONE gui=bold
hi cssValueLength ctermfg=73 ctermbg=NONE cterm=NONE guifg=#6da8c0 guibg=NONE gui=NONE
hi cssCommonAttr ctermfg=144 ctermbg=NONE cterm=NONE guifg=#c4a587 guibg=NONE gui=NONE
hi cssBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
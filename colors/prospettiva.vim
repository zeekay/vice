" Vim color file
" Converted from Textmate theme Prospettiva using Coloration v0.3.2 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "prospettiva"

hi Cursor ctermfg=231 ctermbg=59 cterm=NONE guifg=#fffefa guibg=#635b4e gui=NONE
hi Visual ctermfg=NONE ctermbg=228 cterm=NONE guifg=NONE guibg=#fefe96 gui=NONE
hi CursorLine ctermfg=NONE ctermbg=230 cterm=NONE guifg=NONE guibg=#f1f0ea gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=230 cterm=NONE guifg=NONE guibg=#f1f0ea gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=230 cterm=NONE guifg=NONE guibg=#f1f0ea gui=NONE
hi LineNr ctermfg=145 ctermbg=230 cterm=NONE guifg=#bab7aa guibg=#f1f0ea gui=NONE
hi VertSplit ctermfg=188 ctermbg=188 cterm=NONE guifg=#d7d5cc guibg=#d7d5cc gui=NONE
hi MatchParen ctermfg=137 ctermbg=NONE cterm=underline guifg=#b3935c guibg=NONE gui=underline
hi StatusLine ctermfg=95 ctermbg=188 cterm=bold guifg=#746f5a guibg=#d7d5cc gui=bold
hi StatusLineNC ctermfg=95 ctermbg=188 cterm=NONE guifg=#746f5a guibg=#d7d5cc gui=NONE
hi Pmenu ctermfg=95 ctermbg=NONE cterm=NONE guifg=#785333 guibg=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=228 cterm=NONE guifg=NONE guibg=#fefe96 gui=NONE
hi IncSearch ctermfg=231 ctermbg=107 cterm=NONE guifg=#fffefa guibg=#7ca563 gui=NONE
hi Search ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi Directory ctermfg=167 ctermbg=NONE cterm=NONE guifg=#da5659 guibg=NONE gui=NONE
hi Folded ctermfg=249 ctermbg=231 cterm=NONE guifg=#b3b3b3 guibg=#fffefa gui=NONE

hi Normal ctermfg=95 ctermbg=231 cterm=NONE guifg=#746f5a guibg=#fffefa gui=NONE
hi Boolean ctermfg=167 ctermbg=NONE cterm=NONE guifg=#da5659 guibg=NONE gui=NONE
hi Character ctermfg=167 ctermbg=NONE cterm=NONE guifg=#da5659 guibg=NONE gui=NONE
hi Comment ctermfg=249 ctermbg=231 cterm=NONE guifg=#b3b3b3 guibg=#fffefa gui=NONE
hi Conditional ctermfg=137 ctermbg=NONE cterm=NONE guifg=#b3935c guibg=NONE gui=NONE
hi Constant ctermfg=167 ctermbg=NONE cterm=NONE guifg=#da5659 guibg=NONE gui=NONE
hi Define ctermfg=137 ctermbg=NONE cterm=NONE guifg=#b3935c guibg=NONE gui=NONE
hi DiffAdd ctermfg=95 ctermbg=149 cterm=bold guifg=#746f5a guibg=#a1e85c gui=bold
hi DiffDelete ctermfg=203 ctermbg=NONE cterm=NONE guifg=#f25453 guibg=NONE gui=NONE
hi DiffChange ctermfg=95 ctermbg=152 cterm=NONE guifg=#746f5a guibg=#b9cfe4 gui=NONE
hi DiffText ctermfg=95 ctermbg=74 cterm=bold guifg=#746f5a guibg=#729fcf gui=bold
hi ErrorMsg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi WarningMsg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Float ctermfg=167 ctermbg=NONE cterm=NONE guifg=#da5659 guibg=NONE gui=NONE
hi Function ctermfg=95 ctermbg=NONE cterm=NONE guifg=#785333 guibg=NONE gui=NONE
hi Identifier ctermfg=142 ctermbg=NONE cterm=NONE guifg=#b3ac00 guibg=NONE gui=NONE
hi Keyword ctermfg=137 ctermbg=NONE cterm=NONE guifg=#b3935c guibg=NONE gui=NONE
hi Label ctermfg=107 ctermbg=NONE cterm=NONE guifg=#7ca563 guibg=NONE gui=NONE
hi NonText ctermfg=231 ctermbg=231 cterm=NONE guifg=#fffefb guibg=#f8f7f2 gui=NONE
hi Number ctermfg=167 ctermbg=NONE cterm=NONE guifg=#da5659 guibg=NONE gui=NONE
hi Operator ctermfg=137 ctermbg=NONE cterm=NONE guifg=#b3935c guibg=NONE gui=NONE
hi PreProc ctermfg=137 ctermbg=NONE cterm=NONE guifg=#b3935c guibg=NONE gui=NONE
hi Special ctermfg=95 ctermbg=NONE cterm=NONE guifg=#746f5a guibg=NONE gui=NONE
hi SpecialKey ctermfg=231 ctermbg=230 cterm=NONE guifg=#fffefb guibg=#f1f0ea gui=NONE
hi Statement ctermfg=137 ctermbg=NONE cterm=NONE guifg=#b3935c guibg=NONE gui=NONE
hi StorageClass ctermfg=142 ctermbg=NONE cterm=NONE guifg=#b3ac00 guibg=NONE gui=NONE
hi String ctermfg=107 ctermbg=NONE cterm=NONE guifg=#7ca563 guibg=NONE gui=NONE
hi Tag ctermfg=95 ctermbg=NONE cterm=NONE guifg=#785333 guibg=NONE gui=NONE
hi Title ctermfg=95 ctermbg=NONE cterm=bold guifg=#746f5a guibg=NONE gui=bold
hi Todo ctermfg=249 ctermbg=231 cterm=inverse,bold guifg=#b3b3b3 guibg=#fffefa gui=inverse,bold
hi Type ctermfg=95 ctermbg=NONE cterm=NONE guifg=#785333 guibg=NONE gui=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi rubyClass ctermfg=137 ctermbg=NONE cterm=NONE guifg=#b3935c guibg=NONE gui=NONE
hi rubyFunction ctermfg=95 ctermbg=NONE cterm=NONE guifg=#785333 guibg=NONE gui=NONE
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubySymbol ctermfg=167 ctermbg=NONE cterm=NONE guifg=#da5659 guibg=NONE gui=NONE
hi rubyConstant ctermfg=139 ctermbg=NONE cterm=NONE guifg=#a8799c guibg=NONE gui=NONE
hi rubyStringDelimiter ctermfg=107 ctermbg=NONE cterm=NONE guifg=#7ca563 guibg=NONE gui=NONE
hi rubyBlockParameter ctermfg=66 ctermbg=NONE cterm=NONE guifg=#73948f guibg=NONE gui=NONE
hi rubyInstanceVariable ctermfg=66 ctermbg=NONE cterm=NONE guifg=#73948f guibg=NONE gui=NONE
hi rubyInclude ctermfg=137 ctermbg=NONE cterm=NONE guifg=#b3935c guibg=NONE gui=NONE
hi rubyGlobalVariable ctermfg=66 ctermbg=NONE cterm=NONE guifg=#73948f guibg=NONE gui=NONE
hi rubyRegexp ctermfg=179 ctermbg=NONE cterm=NONE guifg=#e9c062 guibg=NONE gui=NONE
hi rubyRegexpDelimiter ctermfg=179 ctermbg=NONE cterm=NONE guifg=#e9c062 guibg=NONE gui=NONE
hi rubyEscape ctermfg=167 ctermbg=NONE cterm=NONE guifg=#da5659 guibg=NONE gui=NONE
hi rubyControl ctermfg=137 ctermbg=NONE cterm=NONE guifg=#b3935c guibg=NONE gui=NONE
hi rubyClassVariable ctermfg=66 ctermbg=NONE cterm=NONE guifg=#73948f guibg=NONE gui=NONE
hi rubyOperator ctermfg=137 ctermbg=NONE cterm=NONE guifg=#b3935c guibg=NONE gui=NONE
hi rubyException ctermfg=137 ctermbg=NONE cterm=NONE guifg=#b3935c guibg=NONE gui=NONE
hi rubyPseudoVariable ctermfg=66 ctermbg=NONE cterm=NONE guifg=#73948f guibg=NONE gui=NONE
hi rubyRailsUserClass ctermfg=139 ctermbg=NONE cterm=NONE guifg=#a8799c guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod ctermfg=137 ctermbg=NONE cterm=NONE guifg=#c29863 guibg=NONE gui=NONE
hi rubyRailsARMethod ctermfg=137 ctermbg=NONE cterm=NONE guifg=#c29863 guibg=NONE gui=NONE
hi rubyRailsRenderMethod ctermfg=137 ctermbg=NONE cterm=NONE guifg=#c29863 guibg=NONE gui=NONE
hi rubyRailsMethod ctermfg=137 ctermbg=NONE cterm=NONE guifg=#c29863 guibg=NONE gui=NONE
hi erubyDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi erubyComment ctermfg=249 ctermbg=231 cterm=NONE guifg=#b3b3b3 guibg=#fffefa gui=NONE
hi erubyRailsMethod ctermfg=137 ctermbg=NONE cterm=NONE guifg=#c29863 guibg=NONE gui=NONE
hi htmlTag ctermfg=137 ctermbg=NONE cterm=NONE guifg=#9f785b guibg=NONE gui=NONE
hi htmlEndTag ctermfg=137 ctermbg=NONE cterm=NONE guifg=#9f785b guibg=NONE gui=NONE
hi htmlTagName ctermfg=137 ctermbg=NONE cterm=NONE guifg=#9f785b guibg=NONE gui=NONE
hi htmlArg ctermfg=137 ctermbg=NONE cterm=NONE guifg=#9f785b guibg=NONE gui=NONE
hi htmlSpecialChar ctermfg=167 ctermbg=NONE cterm=NONE guifg=#da5659 guibg=NONE gui=NONE
hi javaScriptFunction ctermfg=142 ctermbg=NONE cterm=NONE guifg=#b3ac00 guibg=NONE gui=NONE
hi javaScriptRailsFunction ctermfg=137 ctermbg=NONE cterm=NONE guifg=#c29863 guibg=NONE gui=NONE
hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlKey ctermfg=95 ctermbg=NONE cterm=NONE guifg=#785333 guibg=NONE gui=NONE
hi yamlAnchor ctermfg=66 ctermbg=NONE cterm=NONE guifg=#73948f guibg=NONE gui=NONE
hi yamlAlias ctermfg=66 ctermbg=NONE cterm=NONE guifg=#73948f guibg=NONE gui=NONE
hi yamlDocumentHeader ctermfg=107 ctermbg=NONE cterm=NONE guifg=#7ca563 guibg=NONE gui=NONE
hi cssURL ctermfg=66 ctermbg=NONE cterm=NONE guifg=#73948f guibg=NONE gui=NONE
hi cssFunctionName ctermfg=137 ctermbg=NONE cterm=NONE guifg=#c29863 guibg=NONE gui=NONE
hi cssColor ctermfg=167 ctermbg=NONE cterm=NONE guifg=#da5659 guibg=NONE gui=NONE
hi cssPseudoClassId ctermfg=95 ctermbg=NONE cterm=NONE guifg=#785333 guibg=NONE gui=NONE
hi cssClassName ctermfg=95 ctermbg=NONE cterm=NONE guifg=#785333 guibg=NONE gui=NONE
hi cssValueLength ctermfg=167 ctermbg=NONE cterm=NONE guifg=#da5659 guibg=NONE gui=NONE
hi cssCommonAttr ctermfg=167 ctermbg=NONE cterm=NONE guifg=#d77261 guibg=NONE gui=NONE
hi cssBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE

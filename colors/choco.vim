" Vim color file
" Converted from Textmate theme choco using Coloration v0.3.2 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "choco"

hi Cursor ctermfg=NONE ctermbg=248 cterm=NONE guifg=NONE guibg=#a7a7a7 gui=NONE
hi Visual ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#636368 gui=NONE
hi CursorLine ctermfg=NONE ctermbg=16 cterm=NONE guifg=NONE guibg=#291e1a gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=16 cterm=NONE guifg=NONE guibg=#291e1a gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=16 cterm=NONE guifg=NONE guibg=#291e1a gui=NONE
hi LineNr ctermfg=59 ctermbg=16 cterm=NONE guifg=#6e6552 guibg=#291e1a gui=NONE
hi VertSplit ctermfg=59 ctermbg=59 cterm=NONE guifg=#4a4035 guibg=#4a4035 gui=NONE
hi MatchParen ctermfg=137 ctermbg=NONE cterm=NONE guifg=#b3935c guibg=NONE gui=NONE
hi StatusLine ctermfg=144 ctermbg=59 cterm=bold guifg=#c3be98 guibg=#4a4035 gui=bold
hi StatusLineNC ctermfg=144 ctermbg=59 cterm=NONE guifg=#c3be98 guibg=#4a4035 gui=NONE
hi Pmenu ctermfg=58 ctermbg=NONE cterm=NONE guifg=#6d4c2f guibg=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#636368 gui=NONE
hi IncSearch ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#38353f gui=NONE
hi Search ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#38353f gui=NONE
hi Directory ctermfg=167 ctermbg=NONE cterm=NONE guifg=#da5659 guibg=NONE gui=NONE
hi Folded ctermfg=71 ctermbg=16 cterm=NONE guifg=#679d47 guibg=#180c0c gui=NONE

hi Normal ctermfg=144 ctermbg=16 cterm=NONE guifg=#c3be98 guibg=#180c0c gui=NONE
hi Boolean ctermfg=167 ctermbg=NONE cterm=NONE guifg=#da5659 guibg=NONE gui=NONE
hi Character ctermfg=167 ctermbg=NONE cterm=NONE guifg=#da5659 guibg=NONE gui=NONE
hi Comment ctermfg=71 ctermbg=16 cterm=NONE guifg=#679d47 guibg=#180c0c gui=NONE
hi Conditional ctermfg=137 ctermbg=NONE cterm=NONE guifg=#b3935c guibg=NONE gui=NONE
hi Constant ctermfg=167 ctermbg=NONE cterm=NONE guifg=#da5659 guibg=NONE gui=NONE
hi Define ctermfg=137 ctermbg=NONE cterm=NONE guifg=#b3935c guibg=NONE gui=NONE
hi ErrorMsg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi WarningMsg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Float ctermfg=167 ctermbg=NONE cterm=NONE guifg=#da5659 guibg=NONE gui=NONE
hi Function ctermfg=58 ctermbg=NONE cterm=NONE guifg=#6d4c2f guibg=NONE gui=NONE
hi Identifier ctermfg=222 ctermbg=NONE cterm=NONE guifg=#f1e694 guibg=NONE gui=NONE
hi Keyword ctermfg=137 ctermbg=NONE cterm=NONE guifg=#b3935c guibg=NONE gui=NONE
hi Label ctermfg=107 ctermbg=NONE cterm=NONE guifg=#7ca563 guibg=NONE gui=NONE
hi NonText ctermfg=59 ctermbg=16 cterm=NONE guifg=#524949 guibg=#211513 gui=NONE
hi Number ctermfg=167 ctermbg=NONE cterm=NONE guifg=#da5659 guibg=NONE gui=NONE
hi Operator ctermfg=137 ctermbg=NONE cterm=NONE guifg=#b3935c guibg=NONE gui=NONE
hi PreProc ctermfg=137 ctermbg=NONE cterm=NONE guifg=#b3935c guibg=NONE gui=NONE
hi Special ctermfg=144 ctermbg=NONE cterm=NONE guifg=#c3be98 guibg=NONE gui=NONE
hi SpecialKey ctermfg=59 ctermbg=16 cterm=NONE guifg=#524949 guibg=#291e1a gui=NONE
hi Statement ctermfg=137 ctermbg=NONE cterm=NONE guifg=#b3935c guibg=NONE gui=NONE
hi StorageClass ctermfg=222 ctermbg=NONE cterm=NONE guifg=#f1e694 guibg=NONE gui=NONE
hi String ctermfg=107 ctermbg=NONE cterm=NONE guifg=#7ca563 guibg=NONE gui=NONE
hi Tag ctermfg=58 ctermbg=NONE cterm=NONE guifg=#6d4c2f guibg=NONE gui=NONE
hi Title ctermfg=144 ctermbg=NONE cterm=bold guifg=#c3be98 guibg=NONE gui=bold
hi Todo ctermfg=71 ctermbg=16 cterm=inverse,bold guifg=#679d47 guibg=#180c0c gui=inverse,bold
hi Type ctermfg=58 ctermbg=NONE cterm=NONE guifg=#6d4c2f guibg=NONE gui=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi rubyClass ctermfg=137 ctermbg=NONE cterm=NONE guifg=#b3935c guibg=NONE gui=NONE
hi rubyFunction ctermfg=58 ctermbg=NONE cterm=NONE guifg=#6d4c2f guibg=NONE gui=NONE
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubySymbol ctermfg=167 ctermbg=NONE cterm=NONE guifg=#da5659 guibg=NONE gui=NONE
hi rubyConstant ctermfg=139 ctermbg=NONE cterm=NONE guifg=#a8799c guibg=NONE gui=NONE
hi rubyStringDelimiter ctermfg=107 ctermbg=NONE cterm=NONE guifg=#7ca563 guibg=NONE gui=NONE
hi rubyBlockParameter ctermfg=103 ctermbg=NONE cterm=NONE guifg=#7989a6 guibg=NONE gui=NONE
hi rubyInstanceVariable ctermfg=103 ctermbg=NONE cterm=NONE guifg=#7989a6 guibg=NONE gui=NONE
hi rubyInclude ctermfg=137 ctermbg=NONE cterm=NONE guifg=#b3935c guibg=NONE gui=NONE
hi rubyGlobalVariable ctermfg=103 ctermbg=NONE cterm=NONE guifg=#7989a6 guibg=NONE gui=NONE
hi rubyRegexp ctermfg=179 ctermbg=NONE cterm=NONE guifg=#e9c062 guibg=NONE gui=NONE
hi rubyRegexpDelimiter ctermfg=179 ctermbg=NONE cterm=NONE guifg=#e9c062 guibg=NONE gui=NONE
hi rubyEscape ctermfg=167 ctermbg=NONE cterm=NONE guifg=#da5659 guibg=NONE gui=NONE
hi rubyControl ctermfg=137 ctermbg=NONE cterm=NONE guifg=#b3935c guibg=NONE gui=NONE
hi rubyClassVariable ctermfg=103 ctermbg=NONE cterm=NONE guifg=#7989a6 guibg=NONE gui=NONE
hi rubyOperator ctermfg=137 ctermbg=NONE cterm=NONE guifg=#b3935c guibg=NONE gui=NONE
hi rubyException ctermfg=137 ctermbg=NONE cterm=NONE guifg=#b3935c guibg=NONE gui=NONE
hi rubyPseudoVariable ctermfg=103 ctermbg=NONE cterm=NONE guifg=#7989a6 guibg=NONE gui=NONE
hi rubyRailsUserClass ctermfg=139 ctermbg=NONE cterm=NONE guifg=#a8799c guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod ctermfg=137 ctermbg=NONE cterm=NONE guifg=#c29863 guibg=NONE gui=NONE
hi rubyRailsARMethod ctermfg=137 ctermbg=NONE cterm=NONE guifg=#c29863 guibg=NONE gui=NONE
hi rubyRailsRenderMethod ctermfg=137 ctermbg=NONE cterm=NONE guifg=#c29863 guibg=NONE gui=NONE
hi rubyRailsMethod ctermfg=137 ctermbg=NONE cterm=NONE guifg=#c29863 guibg=NONE gui=NONE
hi erubyDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi erubyComment ctermfg=71 ctermbg=16 cterm=NONE guifg=#679d47 guibg=#180c0c gui=NONE
hi erubyRailsMethod ctermfg=137 ctermbg=NONE cterm=NONE guifg=#c29863 guibg=NONE gui=NONE
hi htmlTag ctermfg=137 ctermbg=NONE cterm=NONE guifg=#9f785b guibg=NONE gui=NONE
hi htmlEndTag ctermfg=137 ctermbg=NONE cterm=NONE guifg=#9f785b guibg=NONE gui=NONE
hi htmlTagName ctermfg=137 ctermbg=NONE cterm=NONE guifg=#9f785b guibg=NONE gui=NONE
hi htmlArg ctermfg=137 ctermbg=NONE cterm=NONE guifg=#9f785b guibg=NONE gui=NONE
hi htmlSpecialChar ctermfg=167 ctermbg=NONE cterm=NONE guifg=#da5659 guibg=NONE gui=NONE
hi javaScriptFunction ctermfg=222 ctermbg=NONE cterm=NONE guifg=#f1e694 guibg=NONE gui=NONE
hi javaScriptRailsFunction ctermfg=137 ctermbg=NONE cterm=NONE guifg=#c29863 guibg=NONE gui=NONE
hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlKey ctermfg=58 ctermbg=NONE cterm=NONE guifg=#6d4c2f guibg=NONE gui=NONE
hi yamlAnchor ctermfg=103 ctermbg=NONE cterm=NONE guifg=#7989a6 guibg=NONE gui=NONE
hi yamlAlias ctermfg=103 ctermbg=NONE cterm=NONE guifg=#7989a6 guibg=NONE gui=NONE
hi yamlDocumentHeader ctermfg=107 ctermbg=NONE cterm=NONE guifg=#7ca563 guibg=NONE gui=NONE
hi cssURL ctermfg=103 ctermbg=NONE cterm=NONE guifg=#7989a6 guibg=NONE gui=NONE
hi cssFunctionName ctermfg=137 ctermbg=NONE cterm=NONE guifg=#c29863 guibg=NONE gui=NONE
hi cssColor ctermfg=167 ctermbg=NONE cterm=NONE guifg=#da5659 guibg=NONE gui=NONE
hi cssPseudoClassId ctermfg=58 ctermbg=NONE cterm=NONE guifg=#6d4c2f guibg=NONE gui=NONE
hi cssClassName ctermfg=58 ctermbg=NONE cterm=NONE guifg=#6d4c2f guibg=NONE gui=NONE
hi cssValueLength ctermfg=167 ctermbg=NONE cterm=NONE guifg=#da5659 guibg=NONE gui=NONE
hi cssCommonAttr ctermfg=167 ctermbg=NONE cterm=NONE guifg=#d77261 guibg=NONE gui=NONE
hi cssBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
"" Optimized Colorscheme for Better Readability
highlight clear

function s:highlight(group, bg, fg, style)
  let gui = a:style == '' ? '' : 'gui=' . a:style
  let fg = a:fg == '' ? '' : 'guifg=' . a:fg
  let bg = a:bg == '' ? '' : 'guibg=' . a:bg
  exec 'hi ' . a:group . ' ' . bg . ' ' . fg  . ' ' . gui
endfunction

" Softer colors optimized for reading
" let s:Color11 = '#728fcf'   " Lighter blue
" let s:Color6  = '#60c8e6'   " Softer cyan
" let s:Color3  = '#f25b85'   " Calmer red-pink
" let s:Color8  = '#e8e8e8'   " Slightly dimmed white
" let s:Color4  = '#b3d882'   " Calmer green
" let s:Color0  = '#f79f56'   " Softer orange
" let s:Color5  = '#f0f0e8'   " Softer off-white
" let s:Color10 = '#5a4037'   " Softer brown for errors
" let s:Color2  = '#c49eff'   " Softer purple
" let s:Color7  = '#1a1a1a'   " Darker background
" let s:Color9  = '#314f49'   " Darker teal for diff additions
" let s:Color1  = '#e6db8f'   " Softer yellow for strings
" let s:Color12 = '#262626'   " Darker for color columns

" a bit more constrasty
" Higher contrast colors
let s:Color11 = '#5f80d4'   " More vivid blue
let s:Color6  = '#3aaad3'   " More defined cyan
let s:Color3  = '#f6407b'   " More vibrant red-pink
let s:Color8  = '#f5f5f5'   " Brighter white
let s:Color4  = '#a5d554'   " Brighter green
let s:Color0  = '#f5893f'   " Higher contrast orange
let s:Color5  = '#f0f0e0'   " Off-white, but brighter
let s:Color10 = '#4b332c'   " Deeper brown for errors
let s:Color2  = '#b78fff'   " More vivid purple
let s:Color7  = '#141414'   " Darker background for higher contrast
let s:Color9  = '#2f4d4a'   " Darker teal for diff additions
let s:Color1  = '#f1d370'   " Brighter yellow for strings
let s:Color12 = '#1f1f1f'   " Darker for color columns


" Readability-optimized highlighting
call s:highlight('Comment', '', s:Color0, 'italic')
call s:highlight('String', '', s:Color1, '')
call s:highlight('Number', '', s:Color2, '')
call s:highlight('TSCharacter', '', s:Color2, '')
call s:highlight('Keyword', '', s:Color3, 'bold')
call s:highlight('Type', '', s:Color3, 'bold')
call s:highlight('Function', '', s:Color4, '')
call s:highlight('Error', s:Color10, s:Color5, 'bold')
call s:highlight('StatusLine', s:Color12, s:Color8, '')
call s:highlight('WildMenu', s:Color7, s:Color8, 'bold')
call s:highlight('Pmenu', s:Color7, s:Color8, '')
call s:highlight('PmenuSel', s:Color8, s:Color7, 'bold')
call s:highlight('PmenuThumb', s:Color7, s:Color8, '')
call s:highlight('DiffAdd', s:Color9, '', '')
call s:highlight('DiffDelete', s:Color10, '', '')
call s:highlight('Normal', s:Color7, s:Color8, '')
call s:highlight('Visual', s:Color9, '', 'bold')
call s:highlight('CursorLine', s:Color11, '', 'underline')
call s:highlight('ColorColumn', s:Color12, '', '')
call s:highlight('SignColumn', s:Color7, '', '')
call s:highlight('LineNr', '', s:Color6, '')
call s:highlight('TabLine', s:Color7, s:Color8, '')
call s:highlight('TabLineSel', s:Color8, s:Color7, 'bold')
call s:highlight('TabLineFill', s:Color7, s:Color8, '')
call s:highlight('TSPunctDelimiter', '', s:Color8, '')

highlight! link TSFunction Function
highlight! link TSConstant Constant
highlight! link TSRepeat Repeat
highlight! link TSNumber Number
highlight! link NonText Comment
highlight! link TSParameterReference TSParameter
highlight! link TSFloat Number
highlight! link Conditional Operator
highlight! link TSOperator Operator
highlight! link Folded Comment
highlight! link TSPunctSpecial TSPunctDelimiter
highlight! link TSComment Comment
highlight! link Whitespace Comment
highlight! link TSLabel Type
highlight! link TSPunctBracket MyTag
highlight! link TSString String
highlight! link TSType Type
highlight! link TSConditional Conditional
highlight! link TSProperty TSField
highlight! link TSConstBuiltin TSVariableBuiltin
highlight! link TSTagDelimiter Type
highlight! link TSParameter Constant
highlight! link TelescopeNormal Normal
highlight! link Macro Function
highlight! link Operator Keyword
highlight! link CursorLineNr Identifier
highlight! link TSTag MyTag
highlight! link TSFuncMacro Macro
highlight! link Repeat Conditional
highlight! link TSKeyword Keyword
highlight! link TSNamespace TSType
highlight! link TSField Constant


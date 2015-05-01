"Yara Syntax File"
"A constant work in progress, always in need of improvements
" 1) Add file to .vim/syntax
" 2) Add 'au BufRead,BufNewfile *.yara set filetype=yara' to .vimrc


if exists("b:current_syntax")
	finish
endif

syn keyword RuleTypes rule private global 
syn keyword RuleSections meta strings condition
syn keyword ConditionSpecifiers all and any at for in of or them
syn keyword FileLocations entrypoint filesize rva section
syn keyword StringWords ascii fullword nocase wide

"todo: should have contains in this list
syn keyword External include matches

syn keyword BooleanLogic false not true
syn keyword Int int8 int16 int32 uint8 uint16 uint32
syn keyword Indices index indexes

syn match Variables /$[a-zA-Z0-9_]*/
syn match VarLoc /@[a-zA-Z0-9_]\+\(\[[0-9]\+\]\)\?/
syn match VarOcc /#[a-zA-Z0-9_]\+/

syn match Hex /{[A-Fa-f0-9\? \[\]\-()|]*}/

"syn region IndexRange start=/(/ end=/)/
syn region Strings start=/"/ skip=/[^\\]\(\\\\\)*\\"/ end=/"/

"todo: fix delim
syn region Regex start=/\// skip=/[^\\]\(\\\\\)*\\\// end=/\//
syn region MultilineComments start=/\/\*/ end=/\*\//
syn match Comment /\/\/.*/

hi link RuleTypes Keyword
hi link RuleSections Keyword
hi link ConditionSpecifiers Operator
hi link FileLocations Constant
hi link StringWords Conditional
hi link External PreProc
hi link BooleanLogic Boolean
hi link Int Number
hi link Indices Constant
hi link Variables Type
hi link VarLoc Type
hi link VarOcc Type
hi link MultilineComments Comment
hi link Comments Comment
hi link Strings String
hi link Hex String
hi link Regex String
"hi link IndexRange String

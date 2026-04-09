" Vim syntax file
" Language: Stationeers IC10 assembly
" Maintainer: Renan Torres
" Latest Revision: 09 April 2026

if exists("b:current_syntax")
  finish
endif

" Comments
syn match ic10Comment "#\ .*$"

" Numbers
syn match ic10Number "\v\d+(\.\d+)?"
syn match ic10Number "\v0x[0-9a-fA-F]+"

" Instructions
syn keyword ic10Instruction l s move add sub mul div j jal jr bgt beq beqz bge sbn lbns lbn

" System Keywords
syn keyword ic10SysKeyword alias define yield sleep hcf

" Registers
syn match ic10Register "\<r\([0-9]\|1[0-5]\)\>"

" Devices
syn match ic10Device "\(d[0-5]\|db\)"

" Labels
syn match ic10Label "^[a-zA-Z][a-zA-Z0-9]*:"

" Highlight Linking
hi def link ic10Comment Comment
hi def link ic10Device Identifier
hi def link ic10Instruction Function
hi def link ic10Label Label
hi def link ic10Number Constant
hi def link ic10Register Identifier
hi def link ic10SysKeyword Keyword

let b:current_syntax = "ic10"

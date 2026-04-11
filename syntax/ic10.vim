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

" Operators
" System Keywords
syn keyword ic10SysKeyword alias define hcf sleep yield j jal jr
" Mathematical
syn keyword ic10Instruction abs add ceil div pow exp floor log max min mod move mul rand round sqrt sub trunc lerp
" Trigonometry
syn keyword ic10Instruction acos asin atan atan2 cos sin tan
" Stack
syn keyword ic10Instruction clr clrd get getd peek poke pop push put putd
" I/O
syn keyword ic10Instruction l lr ls s ss rmap lb lbn lbns lbs sb sbn sbs
" Bitwise
syn keyword ic10Instruction and nor not or sla sll sra srl xor ext ins
" Comparison
syn keyword ic10Instruction select seq sne sge sgt sle slt sap sapz
" Branching
syn keyword ic10Instruction beq bne bgt blt bge ble beqz bnez bgez blez bgtz bltz
" Relative Branching
syn keyword ic10Instruction breq brne brgt brlt brge brle breqz brnez brgez brlez brgtz brltz
" Branch and Link
syn keyword ic10Instruction beqal bneal bgtal bltal bgeal bleal beqzal bnezal bgezal blezal bgtzal bltzal

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

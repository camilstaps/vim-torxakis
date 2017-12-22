" Torxakis syntax file
" Language:   Torxakis
" Maintainer: Camil Staps <info@camilstaps.nl>
" License:    This file is placed in the public domain.

if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn keyword txsDef      TYPEDEF FUNCDEF CONSTDEF PROCDEF CHANDEF MODELDEF
			\ MAPPERDEF CNECTDEF STAUTDEF PURPDEF IF HIDE LET ACCEPT ELSE FI NI
			\ ENDDEF IN OUT CLIENTSOCK SERVERSOCK HOST PORT STATE VAR INIT
			\ TRANS FROM VIA TO VALUE BEHAVIOUR STOP EXIT ACCEPT ISTEP ERROR
			\ REGEX ENCODE DECODE GOAL HIT MISS CHAN THEN
syn keyword txsOp       False True isFalse isTrue toString fromString toXml
			\ fromXml not abs len at strinre
syn match   txsSmallId  "[a-z][A-Za-z0-9_]*" display
syn match   txsCapsId   "[A-Z][A-Za-z0-9_]*" display
syn region  txsString   start=+"+ skip=+\\\\\|\\"+ end=+"+ oneline
syn match   txsInteger  "[+-~]\?\<\(\d\+\|0[0-7]\+\|0x[0-9A-Fa-f]\+\)\>" display

syn keyword txsTodo     TODO FIXME NB contained containedin=txsComment,txsSComment
syn region  txsComment  start="{-"     end="-}" contains=txsComment,@Spell
syn region  txsComment  start="^\s*{-" end="-}" contains=txsComment,@Spell fold keepend extend
syn region  txsSComment start="--"      end="$" contains=@Spell oneline display

hi def link txsDef      Keyword
hi def link txsOp       Operator
hi def link txsSmallId  Function
hi def link txsCapsId   Type
hi def link txsString   String
hi def link txsInteger  Number
hi def link txsTodo     Todo
hi def link txsComment  Comment
hi def link txsSComment Comment

let b:current_syntax = 'torxakis'

let &cpo = s:cpo_save
unlet s:cpo_save

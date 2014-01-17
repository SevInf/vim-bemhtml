" Vim syntax file
" Language: bemhtml template engine
" Maintainer: Sergej Tataarincev <sevinf@yandex-team.ru>
" License: MIT

if exists("b:current_syntax")
    finish
endif

runtime! syntax/javascript.vim

syn keyword bemhtmlEntity block elem mod elemMod nextgroup=bemhtmlEntityName skipwhite skipempty
syn match bemhtmlEntityName contained /[a-zA-Z0-9-]\+/ nextgroup=@bemhtmlAfterPredicate skipwhite skipempty

syn match bemhtmlMode contained /[a-zA-Z0-9]\+/ nextgroup=@bemhtmlAfterPredicate skipwhite skipempty

syn match bemhtmlJsStart contained ":" transparent nextgroup=@jsExpression skipwhite skipempty
syn match bemhtmlPredicateComma contained "," transparent nextgroup=@bemhtmlPredicate skipwhite skipempty

syn region bemhtmlBody contained matchgroup=bemhtmlBody start="{" end="}" contains=@bemhtmlPredicate

syn cluster bemhtmlPredicate contains=bemhtmlEntity,bemhtmlMode,@jsExpression
syn cluster bemhtmlAfterPredicate contains=bemhtmlPredicateComma,bemhtmlJsStart,bemhtmlBody

highlight link bemhtmlEntity Keyword
highlight link bemhtmlEntityName Identifier
highlight link bemhtmlMode Conditional

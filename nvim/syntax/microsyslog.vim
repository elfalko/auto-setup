" Vim syntax file
" Language:         Microsys log file
" Maintainer:       Falk Schoenfeld <https://github.com/elfalko>
" Latest Revision:  2025-07-16

syn keyword logLevelEmergency EMERGENCY EMERG
syn keyword logLevelAlert ALERT
syn keyword logLevelCritical CRITICAL CRIT FATAL
syn keyword logLevelError ERROR ERR FAILURE SEVERE
syn keyword logLevelWarning WARNING WARN
syn keyword logLevelNotice NOTICE
syn keyword logLevelInfo INFO
syn keyword logLevelDebug DEBUG FINE
syn keyword logLevelTrace TRACE FINER FINEST

syn keyword testStateOk SUCCESS
syn keyword testStateWarn IGNORED

syn match testPhase '^\[[^\]]*\]'
syn match MsgSeparator '^[=_]{5,100}'


hi def link logLevelEmergency ErrorMsg
hi def link logLevelAlert ErrorMsg
hi def link logLevelCritical ErrorMsg
hi def link logLevelError ErrorMsg
hi def link logLevelWarning WarningMsg
hi def link logLevelNotice Character
hi def link logLevelInfo Repeat
hi def link logLevelDebug Debug
hi def link logLevelTrace Comment

hi def link testStateOk DiagnosticSignOk
hi def link testStateWarn DiagnosticSignWarn

hi def link testPhase Identifier
" hi def link seperator MsgSeparator


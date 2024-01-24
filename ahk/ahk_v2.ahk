#Include ./capskiller.ahk

CapsLock & r::Reload()  ; Assign Ctrl-Alt-R as a hotkey to restart the script.

#Include ./programlaunch.ahk
#Include ./workspacehandling.ahk

>!j::
{
Send("{Down}")
return
}

>!k::
{
Send("{Up}")
return
}

#Include ./windowhandling.ahk
#Include ./bracketslefthand.ahk
#Include ./germansymbols.ahk


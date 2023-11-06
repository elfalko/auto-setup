SetCapsLockState("AlwaysOff")
return

; Launch programs
CapsLock & Enter::
{
Run("chrome.exe")
return
}

CapsLock & Space::
{ 
Run("wt.exe")
return
} 

; Quicky switch workspaces
CapsLock & n::
{
Send("^#{Right}")
return
}

CapsLock & p::
{
Send("^#{Left}")
return
}

; Quickly align windows

CapsLock & h::
{
Send("#{Left}")
return
}

CapsLock & l::
{
Send("#{Right}")
return
}

CapsLock & q::Send("!{f4}")

; Quickly switch windows
CapsLock & j::AltTab
CapsLock & k::ShiftAltTab

CapsLock & r::Reload()  ; Assign Ctrl-Alt-R as a hotkey to restart the script.

ralt & j::
{
Send("{Down}")
return
}

ralt & k::
{
Send("{Up}")
return
}

; Easier brackets
ralt & e::
{
Send("{{}")
return
}

ralt & r::
{
Send("{}}")
return
}

ralt & d::
{
Send("{(}")
return
}

ralt & f::
{
Send("{)}")
return
}

ralt & c::
{
Send("{[}")
return
}

ralt & v::
{
Send("{]}")
return
}

!a::
{
Send("{ä}")
return
}

+!a::
{
Send("{Ä}")
return
}


!u::
{
Send("{ü}")
return
}

+!u::
{
Send("{Ü}")
return
}

!o::
{
Send("{ö}")
return
}

+!o::
{
Send("{Ö}")
return
}

!s::
{
Send("{ß}")
return
}
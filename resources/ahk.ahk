SetCapsLockState, AlwaysOff
return

; Launch programs
CapsLock & Enter::
run chrome.exe
return

CapsLock & Space::
run wt.exe
return

; Quicky switch workspaces
CapsLock & n::
Send, ^#{Right}
return

CapsLock & p::
Send, ^#{Left}
return

; Quickly align windows
CapsLock & h::
Send, #{Left}
return

CapsLock & l::
Send, #{Right}
return

; Quickly switch windows
CapsLock & j::AltTab
CapsLock & k::ShiftAltTab

CapsLock & r::Reload  ; Assign Ctrl-Alt-R as a hotkey to restart the script.

Alt & j::
Send, {Down} 
return

Alt & k::
Send, {Up}  
return

; Easier brackets
Alt & e::
Send, {{}
return

Alt & r::
Send, {}}
return

Alt & d::
Send, {(}
return

Alt & f::
Send, {)}
return

Alt & c::
Send, {[}
return

Alt & v::
Send, {]}
return


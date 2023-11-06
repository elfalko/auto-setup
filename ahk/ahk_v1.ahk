SetCapsLockState, AlwaysOff
return

; Launch programs
CapsLock & Enter::
run chrome.exe
return

; Launch programs
CapsLock & c::
run chrome.exe cube-system-test-1 cube-system-test-2 cube-system-test-3 cube-system-test-4 cube-system-test-5
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

CapsLock & q:: Send !{f4}

; Quickly switch windows
CapsLock & j::AltTab
CapsLock & k::ShiftAltTab

CapsLock & r::Reload  ; Assign Ctrl-Alt-R as a hotkey to restart the script.

ralt & j::
Send, {Down} 
return

ralt & k::
Send, {Up}  
return

; Easier brackets
ralt & e::
Send, {{}
return

ralt & r::
Send, {}}
return

ralt & d::
Send, {(}
return

ralt & f::
Send, {)}
return

ralt & c::
Send, {[}
return

ralt & v::
Send, {]}
return

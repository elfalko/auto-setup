; window handling

; Quickly switch windows
CapsLock & j::AltTab
CapsLock & k::ShiftAltTab

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

; window sizing

; close window
CapsLock & q::Send("!{f4}")

;Fullscreen 
CapsLock & f::Send "{F11}"

;multiscreen fullscreen stuff https://stackoverflow.com/questions/9828808/how-can-i-maximize-a-window-across-multiple-monitors/9830200#9830200
#f::
{
    Title := WinGetTitle("A")
    WinRestore(Title)
    X1 := SysGet(76)
    Y1 := SysGet(77)
    Width := SysGet(78)
    Height := SysGet(79)
    WinMove(X1, Y1, Width, Height, Title)
}

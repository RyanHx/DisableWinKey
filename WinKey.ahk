#Requires AutoHotkey v2.0

DisableWinKey := false
SetTimer isWindowFullScreen, 250

LWin::
RWin::
{
	global DisableWinKey
	if (!DisableWinKey)
	{
		Send "{LWin down}"		
	}
}

LWin up::
RWin up::
{
	Send "{LWin up}"
}

F9::ExitApp

isWindowFullScreen()
{
	;checks if the active window is full screen
	WinID := WinExist("A") 
	if (!WinID)
	{		
		return
	}        		
	style := WinGetStyle(WinID)
	;WinGet, style, Style, ahk_id %WinID%
	; 0x800000 is WS_BORDER.
	; 0x20000000 is WS_MINIMIZE.
	; no border and not minimized
	global DisableWinKey := (style & 0x20800000) ? false : true	
}
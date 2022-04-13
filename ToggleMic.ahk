; ToggleMic.ahk
;
; Author: Peter Provost
; Git Repo: http://github.com/PProvost/AutoHotKey
; 
; Description: Toggles the microphone on and off when mouse 
; button 4 is pressed

#NoEnv
#SingleInstance force

; Ctrl+Shift+M will toggle the microphone mute
; state. Note: the mixer value (14) may need to change for your
; system. Use the SoundCardAnalysis script from the AHK docs
; for the SoundSet function to find your mixer value.
^+M::
	SoundSet, +1, MASTER, mute, 14
	SoundGet, master_mute, , mute, 14

	If mute = On
		soundfile = %A_WinDir%\Media\Windows Logoff Sound.wav
	Else
		soundfile = %A_WinDir%\Media\Windows Logon Sound.wav

	SoundPlay, %soundfile%
	; TrayTip, ToggleMic, %soundfile%, 3
	TrayTip, ToggleMic, Microphone mute is %master_mute%, 3
return

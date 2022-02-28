#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         KAlexK

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#include <AutoItConstants.au3>
; Matches any substring in the title.
Opt("WinTitleMatchMode", 2)
; Run SSDPower.exe
Local $iPID = ShellExecute ("SSDPower.exe", " conf.txt data", "", "", @SW_MINIMIZE)
ShellExecuteWait ("test.bat")
; Wait for 2 seconds.
;Sleep(2000)
WinActivate ("SSDPower.exe")
WinWaitActive("SSDPower.exe")
Send ("s")



